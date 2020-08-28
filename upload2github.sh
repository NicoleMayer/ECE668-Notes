printf "\033[0;32mDeploying updates to GitHub...\033[0m\n"

# Add changes to git.
git add .

echo "1) Notetaking in class"
echo "2) Re-sort the notes and solve some questions"
echo "3) Review and remarks"
echo "4) Other?"

read number

# Commit changes.
if [ 1 == $number ]; then
	msg="Notetaking in class `date '+%Y-%m-%d %H:%M:%S'`"
elif [ 2 == $number ]; then
	msg="Solve some questions `date '+%Y-%m-%d %H:%M:%S'`"
elif [ 3 == $number ]; then
	msg="Review and remarks `date '+%Y-%m-%d %H:%M:%S'`"
elif [ 4 == $number ]; then
	read userWantedCommit
	msg="$userWantedCommit `date '+%Y-%m-%d %H:%M:%S'`"
fi
git commit -m "$msg"

# Push source and build repos.
git push origin master