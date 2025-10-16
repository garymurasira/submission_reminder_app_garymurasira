#!/bin/bash
# Script to update assignment info and trigger reminder

echo "Please enter the name you used when setting up your environment."

read -p "Enter your name: " name
submission_dir="submission_reminder_$name"

# Check if submission directory exists
if [[ ! -d "$submission_dir" ]]; then
    echo "Directory $submission_dir is missing, please first run the create_environment.sh script to setup its environment."
    exit 1
fi

echo "Directory $submission_dir found!!"
echo ""

# Ask for the new assignment name
read -p "Enter the assignment name: " new_assignment

# Update the ASSIGNMENT variable inside config file
sed -i "s/^ASSIGNMENT=.*/ASSIGNMENT=\"$new_assignment\"/" "$submission_dir/config/config.env"
echo ""

# Go into the submission directory and run the reminder script
echo "Running the reminder script with the updated assignment..."
./"$submission_dir"/startup.sh

