#Constants
#DB_Constants
DB_NAME=moodle
DB_USER=moodleuser
#generation file name
underscore="_"
curdatetime='date +%d%m%Y_%H%M'
filename=$DB_NAME$underscore$curdatetime".sql"

UP=$(pgrep mysql | wc -l);
if [ "$UP" -ne 1 ];
then
        echo "MySQL is down.";
        sudo service mysql start

else
        echo "All is well.";
fi

#make dump
mysqldump -u $DB_USER -p12345678 $DB_NAME > $filename.sql"
