# Tutorial Template Project

This is a [Dagster](https://dagster.io/) project made to be used alongside the official [Dagster tutorial](https://docs.dagster.io/tutorial).


## Initial setup

- Create a virtual environment

    `python3 -m venv .venv`

- Activate venv
    `source .venv/bin/activate`

- Install *dagster* : 

    `pip install dagster`

## Project creation

- Create a new dagster project (Ej. tutorial)

    `dagster project scaffold --name tutorial`

    *Note:* This directory is a fully functionating Python package

- Get into the new created folder

    `cd tutorial`

- Install the code location as a Python package

    `pip install -e ".[dev]`

### Check up

- Start the Dasgter UI

    `dasgster dev`

- Open http://127.0.0.1:3000/ in your browser 

    *Note:* In case of multiple runnings the port will be randomly stablished. Check the terminal output to verify.


## Asset definition

Define assets into the assets.py file in the project (tutorial)

<details><summary>tutorial/assets.py</summary>

```python
import base64
import json
import os

import pandas as pd
import requests

# Chart plot imports
from io import BytesIO
import matplotlib.pyplot as plt

from dagster import asset, AssetExecutionContext, MetadataValue, MaterializeResult


@asset
def topstory_ids() -> None:
    newstories_url = "https://hacker-news.firebaseio.com/v0/topstories.json"
    top_new_story_ids = requests.get(newstories_url).json()[:100]

    os.makedirs("data", exist_ok=True)
    with open("data/topstory_ids.json", "w") as f:
        json.dump(top_new_story_ids, f)


@asset(deps=[topstory_ids])  # This asset depends on topstory_ids
# def topstories(context: AssetExecutionContext) -> None:
def topstories(context: AssetExecutionContext) -> MaterializeResult:
    with open("data/topstory_ids.json", "r") as f:
        topstory_ids = json.load(f)

    results = []
    for item_id in topstory_ids:
        item = requests.get(
            f"https://hacker-news.firebaseio.com/v0/item/{item_id}.json"
        ).json()
        context.log.info(f"Append item: {item}")

        results.append(item)

        if len(results) % 20 == 0:
            context.log.info(f"Got {len(results)} items so far.")
            # print(f"Got {len(results)} items so far.")

    df = pd.DataFrame(results)
    df.to_csv("data/topstories.csv")

    return MaterializeResult(
        metadata={
            "num_records": len(df),
            "preview": MetadataValue.md(df.head().to_markdown()),
        },
    )


@asset(deps=[topstories])
def most_frequent_words() -> MaterializeResult:
    stopwords = ["a", "the", "an", "of", "to", "in", "for", "and", "with", "on", "is"]

    topstories = pd.read_csv("data/topstories.csv")

    # loop through the titles and count the frequency of each word
    word_counts = {}
    for raw_title in topstories["title"]:
        title = raw_title.lower()
        for word in title.split():
            cleaned_word = word.strip(".,-!?:;()[]'\"-")
            if cleaned_word not in stopwords and len(cleaned_word) > 0:
                word_counts[cleaned_word] = word_counts.get(cleaned_word, 0) + 1

    # Get the top 25 most frequent words
    top_words = {
        pair[0]: pair[1]
        for pair in sorted(word_counts.items(), key=lambda x: x[1], reverse=True)[:25]
    }

    # Make a bar chart of the top 25 words
    plt.figure(figsize=(10, 6))
    plt.bar(list(top_words.keys()), list(top_words.values()))
    plt.xticks(rotation=45, ha="right")
    plt.title("Top 25 words in Hacker News Titles")
    plt.tight_layout()

    # Convert the image to a saveable format
    buffer = BytesIO()
    plt.savefig(buffer, format="png")
    image_data = base64.b64encode(buffer.getvalue())

    # Convert the image to Markdown to preview it within Dagster
    md_content = f"![img](data:image/png;base64,{image_data.decode()})"
   
    with open("data/most_frequent_words.json", "w") as f:
        json.dump(top_words, f)

    # Attach the Markdown content as metadata to the asset
    return MaterializeResult(metadata={"plot": MetadataValue.md(md_content)})
```
</details>

## Add job

Jobs lets you target a selection of asets to materialize them together as a single action.

<details><summary>__init__.py</summary>

```python
from dagster import (
    AssetSelection,
    Definitions,
    define_asset_job,
    load_assets_from_modules,
)

from . import assets

all_assets = load_assets_from_modules([assets])

# Addition: define a job that will materialize the assets
hackernews_job = define_asset_job("hackernews_job", selection=AssetSelection.all())

defs = Definitions(
    assets=all_assets,
    jobs=[hackernews_job],  # Addition: add the job to Definitinos object
)
```
</details>

## Schedule materializations

After the job definition it can be attached to a schedule with the *ScheduleDefinition* class.

<details><summary>__init__.py</summary>

```python
# Addition: a ScheduleDefinition the job it should run and a cron schedule of how frequently to run it
hackernews_schedule = ScheduleDefinition(
    job=hackernews_job,
    cron_schedule="0 * * * *",  # every hour
)
```
</details>


## Connecting to external services (APIs)

The generated scaffolded Dagster project has a directory called resources with an __init__.py file in it. It exposes a resource called DataGeneratorResource. This resource generates simulated data about Hacker News signups.

You'll use this resource to get the data needed to produce an asset for analysis.

We immport he class and create an instance of it and add it to the resources as follows:

<details><summary>__init__.py</summary>

```python
from .resources import DataGeneratorResource
# ...
datagen = DataGeneratorResource()  # Make the resource

defs = Definitions(
    assets=all_assets,
    schedules=[hackernews_schedule],
    resources={
        "hackernews_api": datagen,  # Add the newly-made resource here
    },
)
```
</details>

To confirm it is working:
- Reload definitions in Dagster web UI (Assets\Reload Definitions)
- Go to Overview\Resources and find *hackernews_api* resource.

### Using the resource

In *assets.py* add a new asset called **signups** to fetch data from a simulated external service.

<details><summary>assets.py</summary>

```python
@asset
def signups(hackernews_api: DataGeneratorResource) -> MaterializeResult:
    signups = pd.DataFrame(hackernews_api.get_signups())

    signups.to_csv("data/signups.csv")

    return MaterializeResult(
        metadata={
            "Record Count": len(signups),
            "Preview": MetadataValue.md(signups.head().to_markdown()),
            "Earliest Signup": signups["registered_at"].min(),
            "Latest Signup": signups["registered_at"].max(),
        }
    )
```
</details>


