# Template for Wordpress
```
                                 @@@@@@@@@@                                   
                         @@@@@@@@@@@        @@@@@@@@@@@                         
                    @@@@@@                            @@@@@@               
                 @@@@        @@@@@@@@@@@@@@@@@@@@@@@       @@@@          
             @@@@@     @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@      @@@         
           @@@@     @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@     @@@        
         @@@     @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@    @@       
       @@@    @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@    @@    
     @@@@   @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@         @@@     
    @@@    @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@            @@ 
   @@@   @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@             @@
  @@@                    @@@@@                       @@@@@@@@@@             @@
 @@@                 @@@@@@@@@@@@@@             @@@@@@@@@@@@@@@@        @    @@ 
 @@@   @@            @@@@@@@@@@@@@@@             @@@@@@@@@@@@@@@       @@@   @@
 @@   @@@@            @@@@@@@@@@@@@@@            @@@@@@@@@@@@@@@@     @@@@    @@
@@@   @@@@@            @@@@@@@@@@@@@@@            @@@@@@@@@@@@@@@    @@@@@@   @@
@@@   @@@@@@            @@@@@@@@@@@@@@@@           @@@@@@@@@@@@@@   @@@@@@@   @@
@@@   @@@@@@@            @@@@@@@@@@@@@@@            @@@@@@@@@@@@   @@@@@@@@   @@
@@@   @@@@@@@@            @@@@@@@@@@@@               @@@@@@@@@@@  @@@@@@@@@   @@
 @@    @@@@@@@@            @@@@@@@@@@   @@            @@@@@@@@@  @@@@@@@@@    @@
 @@@   @@@@@@@@@            @@@@@@@@   @@@@            @@@@@@@   @@@@@@@@    @@ 
  @@@   @@@@@@@@@            @@@@@@   @@@@@@            @@@@@  @@@@@@@@@    @@  
   @@@    @@@@@@@@            @@@@   @@@@@@@@            @@@  @@@@@@@@@    @@
    @@@    @@@@@@@@            @@   @@@@@@@@@@            @   @@@@@@@@   @@@    
      @@@    @@@@@@@               @@@@@@@@@@@@              @@@@@@@    @@@     
       @@@     @@@@@@             @@@@@@@@@@@@@@            @@@@@@    @@@     
         @@@@    @@@@@           @@@@@@@@@@@@@@@@          @@@@@    @@@       
           @@@@     @@@        @@@@@@@@@@@@@@@@@@@        @@@     @@@           
              @@@@            @@@@@@@@@@@@@@@@@@@@@            @@@@             
                 @@@@@        @@@@@@@@@@@@@@@@@@@@@        @@@@@                
                     @@@@@@                           @@@@@@                    
                          @@@@@@@@@@@@@@@@@@@@@@@@@@@@
````

## Wordpress Docker Container
The following setup is preinstalled in the docker container.
- ubuntu 20.04
- appache2
- mariadb

### Start Wordpress server
```
./docker.sh
```

### Build a local docker image
```
docker build . -t wordpress
```

### Run the docker conntainer
```
docker-compose -f wordpress.yaml up
```

### Notes
The data directory will contain the wordpress installation. The html and db folder are mounted to the docker container and will contains all wordpress files and data. If no wordpress installation is found  then the start.sh script will download the latest wordpress distribution.

## Credentials
Wordpress | Value
---|---
Admin user | wpuser
Password | dbpassword
Email | email@localhost.com

Database | Value
---|---
DB Name | wordpress
Root user | root
Root password | password
WP user | wpuser
WP Password| dbpassword

## Optional database setup
*The `data/db/mysql` directory might already contain the database.sql file with these credentials. However, you might want to create custom wordpress database, user and grant permissions.*

```
mysql -u root -p
CREATE USER 'wpuser'@'localhost' IDENTIFIED BY 'dbpassword';
GRANT ALL PRIVILEGES ON *.* TO 'wpuser'@'localhost' WITH GRANT OPTION;
CREATE DATABASE wordpress;
```