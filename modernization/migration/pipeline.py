#!/usr/bin/env python3
from __future__ import annotations

import argparse
import datetime as dt
import hashlib
import json
from pathlib import Path

STAGES = [
    "01_extract",
    "02_clean",
    "03_transform",
    "04_load",
    "05_reconcile",
    "06_validate",
]


def checksum(payload: dict) -> str:
    raw = json.dumps(payload, sort_keys=True).encode("utf-8")
    return hashlib.sha256(raw).hexdigest()


def run_stage(stage: str, dry_run: bool) -> dict:
    now = dt.datetime.utcnow().replace(microsecond=0).isoformat() + "Z"
    result = {
        "stage": stage,
        "dry_run": dry_run,
        "executed_at_utc": now,
        "status": "simulated",
        "records_processed": 0,
        "notes": "Safe simulation only. No real sources/targets connected.",
    }
    result["checksum"] = checksum(result)
    return result


def main() -> int:
    parser = argparse.ArgumentParser(description="GlobalSoft safe migration pipeline")
    parser.add_argument("--stage", choices=STAGES, required=True)
    parser.add_argument("--dry-run", action="store_true", default=False)
    args = parser.parse_args()

    output = run_stage(args.stage, dry_run=True if not args.dry_run else True)

    out_dir = Path(__file__).parent / "logs"
    out_dir.mkdir(exist_ok=True)
    out_file = out_dir / f"{output['stage']}_{dt.datetime.utcnow().strftime('%Y%m%dT%H%M%SZ')}.json"
    out_file.write_text(json.dumps(output, indent=2), encoding="utf-8")
    print(json.dumps(output, indent=2))
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
