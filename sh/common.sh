#!/bin/bash
this_common_sh=$( cd $(dirname ${BASH_SOURCE[0]}); pwd -P )

function updateEnvironmentVariable() {
    local varname=$1
    local addition=$2
    local varvalue=${!varname}
    if [ -z "$varname" ]; then
	echo "Environment variable name missing."
	return 1
    fi

    if [ -z "$addition" ]; then
	return 0
    fi

    if [[ "${varvalue}" =~ .*${addition}.* ]]; then
	return 0
    else
	string=""
	if [ -z "$varvalue" ]; then 
	    string="${addition}"
	else
	    string="${addition}:${varvalue}"
	fi
	export ${varname}=$string

    fi
    return 0
    
}

function prependEnvironmentVariable() {
    local varname=$1
    local addition=$2
    local varvalue=${!varname}
    if [ -z "$varname" ]; then
	echo "Environment variable name missing."
	return 1
    fi

    if [ -z "$addition" ]; then
	return 0
    fi

    if [[ "${varvalue}" =~ .*${addition}.* ]]; then
	return 0
    else
	string=""
	if [ -z "$varvalue" ]; then 
	    string="${addition}"
	else
	    string="${addition}:${varvalue}"
	fi
	export ${varname}=$string

    fi
    return 0
    
}

function appendEnvironmentVariable() {
    local varname=$1
    local addition=$2
    local varvalue=${!varname}
    if [ -z "$varname" ]; then
	echo "Environment variable name missing."
	return 1
    fi

    if [ -z "$addition" ]; then
	return 0
    fi

    if [[ "${varvalue}" =~ .*${addition}.* ]]; then
	return 0
    else
	string=""
	if [ -z "$varvalue" ]; then 
	    string="${addition}"
	else
	    string="${varvalue}:${addition}"
	fi
	export ${varname}=$string

    fi
    return 0
    
}

function safeSource() {
    local file=$1
    if [ -n "$file" -a -e $file ]; then
	source ${file}
    else
	echo "Source failure, file '${file}' not found."
    fi
}

function safeSourceHere() {
    local file="${this_common_sh}/$1"
    if [ -n "$file" -a -e $file ]; then
	source ${file}
    else
	echo "Didn't source ${file}, not found."
    fi
}

function update() {
    local varname=$1
    local addition=$2
    local varvalue=${!varname}
    if [ -z "$varname" ]; then
	echo "Environment variable name missing."
	return 1
    fi

    if [ -z "$addition" ]; then
	return 0
    fi

    if [[ "${varvalue}" =~ .*${addition}.* ]]; then
	return 0
    else
	string=""
	if [ -z "$varvalue" ]; then 
	    string="${addition}"
	else
	    string="${addition}:${varvalue}"
	fi
	export ${varname}=$string

    fi
    return 0
    
}

