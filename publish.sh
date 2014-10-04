#!/bin/sh

# Dieses Script erzeugt aus den Inhalten der Homepage die fertigen Seiten
# und veröffentlich diese auf github

# Zielverzeichnis, in dem die fertigen Seiten ausgecheckt wurden
DESTINATION=../Linux-Werkstatt-Oldenburg.github.io/

make publish

cp -Rv output/* $DESTINATION

cd $DESTINATION

git add .
git commit -a
git push

