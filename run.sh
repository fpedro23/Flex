#Compile 

clear
flex rules.l
bison -d grammar.y
gcc grammar.tab.c -o scanner -ll

./scanner < test1.txt

./scanner < test2.txt

./scanner < test3.txt

./scanner < test4.txt
