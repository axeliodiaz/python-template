# Python Template
For many times we have to write the same code again and again.

## Requirements
- `base.txt`:
- `local.txt`:
- `prod.txt`:
- `requirements.txt`:

## Pre-Commit
We have pre-commit hooks with black configured. To use this you must install all local requirements:
```bash
pip install -r requirements/local.txt
```

And install pre-commit hooks:
```bash
pre-commit install
```

## Tests
A dummy test is included but should be removed and use your own tests. This is only for the github actions can work.