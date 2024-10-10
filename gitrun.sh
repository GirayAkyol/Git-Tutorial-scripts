#add, commit
#checkout, branch
#restore, reset, worktree
#merge
#push, fetch
#merge ff
#gitlab
#bisect, revert
#useful history
#rebase -i
#squash merge, gitlab
#rebase then bisect?


##Zip analogy? commit = zip + metadata
##git is smart -- dedup, stores parents

##manipulate the graph.

##create a commit

##worktree, index, HEAD (this is goint to be prant of a new commit)

#demoS
#vscode
git init
git commit --allow-empty -m "Init"
#sidescript

#boilerplate
cat ../demos/1calc > calc.py   
git add .
git commit -m "Boilerplate"

cat ../demos/2calc > calc.py   
git add .
git commit -m "Add"
#demoE

##checkout, branch

#demoS
git checkout HEAD~
git branch feat-sub
git checkout feat-sub
cat ../demos/3.1calc > calc.py #buggy
git add .
git commit -m "sub buggy"

git checkout master

git checkout feat-sub
python ./calc.py 7 - 5
cat ../demos/3.2calc > calc.py #fixed
cat ../demos/3test > test.sh
bash ./test.sh
git add .
git commit -m "sub fixed"
#demoE


##restore, reset, worktree

#demoS
git checkout master
git restore -s feat-sub --worktree test.sh
bash ./test.sh # to fail
cat ../demos/4test > test.sh
bash ./test.sh
git add .
git commit -m "Test"
#demoE

#demoS
git checkout feat-sub
git reset --soft HEAD~~
git commit -m "Sub"
bash ./test.sh
git checkout master

rm -rf ../wt1
git worktree add ../wt1 feat-sub
cd ../wt1

bash ./test.sh

cd ../try1
git worktree remove ../wt1
#demoE


##merge
#demoS
git checkout master
git merge feat-sub 
cat ../demos/4.5calc > calc.py
cat ../demos/4.5test > test.sh
bash ./test.sh 
#vscode
git add .
git commit
#demoE

##push
git remote add origin https://github.com/GirayAkyol/Git-Tutorial.git
git push origin HEAD:master --force

git branch -r | grep -v 'master' | sed 's/origin\///' | xargs -I {} git push origin --delete {}
rm -rf ../try2
git clone https://github.com/GirayAkyol/Git-Tutorial.git ../try2
cd ../try2
cat ../demos/5calc > calc.py
cat ../demos/5test > test.sh
bash ./test.sh
git add .
git commit -m "Product"
git push origin HEAD:master


cd ../try1
git fetch
git merge origin/master



git branch feat-div
git checkout feat-div
cat ../demos/6calc > calc.py
cat ../demos/6test > test.sh
bash ./test.sh
git add .
git commit -m "Division"

git push origin HEAD:feat-div --force
nano -v ../demos/openPR
#gh open PR

git checkout master
cat ../demos/7test > test.sh
bash ./test.sh
git add .
git commit -m "Extra test"
git push origin HEAD:master
#GH recheck PR, merge conflict

git checkout feat-div
git merge origin/master 
cat ../demos/8test > test.sh
bash ./test.sh
git add .
git commit
git push origin HEAD:feat-div

#gh merge
nano -v ../demos/mergePR

git checkout master
git fetch
git merge origin/master

#bisect
git bisect start HEAD  HEAD~7
git bisect run python ./calc.py 7/0

git bisect reset
git revert HEAD~2 #cancel this
git revert --abort

#squash
bash ../dirtyhist.sh

git checkout master
git merge --squash feat-pow
git merge --abort #unnecessary

#GH create PR
#GH squash merge PR


 













