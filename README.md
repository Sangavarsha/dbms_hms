Hospital Management System 
This website efficiently handles bookings paitent details,doctors information .<br>
I have created webpages using  flask,Jinja technique  and bootstap.<br>
SQL Alchemy ORM is used to connect python with  sql  databases, where tables are defined as classes in python.<br>
All CRUD operations are implemented and tigger database also created  for to store every action  and time of action (ex: upadate, delete, insert in database).<br>
Email Athuentication also deployed in this project .<br>


4 data bases are created <br>
The first one is 'user' for login and signup (generall user information)<br>
The second one is 'paitent' if at all any paitent done booking , an email confrimation is send to paitent mail , it will upadte in booking details.<br>
 changes like 'edit' or 'delete'  is also given .<br>
The third one is 'doctor' , to store the information of speciality of doctor ,intern that will refelct while choosing type of doctor in bookings<br>
The fourth one is 'triggr' it is mainly used to check actions of paitents , if paitent books triggr database store its action as insertion , else if paitent updates triggr <br>store the action as update , same goes for delete .<br>
this type of databases used for backup purpose and to store action sof paitents.<br>


STEPS TO RUN THIS PROJECT:
1>In Config.json file give your mail id and mail password in order to send "booking confrimed" to concern  paitent email.<br>
2>The projects runs  on   local host :http://127.0.0.1:5000/

