
clear
echo "   _____                            _   __     __ "
echo "  / ___/___  ____ __   _____  _____/ | / ___  / /_"
echo "  \__ \/ _ \/ __ `| | / / _ \/ ___/  |/ / _ \/ __/"
echo " ___/ /  __/ /_/ /| |/ /  __/ /  / /|  /  __/ /_  "
echo "/____/\___/\__,_/ |___/\___/_/  /_/ |_/\___/\__/  "
sleep 3

packet=0
#removes any other files labelled under target.txt so we don't save the ping status to the wrong file
rm target.txt

#reads target to send packets to
echo "target ip?"
read target

#changes file sorry just easier to put together at 2 am when everything is the same
echo "filename to store under?"
read fil
touch $fil.txt
mv $fil.txt target.txt

for i in {1..10000}
do
if [ -s target.txt ]
        then
                packet=$((packet - 1))
                echo "the max packet count is"$packet
        else
                packet=$((packet + 1))
                ping $target -c 1 -s $packet
fi
done
