# Zoo-DB-Project
This GitHub has been made for Group 11 of Professor Uma Ramamurthy's Databases Class. This Repository will hold all the files/code for our database and website!
Enjoy!

Link: https://zoo-db-project.onrender.com



------------------------------------------
EDITS:

Team, edit this as you see fit. Some terms like Employee vs. Staff may be changed in the tables, and we may want to reflect that here. 



# Zoo Database - COSC 3380 Spring 2024


## Description
These are Group 11's DBMS project files. 

This Database Management Software (DBMS) is configured to simulate general information stored in a Zoo as practice for real world applications. 


## Features
-Ability for Employees (Staff), Administrators, and Visitors (Customers) to log into separate webpages.
    -Administrators are able to update information in tables
    -Visitors are not
    -Regular Employees are not

-Can query for information stored in the project
    Ex: -Animal types (Giraffe, Dolphin, etc.) and thier stats
        -Employee information like names, addresses, salaries, etc. 
        -Number of visitors and purchases made in the gift store.

-DBMS can make joins between tables to search for custom information from within the website Administration Portal

-Contains multiple "triggers" for different events to automate updates to DBMS tuples (table information)
    - Trigger 1: Trigger to update animal_status and set patient_checkup in the vet table whenever a new health record is inserted, the trigger will update the animal_health       and animal_status fields in the animal table, with animal_status defaulting to 0 if it's a new entry indicating that the animal needs to have its first checkup.              Additionally, it will set patient_checkup to 0 in the vet table for the corresponding vet.
    - Trigger 2: This trigger will prevent the deletion of animals from the animal table if they have associated medical records in the medical table. To make sure that an         animal's medical records have not accidentally been cleared/deleted from the database if they are still part of the zoo and in the case that an animal leaves the UH          Zoo, those medical records will still;l be available in the system in case another Zoo may need them later.



## Technologies Used

- HTML: Used for creating the structure and content of web pages.
- JavaScript: Used for client-side scripting and dynamic interactions on the web pages.
- NodeJS: Used for server-side scripting and back-end functionality.
- PHP: Used for server-side scripting and back-end functionality.
- CSS: Used for styling and layout of the web pages.
- MySQL: Used as the relational database management system for storing and managing data.

    
 Installation
1. Download a Code editor of your choice (Ex: VSCode)
2. Copy the URL for this project from GitHub (or copy here: https://github.com/akren20/Zoo-DB-Project.git)
3. In VSCode (or your editor of choice), click clone repository and paste the link of the github repository.
4. Under extensions, download and install "Live Preview", then...
5. Navigate to the file named "index.html" (within the Website-Files folder), right-click it, and select "Show Preview"
        - The Live Preview Extension will render the webpage to the right hand side of the code. 

## Usage
1. Run `npm run dev` to start the application.

## Contributing
Contributions are NOT welcome from outsiders. Go away! For team members, please follow these guidelines:
- Fork the repository.
- Create a new branch for your feature (`git checkout -b feature-name` *WARNING - YOUR TERMINAL COMMANDS MAY BE DIFFERENT!*).
- Commit your changes (`git commit -am 'Add new feature'`).
- Push to the branch (`git push origin feature-name`).
- Wait for the moderator to accept your "push" with a "pull".
-Although code contributions to the project are great, documenting a summary of the work done, and the sources of information that helped you, onto the Discord channel goes a long way towards helping your teammates!



## Contact
If you have any questions or suggestions, please contact me at [email@example.com](mailto:email@example.com).



#Group 11 Contributors:
- Arianne
- Jamaima
- Tie
- Michael
