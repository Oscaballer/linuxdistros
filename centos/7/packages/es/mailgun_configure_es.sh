#!/bin/bash
#https://gist.githubusercontent.com/jgeewax/2c63810a534197c8a6be/raw/203189bf2b8e6ed26bba227085ff40f5e8f4bfc2/configure-mailgun
# Configuration for the script
sudo su -

POSTFIX_CONFIG=/etc/postfix/main.cf
POSTFIX_SASL=/etc/postfix/sasl_passwd

function confirm(){
  read -r -p "${1:-Estas segur@? [Y/n]} " response
  if [[ $response == "" || $response == "y"  || $response == "Y" ]]; 
  then
    echo 0
  else
    echo 1
  fi
}

# Check that we're root, otherwise exit!
if [ "$(id -u)" != "0" ]; 
then
   echo "Este script se debe ejecutar como root!" 1>&2
   exit 1
fi

# Read some configuration input
read -r -p "Escriba el Mailgun SMTP login: " SMTP_LOGIN
read -r -p "Escriba el Mailgun SMTP password: " SMTP_PASSWORD

CONTINUE=`confirm "Continuar con $SMTP_LOGIN:$SMTP_PASSWORD? [Y/n] "`
if [[ CONTINUE -ne 0 ]]; 
then
  echo "Cancelado..."
  exit;
fi

# Set a safe umask
umask 077

# Install postfix and friends
yum install postfix cyrus-sasl-plain cyrus-sasl-md5 -y

# Comment out a couple transport configurations
sed -i.bak "s/default_transport = error/# default_transport = error/g" $POSTFIX_CONFIG
sed -i.bak "s/relay_transport = error/# relay_transport = error/g" $POSTFIX_CONFIG
sed -i.bak "s/relayhost =/# relayhost =/g" $POSTFIX_CONFIG

# Add the relay host for Mailgun, force SSL/TLS, and other config
cat >> $POSTFIX_CONFIG << EOF

# Mailgun configuration
relayhost = [smtp.mailgun.org]:2525
smtp_tls_security_level = encrypt
smtp_sasl_auth_enable = yes
smtp_sasl_password_maps = hash:/etc/postfix/sasl_passwd
smtp_sasl_security_options = noanonymous
EOF

# Authentication stuff
cat > /etc/postfix/sasl_passwd << EOF
[smtp.mailgun.org]:2525 YOUR_SMTP_LOGIN:YOUR_SMTP_PASSWORD
EOF

# Generate a .db file and remove the old file
postmap $POSTFIX_SASL
ls -l $POSTFIX_SASL*
rm $POSTFIX_SASL

# Set the permissions on the .db file
chmod 600 $POSTFIX_SASL.db
ls -la /etc/postfix/sasl_passwd.db

# Reload Postfix
postfix reload
