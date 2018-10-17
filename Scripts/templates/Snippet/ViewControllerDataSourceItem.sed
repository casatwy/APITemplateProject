#!/usr/bin/sed -i .bak -f
s%//__DemoAPIViewControllerDataSourceItem__%[\
            DataSourceKey.title:"__GroupName__",\
            DataSourceKey.clazz:__APIViewControllerName__.self\
        ],\
//__DemoAPIViewControllerDataSourceItem__%g
