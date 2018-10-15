#!/bin/bash

Cyan='\033[0;36m'
Default='\033[0;m'

GroupPath="../____ProjectName____/____ProjectName____/Groups"
Group=""
FileName=""
MethodName=""
confirmed="n"
year=`date +%Y`

ServiceName="____ServiceName____"
ServiceNameList=("____ServiceName____")

# cachePolicy=""
# cachePolicyList=("CTAPIManagerCachePolicyNoCache" "CTAPIManagerCachePolicyMemory" "CTAPIManagerCachePolicyDisk" "CTAPIManagerCachePolicyMemory | CTAPIManagerCachePolicyDisk")

requestType="get"
requestTypeList=("get" "post")

getGroup() {
    echo "current Group list:"
    ls ${GroupPath}
    echo -e "\n"
    read -p "Enter API Group: " Group

    if test -z "$Group"; then
        getGroup
    fi
}

getAPIName() {
    read -p "Enter File Name: " FileName

    if test -z "$FileName"; then
        getAPIName
    fi
}

getMethodName() {
    read -p "Enter API Method Name: " MethodName

    if test -z "$MethodName"; then
        getMethodName
    fi
}

getServiceName() {
    echo -e "\n"
    length=${#ServiceNameList[@]}
    for ((index=0; index<length; index++)); do
        echo "  (${index}) ${ServiceNameList[$index]}"
    done

    read -p "Service Name (enter the index) :" serviceTypeIndex

    if test $serviceTypeIndex -lt $length; then
        serviceIdentifier=${ServiceNameList[${serviceTypeIndex}]}
    else
        echo -e "\n\n the index must less than ${length}\n"
        getServiceName
    fi
}

getRequestType() {
    echo -e "\n"
    length=${#requestTypeList[@]}
    for ((index=0; index<length; index++)); do
        echo "  (${index}) ${requestTypeList[$index]}"
    done

    read -p "Select API Request Type (enter the index) :" requestTypeIndex

    if test $requestTypeIndex -lt $length; then
        requestType=${requestTypeList[${requestTypeIndex}]}
    else
        echo -e "\n\n the index must less than ${length}\n"
        getRequestType
    fi
}

getInfomation() {
	echo -e "\n"
    getMethodName
	echo -e "\n"
    grep -rHn $MethodName ${GroupPath} && echo -e "\n${Cyan}I have found same API manager${Default}" && exit 0
    getGroup
    getAPIName
    getRequestType
    getServiceName
    # getCachePolicy

    echo -e "\n${Default}================================================"
    echo -e "  Group       :  ${Cyan}${Group}${Default}"
    echo -e "  FileName    :  ${Cyan}${FileName}${Default}"
    echo -e "  MethodName  :  ${Cyan}${MethodName}${Default}"
    echo -e "  requestType :  ${Cyan}${requestType}${Default}"
    echo -e "  Service Name :  ${Cyan}${ServiceName}${Default}"
    # echo -e "  cachePolicy :  ${Cyan}${cachePolicy}${Default}"
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

Directory="${GroupPath}/${Group}"
APIManagerFilePath="${Directory}/${FileName}.swift"

mkdir -p "$Directory"
cp ./templates/APIManager.swift "$APIManagerFilePath"

sed -i "" "s:__APIManagerFileName__:${FileName}:g"  "$APIManagerFilePath"
sed -i "" "s:__year__:${year}:g"                    "$APIManagerFilePath"
sed -i "" "s:__ServiceName__:${ServiceName}:g"      "$APIManagerFilePath"
sed -i "" "s:__MethodName__:${MethodName}:g"        "$APIManagerFilePath"
sed -i "" "s:__RequestType__:${requestType}:g"      "$APIManagerFilePath"
# sed -i "" "s:__CachePolicy__:${cachePolicy}:g"      "$implementFilePath"

pbxproj folder ../____ProjectName____.xcodeproj ../____ProjectName____/____ProjectName____ -e ".DS_Store|Base.lproj" -r
