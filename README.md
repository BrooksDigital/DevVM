# DevVM

This is an attempt to sort out performance issues with docker and OSX. This should also help with Windows. If you have linux, you can skip this and use lando natively. The idea behind this is that instead of using Docker for Mac, we are going to use a Linux VM and develop natively within the VM using VS Code's [Remote Development using SSH][vscode-ssh].

If you used Docker for Mac you are probably better clearing all images and shutting Docker off not to take up resources unnecessary.

## Steps to set the VM up

1. To provision the VM you only need [VirtualBox][virtualbox] and [Vagrant][vagrant], please install both tools.
1. Clone the repo
1. Run `vagrant up` and wait for it to finish
1. Run `vagrant ssh-config` and add the output of this to your `~/.ssh/config` file. You can also run `vagrant ssh-config >> ~/.ssh/config` to do this automatically.

## Steps to use the VM with VS Code

1. To develop properly you'll need [Visual Studio Code][vscode] and the [Remote SSH extension][vscode-ssh-extension].
1. Connect to the VM `brooksdigital`. First time doing this will install VS Code Server on the machin.
1. Make sure your preferred VS Code Extensions are also installed on the VM, this needs to be done so that most extensions runs within the VM.
1. You can use the VS Code terminal to use the usual terminal commands (`lando start` et all).

## Tune your VM resources

The VM is configured with comfortable defaults at [`vagrant.default.yml`](vagrant.default.yml). If you want to allocate more RAM or CPUs to your VM, you can do so overwriting any of the default values on a `vagrant.local.yml` which is ignored on the repo. From some few tests, I think less than 4GB of RAM will make the VM perform poorly.

[virtualbox]: https://www.virtualbox.org/wiki/Downloads
[vagrant]: https://www.vagrantup.com/downloads
[vscode]: https://code.visualstudio.com/download
[vscode-ssh]: https://code.visualstudio.com/docs/remote/ssh
[vscode-ssh-extension]: https://marketplace.visualstudio.com/items?itemName=ms-vscode-remote.remote-ssh
