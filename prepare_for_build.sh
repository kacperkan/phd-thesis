#!/bin/sh

for output_dir in $(find fig -type d)
do
  mkdir "aux/${output_dir}" 2>/dev/null
done

for output_dir in $(find tabs -type d)
do
  mkdir "aux/${output_dir}" 2>/dev/null
done

for output_dir in $(find sections -type d)
do
  mkdir "aux/${output_dir}" 2>/dev/null
done
