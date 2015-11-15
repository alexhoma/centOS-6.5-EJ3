# En segun qué verson de centos, la ejecución de puppet falla
# Si ejecutamos los siguientes comandos cuando
# provisionemos vagrant, funcionará
LC_ALL="C"
export LC_ALL

# Pre-provisionamos vagrant, antes de provisionarlo
# para añadir todos los módulos necesarios
# para nuesrta máquina:
dir='/vagrant/modules/'
puppet module install puppetlabs/apache --modulepath $dir --version 1.6.0
puppet module install example42/yum --modulepath $dir --version 2.1.25
puppet module install example42/php --modulepath $dir -version 2.0.25
puppet module install puppetlabs/mysql --modulepath $dir -version 3.6.1

# MY_MODULE
git clone https://github.com/alexhoma/my_module.git $dir

# EPEL
puppet module install stahnma/epel --modulepath $dir -version 1.1.1
# MEMCACHED
puppet module install saz/memcached --modulepath $dir -version 2.8.1