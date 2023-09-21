#!/bin/bash
set -e
#set -x 

_usage="
Usage: $0 [ OPTIONS ]
Options:
    -n <ProjectName>, --name=<ProjectName> specify the project name [Required]
    -p <ParentDirectory>, --parentDir=<Parentdirectory> specify the parent directory [Required]
"

CURRENT_DIR=$(pwd)
PROJECT_PARENT_PATH=""
while getopts ":n:hp:-:" OPT; do
    #OPT would store the flag
    #OPTARG would store the argument if the flag is followed by : 
    if [ "$OPT" = "-" ]; then   # long option: reformulate OPT and OPTARG
        OPT="${OPTARG%%=*}"       # extract long option name
        OPTARG="${OPTARG#$OPT}"   # extract long option argument (may be empty)
        OPTARG="${OPTARG#=}"      # if long option argument, remove assigning `=`
    fi
    case "${OPT}" in 
        n | name) 
        PROJECT_NAME=${OPTARG}
        ;;
        p | parentDir)
        PROJECT_PARENT_PATH=${OPTARG}
        ;;
        h | help)
        echo "$_usage"
        exit 0
        ;;
        :)
        echo "It requires an arguement ${OPTARG}"
        exit 0
        ;;
        \?)
        echo "exiting Illegal Option. Consider using -h flag"
        exit 0 
        ;;
    esac
done 
#error handling 
if [ ! -d $PROJECT_PARENT_PATH ]; then
    echo "invalid parent directory"
    exit 0
fi 

if [ $PROJECT_NAME != "" ]; then
    cd $PROJECT_PARENT_PATH
    mkdir $PROJECT_NAME
fi

cd $CURRENT_DIR
cd $PROJECT_PARENT_PATH
cp $CURRENT_DIR/main.cpp ./$PROJECT_NAME/

#create src directory  : TODO P1
#create test directory : TODO P1
#create CMakeLists.txt file for whole project : TODO P0
#create build directory : TODO P0
#run cmake -B <pathToBuild> -S <sourceDir> : TODO P0
#run make : TODO P0

