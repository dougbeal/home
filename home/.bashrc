############################################################
# make sure emacs on cyginw gets profile settings, particually path
profiles=( /etc/profile ~/.profile )
if [ "$EMACS" = "t" ]; then
    for profile in ${profiles[@]}; do
        if [ -f  $profile ]; then
        #echo "Sourcing $profile"
            source $profile
        else
            echo "No $profile"
        fi
    done
fi

# added by travis gem
[ -f /Users/dougbeal/.travis/travis.sh ] && source /Users/dougbeal/.travis/travis.sh
