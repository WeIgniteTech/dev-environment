# Dev environment

Vagrant/VirtualBox base development environment. 

## HowTo
> First you have to download and install the following software on your machine
 * [VirtualBox](https://www.vagrantup.com/downloads.html)  (version > 2.1.5) 
 * [Vagrant](https://www.virtualbox.org/wiki/Downloads)  (version > 5.2.18) 

Test the install: 
 * Open a `console` and run `vagrant -v`. You should see something like: `Vagrant 2.1.5`
 * Open VirtualBox

> After the install is complete, you can use Vagrant and VirtualBox to install a fully provisioned VM 
 * Download this repository as a zip file
 * On your machine open unzip the content in a convenient folder (`C:\Users\myself\wit\` for example) 
 * Update the `Vagrantfile` with your name, cpus and RAM you can give to the virtual machine. Save the file. 
 * Open a `console` and navigate to the same folder
 * then run `vagrant up` ... this should take a few minutes
 * In `VirtualBox` you can `See` (opens as new window), `stop` and `start` the VM. Enjoy!

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

## Important
> This environment is dedicated to the program and should be not used 'as is' for writing production code (mainly because off SSH settings for GitHub). Keep in mind that this environment is not permanent and will eventually be destroyed. 

