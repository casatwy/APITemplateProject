#!/usr/bin/sed -i .bak -f
s%//__DemoAPIManagerDataSourceItem__%[\
            DemoSuiteBaseAPIViewController.DataSourceKey.APIManagerTitle:"__Title__",\
            DemoSuiteBaseAPIViewController.DataSourceKey.APIManagerClass:__APIManagerFileName__.self\
        ],\
//__DemoAPIManagerDataSourceItem__%g
