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

<h2>CI/CD pipeline</h2>

![CI/CD pipeline](https://imgur.com/LEgktG3.jpeg)
<br>
Jenkins is a CI/CD pipline tool. It triggers a build when, via a webhook, a new change has been pushed to the version control system. For this project I used github as my version control system, and was connected to jenkins via a webhook. The next stage is testing. Unit tests and mock tests are written up to test the every aspect of the application. If the testing section has returned back with no bugs, the next stage will kick off. The stage after testing is the building images and pushing it to docker hub (artefact repository). Jenkins will then initialise ansible, this will intiate the swarm manager and swarm worker and will also configure nginx. Ansible will also ensure that the worker node is connected to the manager node via a join token.  Once, the swarm is initialised, the code is pulled from jenkins and any images required will be pulled from the artefact repository. Once the swarm is created and stack deployed to nginx the application is live now for the user.

![stage-veiw](https://imgur.com/Yghmmj0.jpeg)

The above image is the build logs of the project-pipeline and shows the order of implementation for each stage. Build logs make it clear to see if a stage has passed or failed.. First, the environment variables need to be set as credentials on jenkins. Credentials such as the database uri and the author need to be set in jenkins, in order for it to know what to refference when these variables are called upon. Furthermore, the benefit of using environement variables on jenkins is that once they are set they won't need to be changed. Keeping creddentials private is very important and will be displayed in the risk assessment. For this project I used the following plugins, cobertura and junit. Cobertura allows to capture code coverage report. Jenkins will generate the trend report of coverage.  Junit provides a publisher that consumes test reports generated during the buiilds and provides visualization of th etest results. It also produces a web UI for tests reportss, tracking failure, and etc. 
<br>
<br>
First stage is testing, this is where pytests are conducted on the code. As mentioned above I used cobertura and junit to generate testing reports. The reports generated can be used to help debug and issues that occur. 
<br>
<br>
Second stage is is building the images and pushing it to the artefact repository, docker hub. In this stage, docker and docker compose are installed. Docker compose is then used to build the images and push them to docker hub. 
<br>
<br>
Third stage is jenkins runnning the ansible folder. This initialises ansible by setting uop the swarm, swarm manager and swarm worker nodes are set up and joined together via a join token. This stage also configures the nginx load balancer.
<br>
<br>
In the fourth stage the applcaition will be deployed as a stack across the swarm nodes, making it accessible by users via the nginx load balancer.
In more depth: For this project I have one manager node and one worker node. Ansible pulls down the necessary files to the swarm manager and then across to the worker node. I have also used 5 replicas of each service. Replcias define how many instances of the service template will run. This allows to introduce redundancy to the containerised application. Furthermore, this exits so that no-one container is overloaded and if the case occurs where a container goes down the whole applciation won't go down. 

<h2>Project Tracking</h2>

Trello, along with agile methodologies, was used to track the progression of the project and show my workflow, from start to finish. The link to the full trello board can be found [here](https://trello.com/b/FmZ729be/car-project).

![trello-board](https://imgur.com/dDSojpp.jpeg)

<h1>Risk Assessment</h2>

Below is the risk assessment for the project split into two sections, before and after. The before sections outlines the potential risks that I knew at the beginning of the project. The after sections outlines the potential risks that I knew by the end of the project. The risks in this project were dealt with and taken into consideration

<h2>Before</h2>

![risk-assessment1](https://imgur.com/MRLPFyO.jpeg)

<h2>After</h2>

![after-risk-assessment](https://imgur.com/jW0P92v.jpeg)

<h1>Testing</h1>




The junit report produced below  shows that all 21 tests passed in the latest build. Moreover, the report also shows where previous builds have failed, thus making it easier to find how many tests failed. 


![junit-report](https://imgur.com/PkGQ5XZ.jpeg)

The cobertura report provides a more greater insght into the test reports
















