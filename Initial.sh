#!/bin/sh

SOURCE_DIR="${1:-.}"
BACKUP_DIR="backup_$(date '+%Y%m%d_%H%M%S')"

mkdir -p "$BACKUP_DIR"

find "$SOURCE_DIR" -maxdepth 1 -type f \( -name "*.txt" -o -name "*.log" \) -exec cp {} "$BACKUP_DIR" \;

file_count=$(find "$BACKUP_DIR" -type f | wc -l)
total_size=$(du -sh "$BACKUP_DIR" | awk '{print $1}')

echo "Backup Report"
echo "============="
echo "Source: $SOURCE_DIR"
echo "Destination: $BACKUP_DIR"
echo "Files: $file_count"
echo "Total Size: $total_size"
echo
echo "Backup completed successfully."