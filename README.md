# Dev environment
> Practical *HowTo* for creating a Vagrant/VirtualBox based development environment. 

## Important
> This environment is dedicated to the program and *should not be used 'as is' for writing production code* (mainly because off SSH settings for GitHub). Keep in mind that this environment is not permanent and will eventually be destroyed. 

## HowTo

### Install some software on your PC
> First you have to download and install the following software on your machine
  * [VirtualBox](https://www.virtualbox.org/wiki/Downloads) (version > 5.2.18)
  * [Vagrant](https://www.vagrantup.com/downloads.html) (version > 2.1.5)

Test the install: 
 * Open a `console` and run `vagrant -v`. You should see something like: `Vagrant 2.1.5`
 * Open VirtualBox

### Use Vagrant to download and provision a Virtual Machine
> After the install of `VirtualBox` and `Vagrant` is complete, you can use `Vagrant` to install a fully provisioned VM 
 * Download this repository as a zip file.
   click on the green `Clone or Downoload` button and choose `Download ZIP` as explained [here](https://stackoverflow.com/questions/2751227/how-to-download-source-in-zip-format-from-github)
 * On your machine, unzip the downloaded file `dev-environment-master.zip` in a convenient folder of your choice (`C:\Users\myself\wit\` for example, the name and the location of the folder does not matter) 
 * **IMPORTANT**: You need to open the `Vagrantfile` with a text editor and provide your GitHub username, the email address you have registered on GitHub, the number of cpus and and amount of RAM you can give to the virtual machine. Then save the file `Vagrantfile`. 
 * Open a `console` and navigate to the same folder, where the `Vagrantfile` is.
 * then run `vagrant up` ... this will take a few minutes.

### Fine tuning (VM's settings in VirtualBox)
 > You can adjust some of the VM's setting in VirtualBox without updating the `Vagrantfile`
The `Vagrantfile` defines a VM with 2 cores and 2048 Mb of RAM by default. But once your VM is created you can change these settings as long as the VM i stopped (shut down). Be carefull to set values that won't compromise the host machine. 
The following settings can be modified like this: select your VM, then press `Settings` > `System` > then: 
 * `Motherboard` if you want to allocate more RAM (drag the cursor and stop before the red zone) 
 * `Processor` if you want to use more available cores. Use the cursor to give more cores to the VM

### Use VirtualBox to access your VM
 > In `VirtualBox`, just after provisioning you can press the `see` button (opens as new window). You can `stop` and `start` the VM at any time from `VirtualBox`.

### Make the VM ready to use with a few manual steps
> You need to go through these few manual steps to complete the install
 * Check keyboard mapping. You might need to run the following command in the Guest VM to ajust keyboard mapping:
   `sudo dpkg-reconfigure keyboard-configuration`
 * Open web-browser from the task bar and make Chrome your default browser
 * Add your public SSH key to GitHub:
   `xclip` is already installed on your VM. Just run:
   `xclip -sel clip < ~/.ssh/id_rsa.pub` (this will copy the key in your clipboard)
   And follow [these instructions](https://help.github.com/articles/adding-a-new-ssh-key-to-your-github-account/#platform-linux) *from step 2* 
 * You can test your SSH connection to GitHub like [this](https://help.github.com/articles/testing-your-ssh-connection/), *from step 1* (no need to follow other links)

## Daily use
### Troubleshouting 
 * A`System program problem detected` window pops up in the host, just after starting the VM. 
   It happens that the `display manager` crashes (while resizing the window or switch to full screen). Ubuntu informs the user by prompting a modal window indicating `System program problem detected`. 
   Solution: Haven't found yet how to avoid `LigthDM` to crash, but you can get rid of the info message. Run following command: `sudo rm -rf /var/crash/*`

## Under the hood
> Our `lubuntu 18.04` box is hosted on [Vagrant Cloud](https://app.vagrantup.com/weignitetech) 

Installed software on the VM: 
 * Java 8
 * Maven
 * Git
 * node
 * npm
 * Gedit
 * cUrl 
 * Visual Studio Code
 * Jetbrains toolbox (easy install IntelliJ - later)

