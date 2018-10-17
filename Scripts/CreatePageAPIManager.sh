#!/bin/bash

Cyan='\033[0;36m'
Default='\033[0;m'

GroupPath="../____ProjectName____/____ProjectName____/Groups"
Group=""
FileName=""
MethodName=""
Title=""
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

getAPITitle() {
    read -p "Enter API Title: " Title

    if test -z "$Title"; then
        getAPITitle
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
    getAPITitle
    getRequestType
    getServiceName
    # getCachePolicy

    echo -e "\n${Default}================================================"
    echo -e "  MethodName   : ${Cyan}${MethodName}${Default}"
    echo -e "  Group        : ${Cyan}${Group}${Default}"
    echo -e "  API File Name: ${Cyan}${FileName}${Default}"
    echo -e "  API Title    : ${Cyan}${Title}${Default}"
    echo -e "  requestType  : ${Cyan}${requestType}${Default}"
    echo -e "  Service Name : ${Cyan}${ServiceName}${Default}"
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
DemoPath="../____ProjectName____/Demo"

ViewControllerPath="${DemoPath}/ViewController/ViewController.swift"
APIControllerPath="${DemoPath}/APIControllers/${Group}APIViewController.swift"

OriginViewControllerDataSourceItemPath="./templates/Snippet/ViewControllerDataSourceItem.sed"
PreparedViewControllerDataSourceItemPath="./templates/Snippet/ViewControllerDataSourceItem.prepared.sed"

OriginAPIViewControllerDataSourceItemPath="./templates/Snippet/APIViewControllerDataSourceItem.sed"
PreparedAPIViewControllerDataSourceItemPath="./templates/Snippet/APIViewControllerDataSourceItem.prepared.sed"

OriginAPIViewControllerParamSourceItemPath="./templates/Snippet/APIViewControllerParamSourceItem.sed"
PreparedAPIViewControllerParamSourceItemPath="./templates/Snippet/APIViewControllerParamSourceItem.prepared.sed"

if [ ! -f "$APIControllerPath" ]; then
  mkdir -p "${DemoPath}/APIControllers"
  cp ./templates/APIViewController.swift "${APIControllerPath}"
  sed -i "" "s:__APIManagerFileName__:${FileName}:g"  "$APIControllerPath"
  sed -i "" "s:__GroupName__:${Group}:g"  "$APIControllerPath"
  sed -i "" "s:__Title__:${Title}:g"  "$APIControllerPath"

  # prepare ViewControllerDataSourceItem
  cp $OriginViewControllerDataSourceItemPath $PreparedViewControllerDataSourceItemPath
  sed -i "" "s:__APIViewControllerName__:${Group}APIViewController:g"  "$PreparedViewControllerDataSourceItemPath"
  sed -i "" "s:__GroupName__:${Group}:g"  "$PreparedViewControllerDataSourceItemPath"
  chmod 777 $PreparedViewControllerDataSourceItemPath
  $PreparedViewControllerDataSourceItemPath $ViewControllerPath
  rm $PreparedViewControllerDataSourceItemPath
  rm "${ViewControllerPath}.bak"
else
  # prepare APIViewControllerDataSourceItem
  cp $OriginAPIViewControllerDataSourceItemPath $PreparedAPIViewControllerDataSourceItemPath
  sed -i "" "s:__Title__:${Title}:g" "$PreparedAPIViewControllerDataSourceItemPath"
  sed -i "" "s:__APIManagerFileName__:${FileName}:g" "$PreparedAPIViewControllerDataSourceItemPath"
  chmod 777 $PreparedAPIViewControllerDataSourceItemPath $APIControllerPath
  $PreparedAPIViewControllerDataSourceItemPath $APIControllerPath
  rm $PreparedAPIViewControllerDataSourceItemPath
  rm "${APIControllerPath}.bak"

  # prepare APIViewControllerParamSourceItem
  cp $OriginAPIViewControllerParamSourceItemPath $PreparedAPIViewControllerParamSourceItemPath
  sed -i "" "s:__APIManagerFileName__:${FileName}:g" "$PreparedAPIViewControllerParamSourceItemPath"
  chmod 777 $PreparedAPIViewControllerParamSourceItemPath $APIControllerPath
  $PreparedAPIViewControllerParamSourceItemPath $APIControllerPath
  rm $PreparedAPIViewControllerParamSourceItemPath
  rm "${APIControllerPath}.bak"
fi

mkdir -p "$Directory"
cp ./templates/PagableAPIManager.swift "$APIManagerFilePath"

sed -i "" "s:__APIManagerFileName__:${FileName}:g"  "$APIManagerFilePath"
sed -i "" "s:__year__:${year}:g"                    "$APIManagerFilePath"
sed -i "" "s:__ServiceName__:${ServiceName}:g"      "$APIManagerFilePath"
sed -i "" "s:__MethodName__:${MethodName}:g"        "$APIManagerFilePath"
sed -i "" "s:__RequestType__:${requestType}:g"      "$APIManagerFilePath"
# sed -i "" "s:__CachePolicy__:${cachePolicy}:g"      "$implementFilePath"

pbxproj folder ../____ProjectName____.xcodeproj ../____ProjectName____ -e "\.DS_Store|Base\.lproj" -r
