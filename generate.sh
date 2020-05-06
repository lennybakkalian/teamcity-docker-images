#!/bin/bash

rm -rf "generated"

dotnet run -p tool/TeamCity.Docker/TeamCity.Docker.csproj -f $1 -- generate -s configs -f "configs/common.config;configs/windows.config;configs/linux.config" -c context -t generated -d .teamcity -b TC2019_2_BuildDist -r PROJECT_EXT_2307
