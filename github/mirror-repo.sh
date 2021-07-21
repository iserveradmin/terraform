#variables 
RED='\033[0;31m'
NC='\033[0m'
##########
read -p "provide the reposetory name for local cloaning [core-go]: " REPONAME
REPONAME=${REPONAME:iserver-core-go}
read -p "provide the new organization name [iserver]: " NEWORG
NEWORG=${NEWORG:-iserver}
read -p "provide the old organization name [open-insight-marketplace]: " OLDORG
OLDORG=${OLDORG:-open-insight-marketplace}
echo "first mirroring the repository."
git clone --mirror  https://github.com/$OLDORG/$REPONAME
cd $REPONAME.git
git remote add  $REPONAME  https://github.com/$NEWORG/$REPONAME
git push   $REPONAME --mirror
 

cd ../
rm -rf  $REPONAME.git
#find the dependncy list in repository
if [ -d $REPONAME ] 
then
    echo "$REPONAME already exist in current folder. please delete it and run again."
    #; exit
else
echo "mirror cloaning the repo .........."
git clone  https://github.com/$OLDORG/$REPONAME
fi

printf "finding go.mod locations in downloaded folder."
MODFILES=$(find $REPONAME -name "go.mod")
echo "################################################"
echo "here is the list of internal dependency "
for i in `echo $MODFILES` ; do grep $OLDORG $i ; done
#find the location list where organization name is listed
echo "################################################"
FILES=$(grep -lr  github.com/$OLDORG $REPONAME/* )

if [[ -z $FILES  ]]    # ← see 'man bash' for valid conditional statements.
then
     echo "no file changes requied"   
    
else
    #echo "file changes required"
    # let customer know we found more files where old git url added. 
filelist=$(echo $FILES | wc -l )
echo -ne "we found total ${RED}$filelist${NC} files where old orgnization git url mension. would you like to see that list? [yes or no]: "
    read yno
    case $yno in

        [yY] | [yY][Ee][Ss] )
                for i in `echo $FILES` ; do grep "github.com/$OLDORG" $i ; done 
                ;;

        [nN] | [nN][Oo] )
                echo "Not agreed, Operation Aborted";
                #exit 1
                ;;
        *) echo "Invalid input"
            ;;
    esac

    echo -ne "modify old orgnization ${RED}$OLDORG${NC} github url and replace with new orgnization url ${RED}$NEWORG${NC}. changes will be done in local cloned repository only. ? [yes or no]: "
    read yno
    case $yno in

        [yY] | [yY][Ee][Ss] )
                for i in `echo $FILES`; do sed -i 's/'$OLDORG'/'$NEWORG'/g' $i ; done;
                echo "Changes Sucessfully Done.";
                ;;

        [nN] | [nN][Oo] )
                echo "Not agreed, Operation Aborted";
                #exit 1
                ;;
        *) echo "Invalid input"
            ;;
esac


fi

echo "updating Repository with changes .........."
cd $REPONAME
git remote add  $REPONAME  https://github.com/$NEWORG/$REPONAME
git push $REPONAME  
cd ../
rm -rf $REPONAME
echo "repository content deleted from local"