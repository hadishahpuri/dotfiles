#!/bin/bash

shopt -s nullglob globstar

# switch for autotyping
typeit=0
if [[ $1 == "--type" ]]; then
    typeit=1
    shift
fi

# get all the saved password files
prefix=${PASSWORD_STORE_DIR-~/.password-store}
password_files=( "$prefix"/**/*.gpg )
password_files=( "${password_files[@]#"$prefix"/}" )
password_files=( "${password_files[@]%.gpg}" )

# shows a list of all password files and saved the selected one in a variable
password=$(printf '%s\n' "${password_files[@]}" | rofi -dmenu "$@" -theme ~/dotfiles/rofi/powermenu/type-1/style-3.rasi)
[[ -n $password ]] || exit


# pass -c copied the password in clipboard. The additional output from pass is piped in to /dev/null 
if [[ $typeit -eq 0 ]]; then
    pass show -c "$password" | head -n1  2>/dev/null
else
    # If i want to use autotype i save the user name and the password in to a variable 
    # the actual password files are simple text file. 
    # The password has to be on the first line,
    # because if you using `pass -i` the first line will be replaced with a new password

    passw=$(pass show $password | head -n1 )
    uname=$(pass show $password | tail -n1 )
    echo $pass
    echo $uname
    # xdotool types the username on the active spot (cli or inputfield from a browser)
    wtype "$uname"
    # type a TAB (for moving forward in browser input fields)
    wtype Tab
    # type the password in the active input
    wtype "$passw"
    wtype Tab
fi
