# xmrig-proxy-bash-scripts
A set of convenience scripts, written in bash, to help manage installation, configuration and update of [xmrig proxy](https://github.com/xmrig/xmrig-proxy).

## Download
* https://github.com/seanwhe/xmrig-proxy-bash-scripts
* Git clone with `git clone https://github.com/seanwhe/xmrig-proxy-bash-scripts`

### Prerequisites

There is allot to install so the install script will do most of the heavy lifting.
At the start the expectation is that you have:
* Computer running Ubuntu 18.04 (LTS)
* Bash shell
* User account with sudo privileges
* Installed git

### Agreeable

Some knowledge of:
* Linux Command Line Interface
* Linux shell `bash`

### Installation

1. Change to your user home directory.
   `cd ~`
1. Install git.
   `sudo apt install git`
1. Clone this project.
   `git clone https://github.com/seanwhe/xmrig-bash-scripts`
1. Change into the cloned directory.
   `cd xmrig-bash-scripts`
1. Run the install script
   `./install.sh`
1. When prompted: "Enter your own settings?" enter 'y'es.
1. Enter values for your:
   1. Algorithm to use
   1. Pool server URL
   1. Receive wallet address
   1. Pool password
   1. HTTP Access Port
   1. HTTP Access Token 
1. After install is complete. Attach to the screen session created during the installation.
   `screen -r`

### Operation

Defaults - The settings.sh contains a number of variables. With the exception of the 'xmrig-proxy' binary, which is installed to `/usr/bin/xmrig-proxy`, all files remain in the cloned project directory `~/xmrig-proxy-bash-scripts`. Any files generated while running the scripts are also created in this directory. 

During install the folder source for [xmrig proxy](https://github.com/xmrig/xmrig-proxy) is cloned to `~/xmrig-proxy-bash-scripts/xmrig-proxy/`. The file `config.json`, used to configure xmrig-proxy, is also created in this path and is passed to xmrig-proxy at startup. 

During installation it is recomended to enter your own settings. This creates a file named 'mysettings.sh' which will not be overwritten during future installs or upgrades. Values for variables found in 'mysettings.sh' are used to create 'config.json'.

This should work out the box, if you follow the installation steps and enter your own values for 'mysettings.sh.

Once you have a running xmrig then you can start playing around and tweaking to suite requirements.

What follows is a brief of the shell scripts you will find. The names are mostly self explanatory.
Comments and notes are used liberally in the scripts to help give you hints as to how it works.
The scripts are designed to be modular to promote resuse, execute exclusion and standalone execution.

* build.sh - clones xmrig-proxy to ``~/xmrig-proxy-bash-scripts`/xmrig-proxy`, configures, builds and copies xmrig-proxy to `/usr/bin/`
* config.sh - contains variables that aid in defining the values for the attributes found in config.json.
* crontab.sh - installs a cron to start xmrig-proxy @reboot (Can be commented out of install if desired).
* depends.sh - installs dependancies required by xmrig-proxy and these scripts.
* functions.sh - a collection of functions used in various of the scripts.
* input.sh - prompts to enter values for creating 'mysettings.sh'
* install.sh - the main entry point when first installing.
* maintenance.sh - performs apt update, upgrade, autoremove and autoclean operations.
* settings.sh - contains variables used by these scripts.
* start.sh - starts xmrig in a screen session.
* stop.sh - stops xmrig screen session.
* update.sh - pulls updates and runs installation

### Viewing the log
Default of the start script is to create a screen session named 'xmrig-proxy'.
This can be changed in the settings script if required.
To view the log after installation is finished or after running the start script, used the following command:
`screen -r xmrig-proxy`

### Updating
A simple `git update` in `~/xmrig-proxy-bash-scripts` will update these scripts.

The install script can be run at any time to update the xmrig source found `~/xmrig-proxy--bash-scripts/xmrig-proxy`.
The branch checkout is taken from the `_XMRIG_BRANCH` variable in `settings.sh`.

A script named update.sh is provided to perform both these steps in a single command.

## Reporting issues

[xmrig proxy](https://github.com/xmrig/xmrig-proxy) and [xmrig proxy bash scripts](https://github.com/seanwhe/xmrig-proxy-bash-scripts.git) are different projects run by different people.

While the developers of both projects may be seen interacting with one another on either project, we ask that you report issues to the respective projects.
In other words, post issues for:
* xmrig-proxy, the Monero (XMR) Stratum protocol proxy, over at [xmrig proxy issues tracker](https://github.com/xmrig/xmrig-proxy/issues)
* xmrig-proxy-bash-scripts, these conveniece scripts, over at [xmrig-proxy-bash-scripts](https://github.com/seanwhe/xmrig-proxy-bash-scripts/issues)

## Versioning

We use [SemVer](http://semver.org/) for versioning. For the versions available, see the [tags on this repository](https://github.com/seanwhe/xmrig-bash-scripts/tags).

## Contributing
Please read [CONTRIBUTING.md](https://gist.github.com/PurpleBooth/b24679402957c63ec426) for details on our code of conduct, and the process for submitting pull requests to us.

See also the list of [contributors](https://github.com/seanwhe/xmrig-bash-scripts/CONTRIBUTORS)

## Authors

* **Sean Wheller** - *Initial work* - [seanwhe](https://github.com/seanwhe)
