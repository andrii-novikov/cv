# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Project Overview

Jekyll-based static CV/resume site deployed via GitHub Pages. The primary content lives in `README.md`, which Jekyll renders as the homepage.

## Commands

```bash
# Local development
bundle install          # Install Ruby dependencies
bundle exec jekyll serve  # Serve at http://localhost:4000

# Pre-commit hooks setup (required once per machine)
pip3 install pre-commit
pre-commit install

# Manual hook execution
pre-commit run                     # Run on staged files
pre-commit run readme-date-check   # Run specific hook
pre-commit run --all-files
```

## Architecture

- **`README.md`** — The CV content. Jekyll converts this to the site homepage.
- **`_config.yml`** — Jekyll config: remote theme (pages-themes/minimal), site title, profile logo, PDF button in header.
- **`assets/css/style.scss`** — Custom styles on top of the minimal theme. Includes PDF button styling and print media query.
- **`scripts/check_readme_date.sh`** — Pre-commit hook that validates `README.md` has `Last updated: <current Month YYYY>` whenever the file is staged.

## Key Conventions

### README Date
When modifying `README.md`, always update the `Last updated:` line at the bottom to the current month/year:
```
*Last updated: April 2026*
```
The pre-commit hook enforces this and will block commits if the date is wrong.

### Commit Messages
Follow Conventional Commits format: `<type>(optional-scope): <short summary>`

Types: `feat`, `fix`, `docs`, `chore`, `refactor`, `test`, `ci`, `build`, `perf`, `style`, `revert`

Examples:
- `docs: update work experience at EPAM Systems`
- `feat: add skills section for AI tools`
- `fix: correct employment date formatting`
