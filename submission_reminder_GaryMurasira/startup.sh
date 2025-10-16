#!/bin/bash

# Start the submission reminder app
echo "Launching the Submission Reminder script..."

# Move into the app's parent directory
cd "$(dirname "$0")"

# Run the reminder script
./app/reminder.sh

