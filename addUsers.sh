#!/bin/bash

#vérification de la présence d'argument 
if test $# -eq 0
  then
   echo "Il manque les noms d'utilisateurs en argument "
  exit
fi
# boucle for pour pouvoir créer autant d'utilisateur que l utilisateur demande
for username in $@
do 
  #verification de l'existence ou non de l utilisateur et creation si il n exite pas
  if grep -q "$username:" < /etc/passwd
     then
      echo "L'utilisateur $username existe déjà" 
     else 
      useradd $username
     #verification si la creation du compte a éte reussis ou non
     if test $? -eq 0
       then 
        echo "L'utilisateur $username a été crée"
       else 
        echo "Erreur à la création de l'utilisateur $username"
    fi
  fi
done
exit
