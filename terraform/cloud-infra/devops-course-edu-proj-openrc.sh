
#!/usr/bin/env bash
 
export OS_AUTH_URL="https://infra.mail.ru:35357/v3/"
 
export OS_PROJECT_ID="ed2b5bc2b31e4b1ea38020843b1fefd7"
export OS_REGION_NAME="RegionOne"
unset OS_PROJECT_NAME
unset OS_PROJECT_DOMAIN_ID
 
# unset v2.0 items in case set
unset OS_TENANT_ID
unset OS_TENANT_NAME

if [[ -z $OS_USERNAME ]] || [[ -z $OS_PASSWORD ]] || [[ "$OS_USERNAME" != "a.akmukhametov@innopolis.university" ]]; then
 
export OS_USERNAME="a.akmukhametov@innopolis.university"
export OS_USER_DOMAIN_NAME="users"
 
# With Keystone you pass the keystone password.
echo "Please enter your OpenStack Password for project $OS_PROJECT_ID as user $OS_USERNAME: "
read -sr OS_PASSWORD_INPUT
export OS_PASSWORD=$OS_PASSWORD_INPUT

fi  

export OS_INTERFACE=public
export OS_IDENTITY_API_VERSION=3
