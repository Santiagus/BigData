from dagster import (
    AssetSelection,
    Definitions,
    ScheduleDefinition,
    define_asset_job,
    load_assets_from_modules,
    EnvVar,
)

from . import assets
from . import resources

all_assets = load_assets_from_modules([assets])

# Addition: define a job that will materialize the assets
hackernews_job = define_asset_job("hackernews_job", selection=AssetSelection.all())

# Addition: a ScheduleDefinition the job it should run and a cron schedule of how frequently to run it
hackernews_schedule = ScheduleDefinition(
    job=hackernews_job,
    cron_schedule="0 * * * *",  # every hour
)

datagen = resources.DataGeneratorResource(
    num_days=EnvVar.int("HACKERNEWS_NUM_DAYS_WINDOW"),
)

defs = Definitions(
    assets=all_assets,
    jobs=[hackernews_job],  # Addition: add the job to Definitinos object
    schedules=[hackernews_schedule],  # Addition: add the schedule Definitinos object
    resources={
        "hackernews_api": datagen,  # Add the newly-made resource here
    },
)
