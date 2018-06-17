#!/usr/bin/env bash

mkdir -p /project/data/ && cd /project/data
kaggle competitions download -c freesound-audio-tagging
cd - > /dev/null
