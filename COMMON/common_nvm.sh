#!/usr/bin/env false

if [ ! -x "$(command -v git)" ] && [ ! -x "$(command -v curl)" ] && _is_user_sudoer; then
  sudo apt install -y git curl
fi

if [ -x "$(command -v git)" ] && [ -x "$(command -v curl)" ]; then

  # Get nvm repo
  if [[ ! -d ~/.nvm ]]; then
    curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.3/install.sh | bash
    _replace_dotrc_files
  fi

  # Enables nvm
  export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
  [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"

  # Make sure a version of node is installed
  if ! [ -x "$(command -v node)" ]; then
    nvm install 18
  fi

fi
