# Development Setup Guide

## Pre-commit Hooks

This repository uses [pre-commit](https://pre-commit.com/) framework to ensure code quality and consistency across all development environments.

### What's Included

- **README Date Check**: Automatically validates that the "Last updated:" date in README.md matches the current date when README.md is modified.

### Setup Instructions

#### Prerequisites
- Python 3.6+ installed
- Git repository cloned

#### Installation Steps

1. **Install pre-commit framework:**
   ```bash
   pip3 install pre-commit
   pip3 install pre-commit
   # or
   python3 -m pip install pre-commit
   ```

2. **Install the git hooks:**
   ```bash
   pre-commit install
   # or if pre-commit is not in PATH:
   python3 -m pre_commit install
   ```

3. **Verify installation:**
   ```bash
   pre-commit --version
   ```

### How It Works

#### README Date Check Hook

**Purpose**: Ensures that when README.md is modified, the "Last updated:" date at the bottom of the file matches the current date.

**Trigger**: Automatically runs on every commit when README.md is staged.

**Behavior**:
- ✅ **Success**: If README.md has the correct current date → Commit proceeds
- ❌ **Failure**: If README.md has an incorrect date → Commit blocked with helpful error message

**Example Output**:
```
README.md has been modified. Checking "Last updated:" date...
✅ README.md "Last updated:" date is current: August 2025
```

**Error Example**:
```
README.md has been modified. Checking "Last updated:" date...
❌ ERROR: README.md "Last updated:" date is not current!
   Expected: August 2025
   Please update the "Last updated:" line in README.md to: "Last updated: August 2025"

   Current "Last updated:" line in README.md:
*Last updated: July 2025*

   Please fix this before committing.
```

### Configuration Files

- `.pre-commit-config.yaml` - Main configuration file defining all hooks
- `scripts/check_readme_date.sh` - Bash script for README date validation

### Manual Testing

You can manually run the hooks without committing:

```bash
# Run all hooks on staged files
pre-commit run

# Run specific hook
pre-commit run readme-date-check

# Run hooks on all files (not just staged)
pre-commit run --all-files
```

### Troubleshooting

#### Hook Not Running
- Ensure pre-commit is installed: `pre-commit --version`
- Reinstall hooks: `pre-commit install`
- Check if hooks are executable: `ls -la .git/hooks/`

#### Date Format Issues
The hook uses `LC_TIME=C` to ensure consistent date formatting across different locales:
```bash
LC_TIME=C date "+%B %Y"  # Output: "August 2025"
```

#### Skipping Hooks (Emergency Only)
If you need to bypass hooks in an emergency:
```bash
git commit --no-verify -m "Emergency commit"
```

### Adding New Hooks

To add additional pre-commit hooks:

1. Edit `.pre-commit-config.yaml`
2. Add new hook configuration
3. Run `pre-commit install` to update hooks
4. Test the new hook

### Benefits

- **Consistency**: Ensures all developers follow the same standards
- **Automation**: No need to remember manual checks
- **Portability**: Works on any machine with the same setup
- **Version Control**: Hook configuration is tracked in the repository

### Cross-Platform Compatibility

This setup works on:
- ✅ macOS
- ✅ Linux
- ✅ Windows (with Git Bash or WSL)

The pre-commit framework handles the differences between operating systems automatically.

---

*For more information about pre-commit, visit: https://pre-commit.com/*
