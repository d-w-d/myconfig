#!/usr/bin/env false

if [ ! -x "$(command -v git)" ] && [ ! -x "$(command -v curl)" ] && _is_user_sudoer; then
  sudo apt install -y git curl
else
  sleep 10
  echo -e """${RED}
    WARNING! Missing git and/or curl so can't install nvm!
    This might mess up your vim installation and/or operation
    since it depends on npm for typescript etc.
  ${WHI}"""
fi

if [ -x "$(command -v git)" ] && [ -x "$(command -v curl)" ]; then

  # Get nvm repo
  if [[ ! -d ~/.nvm ]]; then
    curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.3/install.sh | bash
    _replace_dotrc_files
  else
    cd ~/.nvm
    git pull
  fi

  # Enables nvm
  export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
  [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"

  # Make sure a version of node is installed
  if ! [ -x "$(command -v node)" ]; then
    nvm install 18
  fi

fi
