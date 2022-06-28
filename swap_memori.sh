#!/bin/sh 
#Created by Roxas
#https://github.com/TuryRx/Banana-pi-m2-zero-GPIO

#echo 'Ampliar Memoria de Intercambio(Swap)'  

sleep 2s

#comandos para ver memoria swap (swapon –s)(free –m).
sudo free -m
#Cambiar 245M por la cantidad que quiera.
#Para BPi o RPi poner solo multiplos de la cantidad actual. 
sudo fallocate -l 735M /swapfile  
#Comprobar que se creo el archivo.
sudo ls -lh /swapfile
#Habilitar permisos para el archivo de memoria.
sudo chmod 600 /swapfile
#Notificar al sistema que el archivo se usará como memoria swap.
sudo mkswap /swapfile
#Activar el archivo como memoria swap.
sudo swapon /swapfile
#Verificar que la nueva memoria swap esté configurada.
sudo free -m
#Agregar nueva memoria swap al archivo fstab para hacerlo permanente
echo '/swapfile   none    swap    sw    0   0' | sudo tee -a /etc/fstab

sleep 2s

echo 'Operation Successfully Completed'