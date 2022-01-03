function __set_variables
    set arr
    set -g staged
    set -g unstaged
    set -g untracked
    set -g ignored
    set -g unmerged
    set -g current_color
end

function __sanitize_flags -d "only allow for predefined flags"
    set allow_list "--ignored" "--renames" "--no-renames"
    set sanitized

    for flag in (string split " " -- $argv)
        if contains -- $flag $allow_list
            set sanitized $sanitized $flag
        end
    end
    echo $sanitized
end

function __parse_unmerged -a us them -d "parse shorthand status for unmerged paths"
    set code "$us$them"
    switch $code
        case DD
            set current_status "both deleted"
            set current_color 'red'
        case AU
            set current_status "added by us"
            set current_color 'yellow'
        case UD
            set current_status "deleted by them"
            set current_color 'red'
        case UA
            set current_status "added by them"
            set current_color 'yellow'
        case DU
            set current_status "deleted by us"
            set current_color 'red'
        case AA
            set current_status "both added"
            set current_color 'yellow'
        case UU
            set current_status "both modified"
            set current_color 'green'
    end

    echo $current_status
end

function __parse_status -a code -d "parse shorthand status"
    switch $code
        case A
            set current_status "new file"
            set current_color 'yellow'
        case C
            set current_status "copied"
            set current_color 'magenta'
        case D
            set current_status "deleted"
            set current_color 'red'
        case M
            set current_status "modified"
            set current_color 'green'
        case R
            set current_status "renamed"
            set current_color 'blue'
        case !
            set current_status "ignored"
            set current_color 'white'
        case '?'
            set current_status "untracked"
            set current_color 'cyan'
    end

    echo $current_status
end

function __parse_state -a state -d "parse the current state"
    switch $state
        case staged
            set current_state "Changes to be committed"
        case unstaged
            set current_state "Changes not staged for commit"
        case untracked
            set current_state "Untracked files"
        case unmerged
            set current_state "Unmerged paths"
        case '*'
            set current_state "Ignored files"
    end

    echo $current_state
end

function __handle_renames_and_copies -a idx name -d "removes explict rename or copy paths for unstaged files"
    if test $idx = "R"
        or test $idx = "C"
        set elements (string split " -> " $name)
        set name $elements[2]
    end

    echo $name
end

function __print_state -a message length -d "print the state message"
    if test $length -gt 0
        set arrow "›"
        printf \n(set_color normal)"$arrow $message:"\n
    end
end

function __format_status -a message name -d "format the output of the status"
    echo (printf "%15s: %s" (set_color $current_color)$message $name)
end

function __print -d "print output to screen"
    set length (count $staged $unmerged $unstaged $untracked $ignored)
    set states staged unmerged unstaged untracked ignored

    set i 0
    for state in $states
        __print_state (__parse_state $state) (count $$state)
        for st in $$state
            printf $st\n
        end
        set i (math $i + 1)
    end

    if test $length -eq 0
        echo "Nothing to commit, working tree clean"
    end

    echo # newline
    set_color normal
end

function __gs -a flags -d "group statuses by state and print to screen"

    set unmerged_files (git diff --name-only --diff-filter=U)

    for row in (eval (string join " " "git status --porcelain" -- $flags))
        set idx (string sub -l 1 $row)
        set tree (string sub -s 2 -l 1 $row)
        set name (string sub -s 4 $row | string unescape )

        if contains $name $unmerged_files
            set unmerged $unmerged (__format_status (__parse_unmerged $idx $tree) $name)
            continue
        end

        if test $idx = "?"
            set untracked $untracked (__format_status (__parse_status $idx) $name)
            continue
        end

        if test $idx = !
            set ignored $ignored (__format_status (__parse_status $idx) $name)
            continue
        end

        if test $idx != " "
            set staged $staged (__format_status (__parse_status $idx) $name)
        end

        if test $tree != " "
            set unstaged $unstaged (__format_status (__parse_status $tree) (__handle_renames_and_copies $idx $name))
        end
    end

    __print
end

function gs $argv
    set res (git rev-parse --is-inside-work-tree)
    if [ $res = 'true' ]
        __set_variables
        __gs (__sanitize_flags $argv)
    else
        echo 'fatal: Not a git repository (or any of the parent directories): .git'
    end
end
