# Conduit CLI on Android (Termux, No Root)

## 1) Install Termux (F-Droid)
Download and install Termux from the official F-Droid link (not Google Play):

    https://f-droid.org/repo/com.termux_1022.apk

## 2) Run the installer
Open the Termux app and paste this command, then press Enter:

    curl -fsSL https://raw.githubusercontent.com/kianoosh21/conduit-cli-termux-no-root/main/install.sh | bash

## 3) Wait for it to finish
Wait 5–10 minutes until you see:

[OK] Connected to Psiphon network

## 4) You’re done
Once connected, you can minimize Termux or lock your phone.
Congratulations — you are now serving your internet with ~500 people.

## CPU notes
- 4Core CPU: 500 users is totally fine
- 8Core CPU: you can increase to 1000 users if you want

