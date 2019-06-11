set -x PATH $PATH /home/ceshine/miniconda3/bin

source /home/ceshine/miniconda3/etc/fish/conf.d/conda.fish
# set -gx CONDA_LEFT_PROMPT 1

set -g theme_date_format "+%Y-%m-%d %H:%M"
set -g theme_color_scheme solarized-dark

set -g NVM_DIR "/mnt/SSD_Data/nvm"

conda activate base

alias ping=prettyping
alias droplet "doctl compute droplet"
alias du "ncdu --color dark -rr -x --exclude .git --exclude node_modules"
if status --is-interactive
    nvm use node
end