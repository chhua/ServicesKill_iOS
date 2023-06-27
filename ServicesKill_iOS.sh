#!/bin/sh
cp -r /System/Library/LaunchDaemons/ /var/root #bak path

echo "Type 'a' Make your iDevice better."
echo "Type 'b' Restore backup."
echo "Type 'c' Delete this script."

read -p "" choose

if [ $choose = "a" ]; then
	echo "Deleting Services Daemon..."
	cd /System/Library/LaunchDaemons/
	rm -rf com.apple.DumpPanic.plist com.apple.DumpBasebandCrash.plist com.apple.ReportCrash*.plist 
	sleep 1
	rm -rf com.apple.CrashHouseKeeping.plist com.apple.powerlog.plist com.apple.chud.chum.plist com.apple.chud.pilotfish.plist 
	sleep 1
	rm -rf com.apple.mobile.profile_janitor.plist com.apple.aslmanager.plist com.apple.syslogd.plist com.apple.mobile.obliteration.plist 
	sleep 1
	rm -rf com.apple.printd.plist com.apple.marcoagent.plist com.apple.mobile.installd.mount_helper.plist 
	sleep 1
	rm -rf com.apple.mobile.storage_mounter.plist com.apple.AddressBook.plist com.apple.AdminLite.plist
	sleep 1 
	rm -rf com.apple.appsupport.cplogd.plist com.apple.crash_mover.plist com.apple.mobile.softwareupdated.plist 
	sleep 1
	rm -rf com.apple.OTACrashCopier.plist com.apple.OTATaskingAgent.plist com.apple.softwareupdateservicesd.plist 
	sleep 1
	rm -rf com.apple.Springboard.SetupHelper.plist com.apple.certui.relay.plist com.apple.sharktrace.plist com.apple.daily.plist 
	sleep 1
	rm -rf com.apple.wapic.plist com.apple.midiserver-ios.plist
	sleep 1
	echo "completed!!"
	cd /var/root/
elif [ $choose = "b" ]; then
	cp -rf LaunchDaemons/ /System/Library/
	echo "Restore done will restart in 10sec..." 
	sleep 10
	reboot
elif [ $choose = "c" ]; then
	echo "Done" && exec rm $0 
else 
	exit 0
fi
