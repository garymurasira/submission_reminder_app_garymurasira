#!/bin/bash

					#CREATION OF MAIN DIRECTORY AND SUBDIRECTORIES
#======================================================================================================================

# Prompt user to enter his/her name.
read -p "Enter the your name: " name

if [[ -z "$name" ]]; then
  echo "Please enter your name!!"
  exit 1
fi


# Defining a directory using the students' name"
submission_dir="submission_reminder_"$name""

if [[ -d "$submission_dir" ]]; then
  echo "Directory '$submission_dir' already exists. Options: choose a different name or delete the existing one."
  exit 1
fi


# Creation of the students' directory and appropriate subdirectories
echo "Creating the environment..."
sleep 0.5
mkdir -p "$submission_dir/app" "$submission_dir/modules" "$submission_dir/assets" "$submission_dir/config"
echo "Creation complete"
echo ""
					#CREATION OF FILES && POPULATING EACH FILES
#=======================================================================================================================

echo "Creating files and inserting their respective contents..."
sleep 0.5


# Creation of essential files in their respective directories
touch "$submission_dir/app/reminder.sh" #the reminder script

cat << DATA > "$submission_dir/app/reminder.sh"
#!/bin/bash

# Source environment variables and helper functions
source ./config/config.env
source ./modules/functions.sh

# Path to the submissions file
submissions_file="./assets/submissions.txt"

# Print remaining time and run the reminder function
echo "Assignment: \$ASSIGNMENT"
echo "Days remaining to submit: \$DAYS_REMAINING days"
echo "--------------------------------------------"

check_submissions \$submissions_file

DATA


touch "$submission_dir/modules/functions.sh" #the functions script


cat << 'DATA' > "$submission_dir/modules/functions.sh"
#!/bin/bash

# Function to read submissions file and output students who have not submitted
function check_submissions {
    local submissions_file=$1
    echo "Checking submissions in $submissions_file"

    # Skip the header and iterate through the lines
    while IFS=, read -r student assignment status; do
        # Remove leading and trailing whitespace
        student=$(echo "$student" | xargs)
        assignment=$(echo "$assignment" | xargs)
        status=$(echo "$status" | xargs)

        # Check if assignment matches and status is 'not submitted'
        if [[ "$assignment" == "$ASSIGNMENT" && "$status" == "not submitted" ]]; then
            echo "Reminder: $student has not submitted the $ASSIGNMENT assignment!"
        fi
    done < <(tail -n +2 "$submissions_file") # Skip the header
}

DATA


touch "$submission_dir/assets/submissions.txt" # the submission text file

cat << 'DATA' > "$submission_dir/assets/submissions.txt"
student, assignment, submission status
Chinemerem, Shell Navigation, not submitted
Chiagoziem, Git, submitted
Divine, Shell Navigation, not submitted
Anissa, Shell Basics, submitted
Moise, Shell Navigation, not submitted
Ange, Git, not submitted
Daniel, Shell Basics, not submitted
Aime, Shell Navigation, submitted
Sandrine, Git, not submitted
DATA


touch "$submission_dir/config/config.env" # the environment cofiguration file

cat << 'DATA' > "$submission_dir/config/config.env"
# This is the config file
ASSIGNMENT="Shell Navigation"
DAYS_REMAINING=2

DATA


touch "$submission_dir/startup.sh" # the start-up script to launch the app

cat << 'DATA' > "$submission_dir/startup.sh"
#!/bin/bash

# Start the submission reminder app
echo "Launching the Submission Reminder script..."

# Move into the app's parent directory
cd "$(dirname "$0")"

# Run the reminder script
./app/reminder.sh

DATA


					#GIVING EXECUTE PERMISSIONS TO ALL SCRIPTS
#===========================================================================================================================

# Giving all scripts the execute permission
find "$submission_dir" -type f -name "*.sh" -exec chmod u+x {} +

# success message
echo "All directories and files have been created successfully"
echo ""
echo "Your directory is named '$submission_dir'"

