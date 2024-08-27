#!/bin/bash

echo "# Running Termux setup"
echo "## pkg update and install"
pkg update -y
pkg upgrade -y
pkg install -y $PACKAGES
pkg install -y $ADDITONAL_PACKAGES
pkg install -y termux-api

echo "## Set up Termux keyboard extra keys"
echo "extra-keys = [[ \\
	{key: 'ESC'},	\\
	{key: '/', popup: '~'},	\\
	{key: '-'},	\\
	{key: 'HOME'},	\\
	{key: 'UP'},	\\
	{key: 'END'}	\\
],[			\\
	{key: 'TAB'},	\\
	{key: 'CTRL'},	\\
	{key: 'ALT'},	\\
	{key: 'LEFT'},	\\
	{key: 'DOWN'},	\\
	{key: 'RIGHT'}	\\
]]" >> ~/.termux/termux.properties
