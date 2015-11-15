# MISCELANEOUS PACKAGES

$misc_packages = ['vim-enhanced','telnet','git','zip','unzip','screen','libssh2','libssh2-devel','gcc','gcc-c++','autoconf','automake']
package { $misc_packages: ensure => latest }


# INCLUDE A MI MODULO CUSTOMIZADO

class {'custom_module':}
