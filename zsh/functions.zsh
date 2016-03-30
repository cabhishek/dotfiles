# Create a new directory and enter it
function mkd() {
    mkdir -p "$@" && cd "$@"
}

function evl(){
  vm="default"

  if [ $# -ne 0 ]; then
    vm="$1"
  fi

  eval "$(docker-machine env $1)"
}

# Determine size of a file or total size of a directory
function fs() {
    if du -b /dev/null > /dev/null 2>&1; then
            local arg=-sbh
    else
            local arg=-sh
    fi
    if [[ -n "$@" ]]; then
            du $arg -- "$@" | sort -r
    else
            du $arg .[^.]* * | sort -r
    fi
}

# `o` with no arguments opens current directory, otherwise opens the given location
function o() {
    if [ $# -eq 0 ]; then
            open .
    else
            open "$@"
    fi
}

# Fire up notebook with dev django settings
function workbook(){
    echo "settings >> $@"
    python manage.py shell_plus --notebook --settings="$@"
}

# Generic iPython setup
function notebook(){
  jupyter notebook --profile=cabhishek
}

function myip(){
    ipconfig getifaddr en0
}

function publicip(){
    curl ipecho.net/plain; echo
}

# List all files with nice color highlighting
function tre() {
    tree -aC -I '.git|.local-cache|.venv|*.pyc|.DS_Store|__pycache__|node_modules|bower_components' --dirsfirst "$@" | less -FRNX;
}

# Go up [n] directories
function up()
{
    local cdir="$(pwd)"
    if [[ "${1}" == "" ]]; then
        cdir="$(dirname "${cdir}")"
    elif ! [[ "${1}" =~ ^[0-9]+$ ]]; then
        echo "Error: argument must be a number"
    elif ! [[ "${1}" -gt "0" ]]; then
        echo "Error: argument must be positive"
    else
        for i in {1..${1}}; do
            local ncdir="$(dirname "${cdir}")"
            if [[ "${cdir}" == "${ncdir}" ]]; then
                break
            else
                cdir="${ncdir}"
            fi
        done
    fi
    cd "${cdir}"
}

# Execute a command in a specific directory
function in() {
    (
        cd ${1} && shift && ${@}
    )
}

# Check if a file contains non-ascii characters
function nonascii() {
    LC_ALL=C grep -n '[^[:print:][:space:]]' "${1}"
}

# Search process and kill
function fkill() {
  pid=$(ps -ef | sed 1d | fzf -m | awk '{print $2}')

  if [ "x$pid" != "x" ]
  then
    kill -${1:-9} $pid
  fi
}

unalias z 2> /dev/null
function z() {
  if [[ -z "$*" ]]; then
    cd "$(_z -l 2>&1 | fzf +s --tac | sed 's/^[0-9,.]* *//')"
  else
    _z "$@"
  fi
}

#c - browse chrome history
function c() {
  local cols sep
  cols=$(( COLUMNS / 3 ))
  sep='{{::}}'

  # Copy History DB to circumvent the lock
  # - See http://stackoverflow.com/questions/8936878 for the file path
  cp -f ~/Library/Application\ Support/Google/Chrome/Default/History /tmp/h

  sqlite3 -separator $sep /tmp/h \
    "select substr(title, 1, $cols), url
     from urls order by last_visit_time desc" |
  awk -F $sep '{printf "%-'$cols's  \x1b[36m%s\n", $1, $2}' |
  fzf --ansi --multi | sed 's#.*\(https*://\)#\1#' | xargs open
}

# v - open files in ~/.viminfo
v() {
  local files
  files=$(grep '^>' ~/.viminfo | cut -c3- |
          while read line; do
            [ -f "${line/\~/$HOME}" ] && echo "$line"
          done | fzf-tmux -d -m -q "$*" -1) && vim ${files//\~/$HOME}
}
