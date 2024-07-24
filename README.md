Hospital Management System 
This website efficiently handles bookings paitent details,doctors information 
I have created webpages using  flask,Jinja technique  and bootstap
SQL Alchemy ORM is used to connect python with  sql  databases, where tables are defined as classes in python
All CRUD operations are implemented and tigger database also created  for to store every action  and time of action (ex: upadate, delete, insert in database)
Email Athuentication also deployed in this project .

4 data bases are created 
The first one is 'user' for login and signup (generall user information)
The second one is 'paitent' if at all any paitent done booking , an email confrimation is send to paitent mail , it will upadte in booking details.
 changes like 'edit' or 'delete'  is also given .
The third one is 'doctor' , to store the information of speciality of doctor ,intern that will refelct while choosing type of doctor in bookings
The fourth one is 'triggr' it is mainly used to check actions of paitents , if paitent books triggr database store its action as insertion , else if paitent updates triggr store the 
action as update , same goes for delete .
this type of databases used for backup purpose and to store action sof paitents.




STEPS TO RUN THIS PROJECT:
1>In Config.json file give your mail id and mail password in order to send "booking confrimed" to concern  paitent email.
2>The projects on   local host :http://127.0.0.1:5000/

