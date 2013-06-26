#!/bin/bash

function createlaunch() {
mkdir -p ~/.local/share/applications
cp ./desktop_launcher/*.desktop ~/.local/share/applications/
}

function createAutoStart() {
mkdir -p ~/.config/autostart
cp ./desktop_autostart/*.desktop ~/.config/autostart
}
