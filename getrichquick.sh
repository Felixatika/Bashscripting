#!/bin/bash

echo "What is your name?"

 read name
echo "what is your age?"
read age
echo "Hello, $name, you are $age years old."

sleep 2 
echo "Let's calculate when you will be a millionaire"
echo "Calculating"
echo ".........."
sleep 1
echo "**........"
sleep 1
echo "****......"
sleep 1
echo "******...."
sleep 1
echo "************"
getrich=$((( $RANDOM % 15 ) + $age))

echo "Hey $name you are gonna be a millionaire at $getrich years old"




