			
					BRIEF OVERVIEW
It is a basic shell-based program that can be used to monitor the submission of student assignments. 
It reads off a list of students and warns those who have not turned in a given assignment. 
The app is designed in directories and scripts which automate setup, configuration updates and 
reminder generation.


					HOW TO RUN THE SCRIPTS
A.create_environment.sh
	step 1: run this command './create_environment.sh' or 'bash create_environment.sh' this will launch the script
	step 2: you'll be prompted to enter your name. Type it and press enter.
		A directory will be created in this format 'submission_reminder_(yourName)'
		Inside the directory, you'll find all mandatory subdirectories and files are present.
	step 3: Enter the new directory created by "cd submission_reminder_(yourName)"
	step 4: run this command "./startup.sh"
		This will launch the reminder.sh script which shows students who haven't yet submitted their assignments.

B.copilot_shell_script.sh
	step 1: run this command './copilot_shell_script.sh" or 'bash copilot_shell_script.sh' this will launch the script
	step 2: You'll be prompted again to enter your name and make sure to use the name you entered while running the create_environment script
	step 3: if the directory(submission_reminder_(yourName)) exists, you'll be prompted to enter which specific assignment 
			the students' haven't submitted yet
	step 4: Type and Enter the new assignment name
