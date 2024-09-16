#!/bin/bash

sleep 0.1 && grim -g "$(slurp)" - | swappy -f -
