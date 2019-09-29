# you don't want to install onto your phone from a random repo, do you?
## fork https://github.com/ywangd/stash into your account [GITHUB_USER]
## fork https://github.com/ywangd/pythonista-tools-installer into your account [GITHUB_USER]
# create and checkout branch local
# point to your repo by running the following in your repo
* eats newline at end of file if no changes, Y U DO DAT?
``` Bash
GITHUB_USER=dougbeal && find . -depth 1 -type f -name '*.py' -exec sed -E -i '' s/ywangd/${GITHUB_USER}/g {} +
```

# copy into Pythonista as a .py file
* https://raw.githubusercontent.com/dougbeal/pythonista-stash-home/master/bootstrapstash.yp
``` Python
GITHUB_USER="dougbeal"
url = "https://raw.githubusercontent.com/%s/stash/local/getstash.py" % (GITHUB_USER)
import requests as r; exec(r.get(url).text)
```
# restart Pythonista
# create ssh key
``` Bash
git clone https://github.com/dougbeal/pythonista-stash-home.gitss
```
# past in sensitve env variables, or rename sensitve_template.sh to sensitive.sh
``` Bash
# you probably want to paste these in
REMOTE_TARGET=10.0.0.200
REMOTE_USERNAME=somesuer
MOBILE=iphone6s
```
# add .pub to ~/.ssh/authorized_keys
