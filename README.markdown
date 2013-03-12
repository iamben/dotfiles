iamben's Dotfiles / Configuration
=========================
Installation
-------------
1. Checkout the repo into any directory **under $HOME** (arbitrary layer allowed)

        $ git clone git://github.com/iamben/Conf_VCS.git ${HOME}/<your-dir>

2. Run the install script, this should also backup your current conf (.bak)

        $ cd ${HOME}/<your-dir> && ./new install

- Upgrading: just re-run step 2

Uninstallation
---------------
1. Run installation script with action: uninstall, this should also revert the backups if available

        $ cd ${HOME}/<your-dir> && ./new uninstall

2. Manually remove the repository

        $ rm -rf ${HOME}/<your-dir>