function printVar(){
    local varname
    local varvalue
    local debugString=""
    local string=""
    while (($#)); do
	varname=$1
	varvalue=${!1}
	string="${varname} = '${varvalue}'"
	if [ -z "$debugString" ]; then
	    debugString=$string
	else
	    debugString="${debugString}, ${string}"
	fi
	shift
    done
    echo "${FUNCNAME[1]}: $debugString"
}

function printTestFileVar() {
    local varname
    local varvalue
    local fileinfo
    local debugString=""
    local string=""
    while (($#)); do
	varname=$1
	varvalue=${!1}
        if [ -d $varvalue ]; then
            fileinfo="$( ls -ald $varvalue )"
        elif [ -e $varvalue ]; then
            fileinfo="$( ls -al $varvalue )"
        else
            fileinfo="None"
        fi
	string="${varname} = '${varvalue}' [$fileinfo]"
	if [ -z "$debugString" ]; then
	    debugString=$string
	else
	    debugString="${debugString}, ${string}"
	fi
	shift
    done
    echo "${FUNCNAME[1]}: $debugString"
}

function printArgs(){
    local varname
    local varvalue
    local debugString=""
    local string=""
    local index=1
    while (($#)); do
	varvalue=${1}
	string="${index} '${varvalue}'"
	if [ -z "$debugString" ]; then
	    debugString=$string
	else
	    debugString="${debugString}, ${string}"
	fi
	shift
	index=$((index+1))
    done
    echo -e "${FUNCNAME[1]}: $debugString"
}

function printArraySel() {
    local highlightIndex=${1}
    shift

    local debugString=""
    local string=""
    local array=("${@}")


    local end=${#array[@]}
    local i=0
    #verboseVar debugString string arrayName highlightIndex i end array
    for (( i=0; i<end; i++ )); do
	string=""
	if [[ $i == $highlightIndex ]]; then
	    string="[${array[$i]}]"
	else
	    string="${array[$i]}"
	fi

	debugString="$debugString $string"
    done
    echo "${FUNCNAME[1]} $highlightIndex: $debugString"
}


# move to common
function template()
{
    local template_string=${!1}
    eval "echo $template_string"
}



function compareMD5()
{
    src=$1
    dst=$2
    [ "XX$(md5sum ${src} | gawk '{ print $1 }' )XX" == "XX$(md5sum ${dst} | gawk '{ print $1 }' )XX" ]
}

function error()
{
    echo "${FUNCNAME[1]}: ${1:-''}"; 
}

function verbose_on()
{
    echo "Turning verbose on." 1>&2
    VERBOSE=1
    verbose() 
    {
	echo "${@}." 1>&2
    }
}

function verbose_off()
{
    VERBOSE=0
    verbose()
    {
        :
    }
}

function verbose()
{
    if [[ $VERBOSE -eq 1 ]]; then
        verbose_on
        verbose "$@"
    else
        verbose_off
    fi
}

function verdebug()
{
    if [[ "${!1}" == "1" ]]; then
	echo >/dev/stderr "${@}."
    fi
}

function run()
{
    if [[ "${PRETEND}" == "1" ]]; then
	echo "pretend ${@}."
    else
        ((VERBOSE)) && set -x
        if [[ $VERBOSE -eq 1 ]]; then
	    eval ${@} 
        else
	    eval ${@} >/dev/null
        fi
	if [ $? -ne 0 ]; then
	    echo "Run failed."
	    printArgs ${@}
	fi
        ((VERBOSE)) && set +x
    fi
}

function verboseVar()
{
    if [[ "${VERBOSE}" == "1" ]]; then
	printVar ${@}
    fi
}

function getPlatform() {
    echo $(uname)
}

# parse arguments for some standard options, and convert them to env variables
# unrecognized arguments are placed into args array
function defaultOptions() {
    DEBUG=0
    VERBOSE=0
    PRETEND=0
    TRACE=0
    LOCAL=0
    INTERACTIVE=0
    local output=""
    while [ $# -gt 0 ]; do
        for (( i = 0; i <= $#; i++ )); do
	    output="$output$i: ${!i} "
        done
        output="$output\n"
        case "${1}" in
	    --debug)
	        DEBUG=1
	        output="$output\nDEBUG on"
	        ;;
	    --pretend)
	        PRETEND=1
	        output="$output\nPRETEND on"
	        ;;
	    --verbose)
                verbose_on
	        ;;
	    --trace)
	        TRACE=1
	        output="$output\nTRACE on"
	        ;;
	    --local)
	        LOCAL=1
	        output="$output\nLOCAL on"
	        ;;
	    --interactive)
	        INTERACTIVE=1
	        output="$output\nINTERACTIVE on"
	        ;;

	    *)
	        args[${#args[@]}]="${1}"
	        ;;
        esac
        shift 1
    done
    verbose "$output"
}

RELPATH_DEBUG=0
function relpath() {
    if [[ "$1" == "$2" ]]
    then
        echo "."
        exit
    fi

    verdebug RELPATH_DEBUG $( printVar 1 2 )
  
    local save=$IFS
    IFS="/"

    local current=( $( cd "$1"; pwd -P ) )
    local absolute=( $( cd "$2"; pwd -P ) )

    verdebug RELPATH_DEBUG "${current[@]}" "${absolute[@]}"

    local abssize=${#absolute[@]}
    local cursize=${#current[@]}
    local newpath


    while [[ ${absolute[$level]} == ${current[$level]} ]]
    do
        (( level++ ))
        if (( level > abssize || level > cursize ))
        then
            break
        fi
    done

    verdebug RELPATH_DEBUG $( printVar level cursize abssize )
    verdebug RELPATH_DEBUG $( printArraySel $level ${current[@]} )
    verdebug RELPATH_DEBUG $( printArraySel $level ${absolute[@]} )

    for ((i = level; i < cursize; i++))
    do
        if ((i > level))
        then
            newpath=$newpath"/"
        fi
        newpath=$newpath".."
	verdebug RELPATH_DEBUG $( printVar newpath )
 	verdebug RELPATH_DEBUG printArraySel $i ${current[@]}
    done

    for ((i = level; i < abssize; i++))
    do
        if [[ -n $newpath ]]
        then
            newpath=$newpath"/"
        fi
        newpath=$newpath${absolute[i]}
	verdebug RELPATH_DEBUG $( printVar newpath )
 	verdebug RELPATH_DEBUG printArraySel $i ${absolute[@]}
    done
    IFS=$save
    echo $newpath
}



function capitalize()
{
    local input=${1}
    echo -n ${input[@]:0:1} | tr '[:lower:]' '[:upper:]'
    echo -n ${input[@]:1}
}

function buildExportString()
{
    if [ -z "$EXPORT_STRING" ]; then
        EXPORT_STRING=""
    fi
    local varname=$1
    local varvalue=${!1}
    local exp="export ${varname}=${varvalue}"
    if [[ "" == "${EXPORT_STRING}" ]]; then
        EXPORT_STRING="${exp}"
    else
        EXPORT_STRING="${EXPORT_STRING};${exp}"
    fi
}


function canonical() {
    local file=${1:-"."}
    local dir=$(dirname $file)
    echo $(cd $dir; pwd -P)
}
function setCommonFile() {
    local thisFile=${BASH_SOURCE[0]}
    local len=${#FUNCNAME[@]}
    local fname=( ${FUNCNAME[@]} )
    local bsource=( ${BASH_SOURCE[@]} )
    verboseVar len fname[@] bsource[@] 
    local idx=$((len-1))
    local mainFile=${bsource[$idx]}
    local name=${fname[$idx]}
    verboseVar idx mainFile name
    if [ "${name}" != "main" ]; then
	# we are sourced, need to search
	local source_loc=-1
	for (( i = 0; i < len; i++ )); do
	    verboseVar i fname[$i]
	    if [ "${fname[$i]}" == "source" ]; then
		source_loc=$i
	    fi
	done
	verboseVar source_loc
	mainFile=${bsource[$source_loc]}
    fi
    verboseVar end mainFile fname thisFile
    DIR_MAIN=$(canonical $mainFile )
    DIR_COMMON=$(canonical $thisFile )
    verboseVar DIR_COMMON DIR_MAIN
}

declare -f printVar > /dev/null 2>&1
if [ $? -ne 0 ]; then
    function printVar() {
	return
    }
fi

declare -f verboseVar > /dev/null 2>&1
if [ $? -ne 0 ]; then
    function verboseVar() {
	return
    }
fi

declare -f debug > /dev/null 2>&1
if [ $? -ne 0 ]; then
    function debug() {
	return
    }
fi

setCommonFile

verboseVar mainFile commonFile

function relpath() {
    if [[ "$1" == "$2" ]]
    then
        echo "."
        exit
    fi
  
    local save=$IFS
    IFS="/"

    local current=($1)
    local absolute=($2)

    local abssize=${#absolute[@]}
    local cursize=${#current[@]}
    local newpath

    while [[ ${absolute[$level]} == ${current[$level]} ]]
    do
        (( level++ ))
        if (( level > abssize || level > cursize ))
        then
            break
        fi
    done

    for ((i = level; i < cursize; i++))
    do
        if ((i > level))
        then
            newpath=$newpath"/"
        fi
        newpath=$newpath".."
    done

    for ((i = level; i < abssize; i++))
    do
        if [[ -n $newpath ]]
        then
            newpath=$newpath"/"
        fi
        newpath=$newpath${absolute[i]}
    done
    IFS=$save
    echo $newpath
}

platform=$( getPlatform )
platform=${platform:-"Darwin"}
