#!/bin/bash

sudo systemctl restart tlp

systemctl --user restart dunst
systemctl --user restart redshift
