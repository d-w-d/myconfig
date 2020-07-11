#!/usr/bin/env bash
#
# yusr = yum + user; it's like 'pip install --user' but for yum

###############################################################
### Check the prereq commands are available
###############################################################

function abort_install() {
    echo "${1:-Aborting install for unspecified reasons}"
    echo "This script relies on the admin installing 'yum-utils'"
    echo "If that isn't an option then, well, is it really worth it?"
    exit 1
}

### repotrack included in yum-utils package
command -v repotrack >/dev/null 2>&1 || abort_install "repotrack not found; exiting;"
### rpm2cpio included in yum-utils package
command -v rpm2cpio >/dev/null 2>&1 || abort_install "rpm2cpio not found; exiting;"
### Included in centos7
command -v getopts >/dev/null 2>&1 || abort_install "getopts not found; exiting;"

###############################################################
### Setup dirs
###############################################################

[[ ! -d $HOME/.yusr/rpm ]] && mkdir -p $HOME/.yusr/rpm

###############################################################
### Parse commands, args, etc.
###############################################################

# Parse options to the `yusr` command
# See: https://sookocheff.com/post/bash/parsing-bash-script-arguments-with-shopts/
while getopts ":h" opt; do
    case ${opt} in
    h)
        echo "Usage:"
        echo "yusr -h                   Display this help message."
        echo "yusr install <package>    Install <package>."
        echo "yusr search <package>     Search <package>."
        exit 0
        ;;
    \?)
        echo "Invalid Option: -$OPTARG" 1>&2
        exit 1
        ;;
    esac
done
shift $((OPTIND - 1))

subcommand=$1
shift # Remove 'yusr' from the argument list
case "$subcommand" in
# Parse options to the install sub command
install)
    PACKAGE=$1
    shift # Remove 'install' from the argument list

    ### Wrap around repotrack to download rpm's for package and dependencies
    repotrack -a x86_64 -p $HOME/.yusr/rpm $PACKAGE

    ### Wrap around rpm2cpio to crudely install all rpm files
    PREVIOUSDIR=$PWD
    cd $HOME/.yusr
    for filename in $HOME/.yusr/rpm/*.rpm; do
        [ -e "$filename" ] || continue
        echo ">>>> $filename"
        rpm2cpio "$filename" | cpio -id --no-preserve-owner

        ### Need to make sure nothing was added to our filesystem that we can't write to
        ### since later packages will want to add stuff to dirs that previous packages 
        ### copied over in full
        chmod -R u+w .
    done
    cd $PREVIOUSDIR
    ;;
search)
    PACKAGE=$1
    shift # Remove 'search' from the argument list
    ### Wrap around repotrack  to download rpm's for package and dependencies
    yum search $PACKAGE
    ;;
esac

###############################################################
### Download rpm's for package and all dependencies
###############################################################
#repotrack -a x86_64 -p $HOME/.yusr/rpm $PACKAGE

### Make sure an argument is supplied to script
#[[ ! $1 ]] && echo "Script needs an argument" && exit 1

### Check that the searchterm is in yum
#SEARCHTERM=$1
#echo "Searching yum for $SEARCHTERM"
#RESULT=$(yum list $SEARCHTERM | grep 'No matching' | wc -l)
#[[ $RESULT == 1 ]] && echo "$SEARCHTERM not found"  &&   exit 1

#RESULT=$(yum list $SEARCHTERM | grep 'No matching' | wc -l)
#[[ $(yum list $SEARCHTERM 2>&1 | grep 'No matching' | wc -l) -ge 1 ]] && echo "$SEARCHTERM not found" && exit 1

### Download rpms for that package
#yumdownloader --destdir ~/rpm --resolve $SEARCHTERM --installroot ~/rpm

### Crudely unpack every rpm downloaded to date
#echo "DEbug0"
#PREVIOUSDIR=$PWD
##[[ ! -d $HOME/centos/rpr ]] && mkdir -p $HOME/centos/rpm
##cd ~/centos
#cd /tmp/centos

##for filename in $HOME/rpm/*.rpm; do
#echo "DEbug1"
#for filename in /tmp/rpm/*.rpm; do
####
#[ -e "$filename" ] || continue
#echo ">>>> $filename"
#rpm2cpio "$filename" | cpio -id
#done

#echo "DEbug2"
#cd $PREVIOUSDIR
