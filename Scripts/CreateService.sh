#!/bin/bash

Cyan='\033[0;36m'
Default='\033[0;m'

confirmed="n"
year=`date +%Y`

ServiceName="____ServiceName____"

getServiceName() {
    read -p "Enter Service Name: " ServiceName

    if test -z "$ServiceName"; then
        getServiceName
    fi
}

getInfomation() {
    getServiceName

    echo -e "\n${Default}================================================"
    echo -e "  Service Name : ${Cyan}${ServiceName}${Default}"
    echo -e "================================================\n"
}

# start here
while [ "$confirmed" != "y" -a "$confirmed" != "Y" ]
do
    if [ "$confirmed" == "n" -o "$confirmed" == "N" ]; then
        getInfomation
    fi
    read -p "confirm? (y/n):" confirmed
done

TargetServicePath="../____ProjectName____/____ProjectName____/Service/${ServiceName}.swift"

cp ./templates/Service.swift "$TargetServicePath"

sed -i "" "s:__year__:${year}:g"                    "$TargetServicePath"
sed -i "" "s:__ServiceName__:${ServiceName}:g"      "$TargetServicePath"

pbxproj folder ../____ProjectName____.xcodeproj ../____ProjectName____ -e "\.DS_Store|Base\.lproj" -r
