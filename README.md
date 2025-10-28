# Linux — Bash Automation Labs & Utilities

> A collection of Bash scripts to automate Linux system setup, file management, monitoring, and log analysis. Includes a script to provision a LAMP stack with WordPress.

## 🌟 Overview
This repository groups small, task‑focused shell utilities under one roof. They’re meant to be readable, modular, and safe to run on a fresh VM for practice. Most logic is written in POSIX/Bash (repo language breakdown shows Shell ≈99%).

## ✨ What’s inside
- **System provisioning**: LAMP stack bootstrap + optional WordPress install
- **File & directory utilities**: create, move, rename, deduplicate, archive
- **Monitoring helpers**: quick CPU/memory/disk snapshots, top processes, services
- **Log tools**: rotate, tail/grep, summarize common patterns
- **Tiny helpers in Python (if any)** for parsing/formatting (minor part of the repo)

> Tip: Keep commands idempotent (safe to run multiple times) and support `--dry-run` wherever possible.

## 📁 Repository Structure
```
Linux/
├─ labs/                # Self-contained demo labs / exercises
├─ README.md            # You are here
└─ .gitignore
```
If you add more folders later (e.g., `scripts/`, `bin/`, or `playbooks/`), reflect them here.

## 🧰 Requirements
- Debian/Ubuntu or compatible distro (tested on recent LTS versions)
- `bash` (≥ 4.x), `sudo` access for provisioning tasks
- Package manager available (`apt`, optional `snap`)
- Network access for package installation and WordPress download (where applicable)

## 🚀 Quick Start
```bash
# 1) Clone
git clone https://github.com/AlanYu0321/Linux.git
cd Linux

# 2) Inspect scripts (always read before executing on important machines)
ls -lah labs

# 3) Make a script executable and run it
chmod +x labs/<script>.sh
./labs/<script>.sh --help    # check usage first
```

### Running with elevated privileges
Some provisioning tasks require root privileges:
```bash
sudo ./labs/<provision_script>.sh --dry-run
sudo ./labs/<provision_script>.sh
```

## 🧪 LAMP + WordPress (example workflow)
Below is an example outline for a provisioning script; adapt to the actual file name and flags in `labs/`.

```bash
# Dry-run to preview actions (recommended)
sudo ./labs/setup_lamp_wordpress.sh --dry-run

# Actual run (installs Apache, MariaDB/MySQL, PHP, sets up vhost, and WordPress)
sudo ./labs/setup_lamp_wordpress.sh   --db-user wp_user   --db-pass 'strong_password'   --site-domain example.local   --wp-title "My Blog"   --wp-admin-user admin   --wp-admin-pass 'another_strong_password'
```

**What the script typically does** (adjust per your actual implementation):
- Installs **Apache**, **MariaDB/MySQL**, **PHP** and common extensions
- Creates a database + user for WordPress
- Downloads and configures **WordPress**
- Sets Apache virtual host, enables modules, restarts services
- Prints post‑install notes and defaults

## 🔍 Monitoring & Logs (examples)
- **System snapshot**: `./labs/sys_snapshot.sh` → CPU/mem/disk and top processes
- **Tail and filter logs**: `./labs/log_watch.sh --file /var/log/syslog --grep ERROR`
- **Rotate archives**: `./labs/log_rotate.sh --keep 7 /var/log/myapp/*.log`

> Replace the names above with the exact scripts you have in `labs/`. If a script accepts flags, document them in a `--help` section and mirror that here.

## 🛡️ Safety & Conventions
- Prefer **non‑interactive** flags (for automation) with sensible defaults
- Provide `--dry-run` and `--verbose` where meaningful
- Exit on error (`set -euo pipefail`) and use traps for cleanup
- Print a **summary** at the end (what changed, where logs are)
- Keep secrets out of the repo; read from environment variables or prompt securely

## 🧩 Script Template
```bash
#!/usr/bin/env bash
set -euo pipefail

usage() {
  cat <<EOF
Usage: ${0##*/} [--dry-run] [--verbose] [--help]
Description: One-line summary of this script.
Options:
  --dry-run     Print actions without executing
  --verbose     More logs
  --help        Show this help and exit
EOF
}

DRY_RUN=0
VERBOSE=0

for arg in "$@"; do
  case "$arg" in
    --dry-run) DRY_RUN=1 ;;
    --verbose) VERBOSE=1 ;;
    --help) usage; exit 0 ;;
    *) echo "Unknown option: $arg" >&2; usage; exit 1 ;;
  esac
done

run() { if [[ $DRY_RUN -eq 1 ]]; then echo "[DRY] $*"; else eval "$@"; fi; }

# Example
run "sudo apt-get update -y"
run "sudo apt-get install -y apache2"
```
