#!/bin/sh

# Dieses Script erzeugt aus den Inhalten der Homepage die fertigen Seiten
# und veröffentlich diese auf github

# Zielverzeichnis, in dem die fertigen Seiten ausgecheckt wurden
DESTINATION=../Linux-Werkstatt-Oldenburg.github.io/
SOURCE=$(pwd)/

# Alte Seiten löschen

cd $DESTINATION

git rm -rf *
git commit -a

cd $SOURCE

make publish

cp -Rv output/* $DESTINATION
cp -v CNAME $DESTINATION

cd $DESTINATION

git add .
git commit -a
git push

