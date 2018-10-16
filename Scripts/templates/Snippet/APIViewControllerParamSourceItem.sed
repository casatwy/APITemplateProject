#!/usr/bin/sed -i .bak -f
s%//__DemoAPIManagerParamSource__%        if let _apiManager = apiManager as? __APIManagerFileName__ {\
             return _apiManager.generateParams()\
        }\
//__DemoAPIManagerParamSource__%g
