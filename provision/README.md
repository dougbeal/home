# provision my computing devices
## prep osx host (control machine)
### install https://github.com/dougbeal/homebrew-mdrip.git to run this readme
`mdrip --label prep --label host --mode test README.md`
<!-- @prep @host -->
```
pip install ansible
pip install "pywinrm>=0.2.2"
pip install pywinrm[credssp]
```
### delegate vault password to keychain https://jefframnani.com/use-ansible-vault-with-macos-keychain/
```
security add-generic-password \
  -a dougbeal \
  -s ansible-vault-password \
  -w <auto-generate-a-secret>
  ```
## prep target windows machine
### run PowerShell 3.0 as Administrator
### download https://github.com/ansible/ansible/blob/devel/examples/scripts/ConfigureRemotingForAnsible.ps1
```
.\ConfigureRemotingForAnsible.ps1 -EnableCredSSP -Verbose
net user /add ansible <generate secure pssword> /expires:never
net localgroup administrators ansible /add

```
<!-- @test -->
```
ANSIBLE_CONFIG=./.ansible.cfg ansible windows -i inventory -m win_ping 
ANSIBLE_CONFIG=./.ansible.cfg ansible windows -i inventory -m setup
ANSIBLE_CONFIG=./.ansible.cfg ansible-playbook -i inventory --skip-tags install install-memu.yml 
```

## provision
### osx imac
### win10 desktop
Use CredSSP
<!-- @provision @windows -->
```
ansible_winrm_transport="credssp"

```
