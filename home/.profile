commonFile="$( cd $(dirname ${sourceFile}); pwd -P )/common.sh"
source ${commonFile}

export SVN_EDITOR="emacsclient"
export EDITOR="emacsclient"
safeSource $DIR_COMMON/.alias
platform=$(getPlatform)
platform=${platform:-"Darwin"}
safeSource $DIR_COMMON/.profile_$platform



# Option 'histappend'  controls how the  history list gets  written to
# HISTFILE,  setting the option  will append  history list  of current
# session to  HISTFILE, unsetting it (default) will  make HISTFILE get
# overwritten each time.
shopt -s histappend
    
# Option 'histreedit' allows users to re-edit a failed history
# substitution.
shopt -s histreedit

# option 'histverify' allows users to verify a substituted history expansion.
shopt -s histverify

