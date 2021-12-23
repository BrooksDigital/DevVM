# DevVM

This is an attempt to sort out performance issues with docker and OSX. This should also help with Windows. If you have linux, you can skip this and use lando natively. The idea behind this is that instead of using Docker for Mac, we are going to use a Linux VM and develop natively within the VM using VS Code's [Remote Development using SSH][vscode-ssh].

If you used Docker for Mac you are probably better clearing all images and shutting Docker off not to take up resources unnecessary.

## Steps to set the VM up

You can watch a video (18min). You can probably skip it as you see best, most of the processing parts are already sped up considerably. (Sorry about the accent!)

[![Watch video](https://img.youtube.com/vi/7xdREuM4oVw/0.jpg)](https://www.youtube.com/watch?v=7xdREuM4oVw)
[Play video!](https://www.youtube.com/watch?v=7xdREuM4oVw)

1. To provision the VM you only need [VirtualBox][virtualbox] and [Vagrant][vagrant], please install both tools.
1. Clone the repo
1. Run `vagrant up` and wait for it to finish
1. Run `vagrant ssh-config` and add the output of this to your `~/.ssh/config` file. You can also run `vagrant ssh-config >> ~/.ssh/config` to do this automatically.

## Steps to use the VM with VS Code

1. To develop properly you'll need [Visual Studio Code][vscode] and the [Remote SSH extension][vscode-ssh-extension].
1. Connect to the VM `brooksdigital`. First time doing this will install VS Code Server on the machine.
1. Make sure your preferred VS Code Extensions are also installed on the VM, this needs to be done so that most extensions runs within the VM.
1. You can use the VS Code terminal to use the usual terminal commands (`lando start` et all).

## Recommended VS Code Extensions

- [Remote SSH extension - needed][vscode-ssh-extension]
- [PHP Intelephense - must have](https://marketplace.visualstudio.com/items?itemName=bmewburn.vscode-intelephense-client)
- [GitLens - ubiquitous](https://marketplace.visualstudio.com/items?itemName=eamodio.gitlens)
- [Commit Message Editor](https://marketplace.visualstudio.com/items?itemName=adam-bender.commit-message-editor)

If you have others you like, let us know which ones and why!

## Tune your VM resources

The VM is configured with comfortable defaults at [`vagrant.default.yml`](vagrant.default.yml). If you want to allocate more RAM or CPUs to your VM, you can do so overwriting any of the default values on a `vagrant.local.yml` which is ignored on the repo. From some few tests, I think less than 4GB of RAM will make the VM perform poorly.

[virtualbox]: https://www.virtualbox.org/wiki/Downloads
[vagrant]: https://www.vagrantup.com/downloads
[vscode]: https://code.visualstudio.com/download
[vscode-ssh]: https://code.visualstudio.com/docs/remote/ssh
[vscode-ssh-extension]: https://marketplace.visualstudio.com/items?itemName=ms-vscode-remote.remote-ssh
