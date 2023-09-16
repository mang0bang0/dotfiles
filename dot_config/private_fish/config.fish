if status is-interactive
    # Start starship
    starship init fish | source

    #------------------#
    #------BINDS-------#
    #------------------#

    #rebind finding files to <C-o>
    bind -M insert \co fzf-file-widget

    #------------------#
    #---ABBREVIATIONS--#
    #------------------#
    abbr --add v nvim
    abbr --add update ~/.update.fish
    abbr --add lg lazygit
    abbr --add cm chezmoi
    abbr --add ide flatpak run com.st.STM32CubeIDE
    abbr --add lock swaylock -c 222436


    #------------------#
    #-----ALIASES------#
    #------------------#
    #exa instead of ls
    #ls = exa show icons, long, classify, directories first, git
    function ls
        exa --long --classify --git --icons --group-directories-first --header $argv
    end

    #la adds hidden files
    function la
        exa --long --classify --icons --group-directories-first --header --all $argv
    end

    #lt lists in tree view
    function lt
        exa --tree --icons --level=3 --long --header --all $argv
    end

    #function to make a directory and go in there
    #taken from https://fishshell.com/docs/current/cmds/function.html
    function mc
        #make all the directories given in arguments
        mkdir $argv
        #if it was successful
        if test $status = 0
            #check the last argument given
            #if the argument starts with a '-', it means it's a flag, ignore
            #if it's not a flag, then cd into that directory
            switch $argv[(count $argv)]
                case '-*'

                case '*'
                cd $argv[(count $argv)]
                return
            end
        end
    end

    #valgrind alias to pipe outputs into nvim
    ##--log-fd=1 pipes the output that's usually stderr to stdout
    function vg
        valgrind --log-fd=1 $argv | nvim -R
    end

    function shutdown
        systemctl poweroff
    end

    function reboot
        systemctl reboot
    end

    #change the screen brightness with brightnessctl
    #requires the package brightnessctl
    function brightness
        if test (count $argv) -eq 0
            brightnessctl info
        else
            brightnessctl -d intel_backlight set $argv
        end
    end

    #prints battery percentage
    #requires ripgrep (grep works but need to change)
    function batt
        upower -i /org/freedesktop/UPower/devices/battery_BAT0 | rg percentage\|state | tac
    end

    #------------------#
    #-----SETTINGS-----#
    #------------------#
    #Vi bindings aren't that great, but keeping them on for now
    fish_vi_key_bindings

    #turn off default greetings
    set -g fish_greeting
    #always show full path, doesn't really matter besides terminal title
    set -g fish_prompt_pwd_dir_length 0

    #set manpager to nvim
    set -gx MANPAGER "nvim +Man!"

    #set editor and visual editor to nvim
    set -gx EDITOR "nvim"
    set -gx VISUAL "nvim"

    #set bat color theme
    set -gx BAT_THEME "tokyonight_storm"

    #-FZF settings-#
    set -x FZF_DEFAULT_COMMAND "fd -H"
    #adds border, limits size, scroll would cycle, layout is search on top, then
    #results on bottom
    #do not add preview, since fzf can be used for anything, not just files
    set -x FZF_DEFAULT_OPTS "
    --height=40%
    --border
    --color=16
    --cycle
    --scroll-off=3
    --reverse
    --tabstop=4
    "

    #<C-t> behavior for finding file
    #only finds files, uses token in command line as base directory
    #for example `nvim ~/.config <C-t>` will only list files under ~/.config
    #while `nvim <C-t>` will show results under ./
    #-a prints absolute path. fd doesn't play well with pasting relative
    set -x FZF_CTRL_T_COMMAND "fd -H -I --base-directory \$dir --type f --absolute-path"
    #adds previews
    #<C-d> and <C-u> to scroll down and up the buffer
    set -x FZF_CTRL_T_OPTS "
    --height=40%
    --border
    --color=16
    --cycle
    --scroll-off=3
    --reverse
    --tabstop=4
    --bind=ctrl-d:preview-half-page-down,ctrl-u:preview-half-page-up
    --preview 'bat --color=always --style=numbers --theme base16 {}'
    "

    #<A-c> behavior for cd into directories
    #only finds directories under home, use absolute path
    set -x FZF_ALT_C_COMMAND "fd -H --base-directory ~ --type d --absolute-path"
    #adds tree view from exa, 3 levels down, same scrolling binds
    set -x FZF_ALT_C_OPTS "
    --height=40%
    --border
    --color=16
    --cycle
    --scroll-off=3
    --reverse
    --tabstop=4
    --bind=ctrl-d:preview-half-page-down,ctrl-u:preview-half-page-up
    --preview 'exa -T --icons --level=3 -h {}'
    "
end
