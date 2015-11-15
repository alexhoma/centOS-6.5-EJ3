# En segun qué verson de centos, la ejecución de puppet falla
# Si ejecutamos los siguientes comandos cuando
# provisionemos vagrant, funcionará
#LC_ALL="C"
#export LC_ALL

# Pre-provisionamos vagrant, antes de provisionarlo
# para añadir todos los módulos necesarios
# para nuesrta máquina:
dir='/vagrant/modules/'

if [ -f "$dir"/apache ]; then
  echo "APACHE ya instalado."
  puppet module install --force puppetlabs/apache --modulepath $dir --version 1.6.0
else
  puppet module install puppetlabs/apache --modulepath $dir --version 1.6.0
fi

if [ -f "$dir"/yum ]; then
  echo "YUM REPO ya instalado."
  puppet module install --force example42/yum --modulepath $dir --version 2.1.25
else
  puppet module install example42/yum --modulepath $dir --version 2.1.25
fi

if [ -f "$dir"/php ]; then
  echo "PHP ya instalado."
  puppet module install --force example42/php --modulepath $dir --version 2.0.25
else
  puppet module install example42/php --modulepath $dir --version 2.0.25
fi

if [ -f "$dir"/mysql ]; then
  echo "MYSQL ya instalado."
  puppet module install --force puppetlabs/mysql --modulepath $dir --version 3.6.1
else
  puppet module install puppetlabs/mysql --modulepath $dir --version 3.6.1
fi

if [ -f "$dir"/custom_module ]; then
  echo "MODULO CUSTOM ya instalado."
  git pull
else
  # MY_MODULE
  git clone https://github.com/alexhoma/custom_module.git
  mv custom_module/ $dir
fi

if [ -f "$dir"/memcached ]; then
  echo "MEMCACHED ya instalado."
  puppet module install --force saz/memcached --modulepath $dir --version 2.8.1
else
  # MEMCACHED
  puppet module install saz/memcached --modulepath $dir --version 2.8.1
fi
