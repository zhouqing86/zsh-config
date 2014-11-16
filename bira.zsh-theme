# ZSH Theme - Preview: http://gyazo.com/8becc8a7ed5ab54a0262a470555c3eed.png
local return_code="%(?..%{$fg[red]%}%? ↵%{$reset_color%})"

local user_host='%{$terminfo[bold]$fg[green]%}%n%{$reset_color%}'
local current_dir='%{$terminfo[bold]$fg[blue]%} %~%{$reset_color%}'
local rvm_ruby=''
local r_version=''
local java_version=''
local local_time='$fg_bold[blue][$fg[red]%D$fg_bold[blue]]'
if which rvm-prompt &> /dev/null; then
  rvm_ruby='%{$fg[red]%}‹$(rvm-prompt i v g)›%{$reset_color%}'
else
  rvm_ruby='%{$fg[red]%}‹Ruby $(rbenv version | sed -e "s/ (set.*$//")›%{$reset_color%}'
fi
if which r &> /dev/null; then
  r_version='%{$fg[green]%}‹R $(R --version | grep -oEm 1 "[0-9]\.[0-9]\.[0-9]")›%{$reset_color%}'
fi
if which java &> /dev/null; then
  java_version='%{$fg[brown]%}‹Java $(java -version 2>/tmp/java.tmp && grep -oEm 1 "[0-9]\.[0-9].*[0-9]" /tmp/java.tmp)›%{$reset_color%}'
fi
local git_branch='$(git_prompt_info)%{$reset_color%}'

PROMPT="╭─${local_time} ${user_host} ${current_dir} ${rvm_ruby} ${r_version} ${java_version} ${git_branch}
╰─%B$%b "
RPS1="${return_code}"

ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg[yellow]%}‹"
ZSH_THEME_GIT_PROMPT_SUFFIX="› %{$reset_color%}"
