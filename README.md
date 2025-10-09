# Python Template

A lightweight starting point for Python projects with opinionated tooling preconfigured. It includes:
- Dependency management via plain requirements files (base/local/prod)
- Code formatting with Black and import sorting with isort (configured in pyproject.toml)
- Pre-commit hooks to enforce style locally
- Pytest setup with an example test to verify CI wiring

Target Python version: 3.12+

## Quick start

1) Create and activate a virtual environment
- macOS/Linux:
  ```bash
  python3 -m venv .venv
  source .venv/bin/activate
  ```
- Windows (PowerShell):
  ```powershell
  py -3 -m venv .venv
  .venv\Scripts\Activate.ps1
  ```

2) Install dependencies
- Development setup (with pre-commit and tooling):
  ```bash
  pip install -r requirements/local.txt
  ```
- Production/runtime setup (only what the app needs to run):
  ```bash
  pip install -r requirements/prod.txt
  ```
- Minimal/base (shared by both):
  ```bash
  pip install -r requirements/base.txt
  ```
  Or use the convenience file at project root:
  ```bash
  pip install -r requirements.txt
  ```

## Requirements layout
- requirements/base.txt — core dependencies shared by all environments (e.g., black, pytest in this template)
- requirements/local.txt — extends base with developer-only tools (pre-commit, setuptools, etc.)
- requirements/prod.txt — extends base for production/runtime installs
- requirements.txt — convenience file that just includes base

Adjust these files as your project evolves.

## Pre-commit hooks
We use pre-commit to enforce formatting and basic checks before each commit.

Install local tooling and set up hooks:
```bash
pip install -r requirements/local.txt
pre-commit install
```

Run hooks on all files anytime:
```bash
pre-commit run --all-files
```

Formatting is handled by Black (line length 100) and import ordering by isort, both configured in pyproject.toml.

## Running tests
Pytest is configured. Run the test suite with:
```bash
pytest -q
```
A dummy test is included under tests/ as a placeholder—replace it with real tests when you start building features.

## Project structure
- README.md — this file
- pyproject.toml — formatter/sorter configuration (Black, isort)
- requirements/ — dependency spec files (base/local/prod)
- requirements.txt — convenience include for base
- tests/ — pytest tests (contains a dummy example)

## CI
This template is suitable for plugging into CI to run linting and tests. The included dummy test exists so CI pipelines can execute successfully out of the box; replace it as soon as you add real code.

## Run with Docker
You can use Docker to build and run the project without setting up a local Python environment.

Prerequisites: Docker Desktop or a compatible Docker Engine installed and running.

Basic usage:
```bash
# Build images defined in docker-compose.yml
docker compose build

# Start the services (will run pytest by default as defined in docker-compose.yml)
docker compose up
```

Notes:
- The docker-compose.yml mounts the project into /app and runs `pytest -q` by default.
- Stop the stack with Ctrl+C (in the same terminal) or by running `docker compose down` in another terminal.
