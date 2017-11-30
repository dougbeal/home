# you don't want to install onto your phone from a random repo, do you?
## fork https://github.com/ywangd/stash into your account [GITHUB_USER]
## fork https://github.com/ywangd/pythonista-tools-installer into your account [GITHUB_USER]
# create and checkout branch local
# point to your repo by running the following in your repo
* eats newline at end of file if no changes, Y U DO DAT?
``` Bash
GITHUB_USER=dougbeal && find . -depth 1 -type f -name '*.py' -exec sed -E -i '' s/ywangd/${GITHUB_USER}/g {} +
```
# install in Pythonista
``` Python
GITHUB_USER="dougbeal"
url = "https://raw.githubusercontent.com/%s/stash/local/getstash.py" % (GITHUB_USER)
import requests as r; exec(r.get(url).text)
```
# restart Pythonista
# create ssh key
``` Bash
REMOTE_TARGET=10.0.1.242
REMOTE_USERNAME=dougbeal
MOBILE=iphone7
SSH_FILENAME="stash-pythonista-${MOBILE}
echo "Need remote password for ${REMOTE_USERNAME} on ${REMOTE_TARGET}"
read REMOTE_PASSWORD
mkdir -p "$STASH_ROOT/.ssh"
cd "$STASH_ROOT/.ssh"
ssh-keygen -t dsa -f ${SSH_FILENAME}
scp --password ${REMOTE_PASSWORD} stash-pythonista* ${REMOTE_USERNAME}@${REMOTE_TARGET}:~/.ssh/

```
# add .pub to ~/.ssh/authorized_keys
