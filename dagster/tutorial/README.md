# Tutorial Template Project

This is a [Dagster](https://dagster.io/) project made to be used alongside the official [Dagster tutorial](https://docs.dagster.io/tutorial).



- Create a virtual environment

    `python3 -m venv .venv`

- Activate venv
    `source .venv/bin/activate`

- Install *dagster* : 

    `pip install dagster`

- Create a new dagster project (Ej. tutorial)

    `dagster project scaffold --name tutorial`

    *Note:* This directory is a fully functionating Python package

- Get into the new created folder

    `cd tutorial`

- Install the code location as a Python package

    `pip install -e ".[dev]`


- Start teh Dasgter UI

    `dasgster dev`

- Open http://127.0.0.1:3000/ in your browser 

    *Note:* In case of multiple runnings the port will be randomly stablished. Check the terminal output to verify.


