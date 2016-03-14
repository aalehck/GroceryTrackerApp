# Grocery Tracker Application

## Setting up your development environment

The easiest way to set up a development environment for Grocery Tracker is to
use [Vagrant][]. After downloading and installing Vagrant, you can set up a
development environment for Grocery Tracker by opening a command prompt in the
project directory and running `vagrant up`. This will create a VM with all the
necessary utilities installed for developing Grocery Tracker.

After `vagrant up` completes, you can run `vagrant ssh` to open a command prompt
inside the VM. The project is located at `/vagrant` inside the VM. You may need
to run `bundle install` from inside that directory to install the remaining
dependencies for the project before you can begin developing.

To try out the application from the VM, run `rails server` to start the server,
then access the site in your browser at <http://localhost:3000/>.

When you're finished developing, you can close the ssh session and run
`vagrant halt` to stop the VM.

For more information on using Vagrant, read the [documentation][vagrant-docs] on
vagrantup.com.

[Vagrant]: https://www.vagrantup.com/
[vagrant-docs]: https://www.vagrantup.com/docs/
