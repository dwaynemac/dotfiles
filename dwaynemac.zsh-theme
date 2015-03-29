# ZSH Theme - based on gallifrey
local return_code="%(?..%{$fg[red]%}%? ↵%{$reset_color%})"
local ruby_version='$(ruby_prompt_info | gawk "gsub(\"ruby-\",\"\")" )%'

PROMPT='%{$fg[green]%}%m%{$reset_color%} %2~ $(git_prompt_info)%{$reset_color%}%B»%b '
RPS1="${return_code} ${ruby_version}"

ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg[yellow]%}‹"
ZSH_THEME_GIT_PROMPT_SUFFIX="› %{$reset_color%}"
