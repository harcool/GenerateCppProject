#!/bin/bash
set -e
#set -x 

_usage="
Usage: $0 [ OPTIONS ]
Options:
    -n <ProjectName>, --name=<ProjectName> specify the project name [Required]
"


while getopts ":B:p:dsknwlh-:" OPT; do
    // check for options -n or --name 
    // If option is not supported throw error 
    // project name should not be empty 

done 

// create project 

// create main.cpp : TODO P0
// add boiler plate code to the main.cpp : TODO P0
// create src directory  : TODO P1
// create test directory : TODO P1
// create CMakeLists.txt file for whole project : TODO P0
// create build directory : TODO P0
// run cmake -B <pathToBuild> -S <sourceDir> : TODO P0
// run make : TODO P0

