#!/bin/bash
# ============================================================================
# Break Reminder - Stand up and move!
# Displays a prominent overlay reminder at :00 and :30 every hour
# (e.g., 2:00pm, 2:30pm, 3:00pm, 3:30pm...)
# ============================================================================
#
# SETUP (new machine):
#   chmod +x ~/code/dotfiles/break-reminder.sh
#   ~/code/dotfiles/break-reminder.sh install
#
# USEFUL COMMANDS:
#   Install:           ~/code/dotfiles/break-reminder.sh install
#   Uninstall:         ~/code/dotfiles/break-reminder.sh uninstall
#   Stop reminders:    launchctl unload ~/Library/LaunchAgents/com.user.breakreminder.plist
#   Start reminders:   launchctl load ~/Library/LaunchAgents/com.user.breakreminder.plist
#   Test manually:     ~/code/dotfiles/break-reminder.sh
#   Check status:      launchctl list | grep breakreminder
#
# CHANGE SCHEDULE:
#   1. launchctl unload ~/Library/LaunchAgents/com.user.breakreminder.plist
#   2. Edit StartCalendarInterval in ~/Library/LaunchAgents/com.user.breakreminder.plist
#      Current: runs at minute 0 and 30 of every hour
#      For every hour: use only <integer>0</integer>
#      For every 15 min: add <integer>15</integer> and <integer>45</integer>
#   3. launchctl load ~/Library/LaunchAgents/com.user.breakreminder.plist
#
# NOTE: Automatically starts on login. No need to re-run after restart!
# ============================================================================

SCRIPT_PATH="$HOME/code/dotfiles/break-reminder.sh"
PLIST_PATH="$HOME/Library/LaunchAgents/com.user.breakreminder.plist"

install_launchagent() {
    mkdir -p "$HOME/Library/LaunchAgents"
    
    cat > "$PLIST_PATH" << EOF
<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
<plist version="1.0">
<dict>
    <key>Label</key>
    <string>com.user.breakreminder</string>
    <key>ProgramArguments</key>
    <array>
        <string>/bin/bash</string>
        <string>$SCRIPT_PATH</string>
    </array>
    <key>StartCalendarInterval</key>
    <array>
        <dict>
            <key>Minute</key>
            <integer>0</integer>
        </dict>
        <dict>
            <key>Minute</key>
            <integer>30</integer>
        </dict>
    </array>
    <key>StandardErrorPath</key>
    <string>/tmp/breakreminder.err</string>
    <key>StandardOutPath</key>
    <string>/tmp/breakreminder.out</string>
</dict>
</plist>
EOF

    echo "✅ Created plist at: $PLIST_PATH"
    launchctl load "$PLIST_PATH"
    echo "✅ Loaded launch agent - reminders will run at :00 and :30 every hour"
}

uninstall_launchagent() {
    launchctl unload "$PLIST_PATH" 2>/dev/null
    rm -f "$PLIST_PATH"
    echo "✅ Uninstalled break reminder"
}

# Handle arguments
case "$1" in
    install)
        install_launchagent
        exit 0
        ;;
    uninstall)
        uninstall_launchagent
        exit 0
        ;;
esac

# Play a gentle alert sound
afplay /System/Library/Sounds/Glass.aiff &

# Display a prominent dialog overlay
osascript <<'EOF'
tell application "System Events"
    activate
    display dialog "🧘 TIME TO MOVE! 🧘

━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

Stand up for 2-3 minutes and do:

✅ 10 slow glute squeezes
✅ 10 ankle pumps (each foot)

━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

Your body will thank you! 💪
Reduces stiffness • Helps hips & feet" buttons {"I'm Moving! ✓"} default button 1 with title "Break Time - Every 30 Min" with icon note giving up after 300
end tell
EOF

