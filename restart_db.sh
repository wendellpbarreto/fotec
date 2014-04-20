#!/bin/bash
#
#-----------------------------------
# @autor: Wendell P. Barreto
# @email: wendellp.barreto@gmail.com
# @project: fotec
# @doc: restart_db.sh
# ----------------------------------


while true; do
    read -p "Are you using Linux (y or n)? " yn
    case $yn in
        [Yy]* )
        	sudo -u postgres psql -c 'DROP DATABASE fotec_db'
			sudo -u postgres psql -c 'CREATE DATABASE fotec_db'
			sudo -u postgres psql -c 'CREATE USER fotec_admin'
			sudo -u postgres psql -c 'GRANT ALL PRIVILEGES ON DATABASE fotec_db TO fotec_admin'
			# sudo -u postgres psql -d fotec_db -c 'CREATE EXTENSION hstore' 

			break;;
        [Nn]* ) 
			psql -c 'DROP DATABASE fotec_db'
			psql -c 'CREATE DATABASE fotec_db'
			psql -c 'CREATE USER fotec_admin'
			psql -c 'GRANT ALL PRIVILEGES ON DATABASE fotec_db TO fotec_admin'
			# psql -d fotec_db -c 'CREATE EXTENSION hstore'

			break;;
        * ) echo "Please answer yes or no.";;
    esac
done

python manage.py syncdb
python manage.py collectstatic --noinput