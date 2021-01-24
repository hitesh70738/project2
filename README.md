<h2>Project Brief</h2>
The brief set for this project is to create a service-orientated architecture for my application, with the tools, methodologies and technologies that cover all core modules covered during training. The application must be composed of at least four services that work together. 
<br>
<br>
<h3>Requirements</h3>

In order to achieve the brief, the following requirements must be achieved:

* Trello board
* Relational database - with one table.
* Clear documentation including design, architecture and risk assessment. 
* An application fully integrated using the feature branch model into a Version Control System (VCS). The VCS will be built through a CI server (Jenkins) and deployed to a cloud-based virtual machine. 
* When a change to the code is pushed to the VCS, webhooks must be set up for the CI server to recreate and redeploy the application. 
* The application must follow the service-orientated architecture which must be deployed using containerisation and an orchestration tool.
* Ansible playbook must be made that will provide the environment for the application to run.
* A reverse proxy must be set up to make the applciation accessible to the user.


<h3>My approach</h3>
To achieve these requirements, I decided to create an applciation called We Buy Any Carzz. This application will consit of 4 services which will communicate with each other and depending on the car make and car colour it will return the price of the car. The 4 service will operate in the following way:

* service #1: The front-end of the application. It will also be responsible for communicating with the other 3 services.
* service #2: Responsible for generating a random car make.
* service #3: Responsible for generating a random colour.
* service #4: will generate a price based upon service #2 and service #3.

<h2>Architecture</h2>
<h3>Database Structure</h3>

![ERD](https://imgur.com/gP3UYOd.jpeg)

The above image shows the the structure of my database. There is only one table because the only information that will be stored is the id, car_manufacture, car_colour, and price. Therefore, there are no other relationships in this application. 
When service 2, 3, and 4 generate some information, that information is stored in the database. The database is setup on a MYSQL server on Google cloud platform (GCP). Service 1 will then display the information generated, the purpose of the database is to allow the applciation to Create, Read and Update (CRU) when a new entry is generated.

<h2>App Services Overview</h2>

* Service 1 will be the front end and will display the information generated from service 2, 3, and 4 via the MYSQL database.

* Service 2 & 3 (backend) generates a car make (service 2) and a car colour (service 3) when a GET request is sent from service 1. 

* Service 4 (front-end) When service 2 and 3 are sent to  service 1 via a GET request, it will then be sent service 4 via a POST request. Here, service 4 will generate a price based upon service 2 & 3 and send this information back to service 1 (front-end).

The image below is a visual representation of how the services works. 

![Services](https://imgur.com/CCUo3gg.jpeg)

<h3>CI/CD pipeline</h3>

![CI/CD pipeline](https://imgur.com/9gcJGaQ.jpeg)
<br></br>












