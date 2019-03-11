# Count current lines
wc -l data/dailymail.txt

# Use Wombat to download latest sidebar headlines
ruby ./dailymail.rb > tmp/sidebar.txt

# Make a copy of the current training data
cp data/dailymail.txt tmp/current.txt

# Concatenate the new and current data
cat tmp/current.txt tmp/sidebar.txt > tmp/latest.txt

# Remove any duplicates and update the set
awk '!seen[$0]++' tmp/latest.txt > data/dailymail.txt

# Create alternative paragraph line-wrap
sed 's/$/.\'$'\n/' data/dailymail.txt > tmp/sentences.txt
fold -w 66 -s tmp/sentences.txt > data/dailymail-paragraph.txt

# Remote temporary work files
rm -r tmp/*.txt

# Show the new number of headlines
wc -l data/dailymail.txt

git add data/dailymail.txt
git add data/dailymail-paragraph.txt
git commit -m "Added additional headlines"
git push