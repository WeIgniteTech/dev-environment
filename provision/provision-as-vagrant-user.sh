#!/bin/bash

echo -e "\n**** Lagre en  .gitconfig inn i VM ****\n"
cat <<EOL >> ~/.gitconfig
[user]
  name = YOUR_NAME_HERE
  email = your.mail@he.re
[color]
  diff = auto
  status = auto
  branch = auto
  interactive = auto
  ui = auto
[gc]
  auto = 1
[merge]
  summary = true
[alias]
  co = checkout
  ci = commit -v
  st = status
  cp = cherry-pick -x
  rb = rebase
  pr = pull --rebase
  br = branch
  b = branch -v
  r = remote -v
  t = tag -l
  put = push origin HEAD
  unstage = reset HEAD
  uncommit = reset --soft HEAD^
  recommit = commit -C head --amend
  dc = diff --cached
  pr = pull --rebase
  ar = add -A
EOL

echo -e "\n**** Install and enable Oh my zsh! ****\n"
touch ~/.zshrc
sudo apt-get -y install zsh
sudo apt-get -y install curl
sudo apt-get -y install tree

sudo chsh vagrant -s /bin/zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh | sed 's:env zsh::g' | sed 's:chsh -s .*$::g')"

echo -e "\n**** Preparing the environment ****\n"
sudo apt-get -y install maven
sudo apt-get -y install gedit
sudo apt-get -y install xclip

echo -e "\n**** Adding som functionality to start-up script ****\n"
cat <<EOL >> ~/.zshrc
SSH_ENV="$HOME/.ssh/environment"

function start_agent {
    echo "Initialising new SSH agent..."
    /usr/bin/ssh-agent | sed 's/^echo/#echo/' > "\${SSH_ENV}"
    echo succeeded
    chmod 600 "\${SSH_ENV}"
    . "\${SSH_ENV}" > /dev/null
    /usr/bin/ssh-add;
}

# Source SSH settings, if applicable

if [ -f "\${SSH_ENV}" ]; then
    . "\${SSH_ENV}" > /dev/null
    #ps \${SSH_AGENT_PID} doesn't work under cywgin
    ps -ef | grep \${SSH_AGENT_PID} | grep ssh-agent$ > /dev/null || {
        start_agent;
    }
else
    start_agent;
fi
EOL

mkdir Code
echo -e "\n**** Copy Hello.txt to Desktop ****\n"
wget -O /home/vagrant/Desktop/Hello.txt  https://raw.githubusercontent.com/WeIgniteTech/dev-environment/master/Hello.txt


echo -e "\n**** \n**** Installation is done!!!\n**** \n"
echo -e "\n\n"
echo -e "\n\n"
echo -e "\n Things todo in the Guest VM:\n"
echo -e " - Check keyboard mapping\n"
echo -e "  you might need to run the following command in the Guest VM to ajust keyboard mapping: \n"
echo -e "    sudo dpkg-reconfigure keyboard-configuration \n"
echo -e "\n"
echo -e " - Open web-browser from the task bar and make Chrome your default browser\n"


