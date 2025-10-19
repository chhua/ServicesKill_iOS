#!/bin/sh

###Only work under rootful devices###

BACKUP_PATH="/var/root/LaunchDaemonsBackup"
DAEMON_PATH="/System/Library/LaunchDaemons"
DAEMONS_TO_REMOVE="
com.apple.DumpPanic.plist
com.apple.DumpBasebandCrash.plist
com.apple.ReportCrash*.plist
com.apple.CrashHouseKeeping.plist
com.apple.powerlog.plist
com.apple.chud.chum.plist
com.apple.chud.pilotfish.plist
com.apple.mobile.profile_janitor.plist
com.apple.aslmanager.plist
com.apple.syslogd.plist
com.apple.mobile.obliteration.plist
com.apple.printd.plist
com.apple.marcoagent.plist
com.apple.mobile.installd.mount_helper.plist
com.apple.mobile.storage_mounter.plist
com.apple.AddressBook.plist
com.apple.AdminLite.plist
com.apple.appsupport.cplogd.plist
com.apple.crash_mover.plist
com.apple.mobile.softwareupdated.plist
com.apple.OTACrashCopier.plist
com.apple.OTATaskingAgent.plist
com.apple.softwareupdateservicesd.plist
com.apple.Springboard.SetupHelper.plist
com.apple.certui.relay.plist
com.apple.sharktrace.plist
com.apple.daily.plist
com.apple.wapic.plist
com.apple.midiserver-ios.plist
"

echo "Choose an action:"
echo "[a] Optimize system (remove selected daemons)"
echo "[b] Restore backup"
echo "[c] Delete this script"

read -r -p "Enter your choice (a/b/c): " choose

case "$choose" in
  a)
    echo "Creating backup..."
    mkdir -p "$BACKUP_PATH"
    cp -r "$DAEMON_PATH"/* "$BACKUP_PATH"/
    echo "Backup complete. Starting daemon removal..."

    for daemon in $DAEMONS_TO_REMOVE; do
      rm -f "$DAEMON_PATH"/$daemon 2>/dev/null && echo "Removed: $daemon"
      sleep 0.5
    done

    echo "Optimization complete!"
    ;;

  b)
    echo "Restoring backup..."
    cp -r "$BACKUP_PATH"/* "$DAEMON_PATH"/
    echo "Restore complete. System will reboot in 10 seconds..."
    sleep 10
    reboot
    ;;

  c)
    echo "Deleting script..."
    rm -- "$0"
    ;;

  *)
    echo "Invalid option. Exiting."
    exit 1
    ;;
esac
