#!/bin/bash
export MIX_ENV=prod
export PORT=4500
echo "Stopping old copy of app, if any..."

_build/prod/rel/campus_police/bin/campus_police stop || true

echo "Starting app..."

#_build/prod/rel/campus_police/bin/campus_police start
_build/prod/rel/campus_police/bin/campus_police foreground
