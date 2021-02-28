# iTerm2
export CLICOLOR=1
export TERM=xterm-256color

# NodeJS
export NVM_DIR=~/.nvm
source $(brew --prefix nvm)/nvm.sh

# Android Setting
export ANDROID_HOME=~/Library/Android/sdk
export PATH=$PATH:$ANDROID_HOME/platform-tools:$ANDROID_HOME/tools

# Alias
alias ll="ls -al"
alias vim="mvim -v"
alias vi="mvim -v"
alias vimdiff="mvimdiff -v"
alias clean="find . | grep \"~\" | xargs rm"
alias lsusb="system_profiler SPUSBDataType"

# Go path
export GOPATH=$HOME/GoProject
export PATH=$PATH:$GOPATH/bin

# Inovex OSSA
export NPM_TASSO_REGISTRY_TOKEN=eyJ2ZXIiOiIyIiwidHlwIjoiSldUIiwiYWxnIjoiUlMyNTYiLCJraWQiOiJSMkc5Y0x2dElsdTZIbXVRQ09TQkxGT1J5SklocDMtb2w2UFhpRURCbEhVIn0.eyJzdWIiOiJqZnJ0QDAxYzk3OXg3dnZkN2VqMTJ6NWg5cncxOXNmXC91c2Vyc1wvcmljaGFyZF9jaGFuZy1hbmRyb3ZpZGVvLmNvbSIsInNjcCI6Im1lbWJlci1vZi1ncm91cHM6KiBhcGk6KiIsImF1ZCI6ImpmcnRAMDFjOTc5eDd2dmQ3ZWoxMno1aDlydzE5c2YiLCJpc3MiOiJqZnJ0QDAxYzk3OXg3dnZkN2VqMTJ6NWg5cncxOXNmIiwiaWF0IjoxNTMyNzEyNjQ0LCJqdGkiOiIzMWNiZjczOC04ZDhjLTQzYjItOWFlZi00MGZjNTlmZTMzNWEifQ.dZ0-Y-YyLbCYbfT8ckKtjVzX5vKDE_B-WKvvIIzBxFVUP3P5mSnrPtQDAszrutka4ajN-_NMl5C1H4CVgAc1O06d9QY-kAkyEu_WXipYqfeIkTuaBOP-vATzsxQrJQ7Wfm-OdF-B-72-2PVgRpSZuWFI2TAMNgKmmIa-lZdUPyr6HHtfO4r0sEwl-0ot2D-2oGGV8P6mCRrEVzXZIm_sCvZ3XLJwZUMp7A2_Q0BF6mz6CE0oTSD3wfRIhp6FENHcQIAVyGF_Opfe2W0vM_pRnBWwAxhRjd0xlYPaFVSMani_W58EH4jUM9OFyztSkVVlz83cqgGVe5vYFI56ljEzYg

# Flutter
export PATH=$PATH:~/development/flutter/bin

# Fastlane
export PATH="$HOME/.fastlane/bin:$PATH"

# Ruby
export PATH="/usr/local/opt/ruby/bin:$PATH"
export LDFLAGS="-L/usr/local/opt/readline/lib"
export CPPFLAGS="-I/usr/local/opt/readline/include"
export LDFLAGS="-L/usr/local/opt/ruby/lib"
export CPPFLAGS="-I/usr/local/opt/ruby/include"

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/richard/google-cloud-sdk/path.bash.inc' ]; then . '/Users/richard/google-cloud-sdk/path.bash.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/richard/google-cloud-sdk/completion.bash.inc' ]; then . '/Users/richard/google-cloud-sdk/completion.bash.inc'; fi

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/Users/richard/miniconda3/bin/conda' 'shell.bash' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/Users/richard/miniconda3/etc/profile.d/conda.sh" ]; then
        . "/Users/richard/miniconda3/etc/profile.d/conda.sh"
    else
        export PATH="/Users/richard/miniconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

