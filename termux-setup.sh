#!/bin/bash

# update and install
pkg update -y
pkg install -y $PACKAGES
pkg install -y $ADDITONAL_PACKAGES

# termux keyboard
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
