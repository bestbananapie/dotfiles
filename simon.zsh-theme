##This theme is heavily copied from oh-my-zsh/themes/jonathan

# Find number of horizontal bars to add
function theme_precmd {
    local TERMWIDTH
    (( TERMWIDTH = ${COLUMNS} - 1 ))


    ###
    # Truncate the path if it's too long.

    PR_FILLBAR=""
    PR_PWDLEN=""

    local promptsize=${#${(%):--()---(%!)--(%n@%m)-}}
    local pwdsize=${#${(%):-%~}}

    if [[ "$promptsize + $pwdsize" -gt $TERMWIDTH ]]; then
      ((PR_PWDLEN=$TERMWIDTH - $promptsize))
    else
      PR_FILLBAR="\${(l.(($TERMWIDTH - ($promptsize + $pwdsize)))..${PR_HBAR}.)}"
    fi

}

#Define the prompt
setprompt () {
    ###
    # Need this so the prompt will work.

    setopt prompt_subst


    ###
    # See if we can use colors.

    autoload zsh/terminfo
    for color in RED GREEN YELLOW BLUE MAGENTA CYAN WHITE GREY; do
      eval PR_$color='%{$terminfo[bold]$fg[${(L)color}]%}'
      eval PR_LIGHT_$color='%{$fg[${(L)color}]%}'
      (( count = $count + 1 ))
    done

    PR_NO_COLOUR="%{$terminfo[sgr0]%}"

    ###
    # See if we can use extended characters to look nicer.
    # UTF-8 Fixed

    if [[ $(locale charmap) == "UTF-8" ]]; then
      PR_SET_CHARSET=""
      PR_SHIFT_IN=""
      PR_SHIFT_OUT=""
      PR_HBAR="─"
      PR_ULCORNER="┌"
      PR_LLCORNER="└"
      PR_LRCORNER="┘"
      PR_URCORNER="┐"
      PR_TITLEBAR=''
    else
      typeset -A altchar
      set -A altchar ${(s..)terminfo[acsc]}
      # Some stuff to help us draw nice lines
      PR_SET_CHARSET="%{$terminfo[enacs]%}"
      PR_SHIFT_IN="%{$terminfo[smacs]%}"
      PR_SHIFT_OUT="%{$terminfo[rmacs]%}"
      PR_HBAR='$PR_SHIFT_IN${altchar[q]:--}$PR_SHIFT_OUT'
      PR_ULCORNER='$PR_SHIFT_IN${altchar[l]:--}$PR_SHIFT_OUT'
      PR_LLCORNER='$PR_SHIFT_IN${altchar[m]:--}$PR_SHIFT_OUT'
      PR_LRCORNER='$PR_SHIFT_IN${altchar[j]:--}$PR_SHIFT_OUT'
      PR_URCORNER='$PR_SHIFT_IN${altchar[k]:--}$PR_SHIFT_OUT'
      PR_TITLEBAR=''
     fi

    ###
    # Finally, the prompt.

    PROMPT='
$PR_SET_CHARSET\
$PR_CYAN$PR_ULCORNER$PR_HBAR\
$PR_GREY($PR_GREEN%$PR_PWDLEN<...<%~%<<$PR_GREY)\
$PR_CYAN$PR_HBAR$PR_HBAR${(e)PR_FILLBAR}$PR_HBAR\
$PR_GREY($PR_CYAN%(!.%SROOT%s.%n)$PR_GREY@$PR_GREEN%m$PR_GREY)\
$PR_CYAN$PR_HBAR$PR_HBAR\
$PR_GREY($PR_CYAN%!$PR_GREY)\
$PR_CYAN$PR_HBAR\
$PR_CYAN$PR_LLCORNER$PR_CYAN$PR_HBAR\
>\
'
}

setprompt

autoload -U add-zsh-hook
add-zsh-hook precmd  theme_precmd
