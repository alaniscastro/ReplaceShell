#It´s important to remember that the new line or tabs will be lost

args=("$@")

FILE_NAME=${args[0]} 		  #Path to the file
FINAL_FILE=${args[1]} 		#Path to the file and the name you want to give it
OLD_STRING=${args[2]}	    #The string you want to replace
NEW_STRING=${args[3]}   	#What you want to replace the string with

#Creating the file to export the data
        touch $FINAL_FILE

echo "Replacing '$OLD_STRING' for '$NEW_STRING' globally in $FILE_NAME"

while read line; do
        a=""
        for word in $line; do
                if [ $OLD_STRING == $word ]; then
                        a+=$NEW_STRING
                        echo -n "$a" >> $FINAL_FILE
                else
                        a+=$word
                        echo -n "$a" >> $FINAL_FILE
                fi
        a=" "
        done
        echo "" >> $FINAL_FILE
done < $FILE_NAME
