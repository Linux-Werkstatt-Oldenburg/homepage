#!/bin/sh

# Dieses Script startet den Pelican Server, um eine Vorschau zu erhalten

xterm -e make serve &
xterm -e make regenerate &


