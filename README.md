# Rocket_Elevators_Information_System

# Description
Rocket Elevators Website using the Ruby on rails framework. This website is connected to mysql database, user login and quote form connected. 
The administrator of the page have access to a back office page that displays the employees section and quote form input results.

Using HTML / CSS / BOOTSTRAP / JAVASCRIPT / RUBY ON RAILS FRAMEWORK

Ruby's version : 2.7.6
Rails version : 5.2.7.1

To ensure that everything is in order, you need to download ruby and rails version above, and also mysql and postreSQL. You can also download DBeaver community to have a good look on databases.

# Command to use

First, we use a lot of gem pluggins, so you need to type `bundle install` to download packages. It might not work because of previous tries, so you can try `bundle update`. 

Launch the server with : `rails s`or `rails server`.
After that go on `http://localhost:3000/`to see the result.

To check our databases and tables on the terminal you can go on the sql console with : `mysql -u root`.
To display databases type `SHOW DATABASES;`, and `USE <database_name>;` and now you just need to display the table you want with : `DESCRIBE <table_name>`.

Here is an example :
![alt text](https://github.com/mlouellette/Rocket_Elevators_Information_System/blob/main/image.png?raw=true)

# FreshDesk API

FreshDesk is a SaaS platform to which you can subscribe and which allows you to manage the workflow that takes place when a customer comes into contact via the Website either via the “Contact Us” form or also via the “Get a Quote” form. ”In both cases, a ticket must be created in FreshDesk in the same way as a recording is added in the information system.

- Enter your credentials in the "Contact us" form at the bottom of the main landing page or in the "Quote" page.
- Once its done press the submit button.
- Go to the admin freshdesk page. ( https://rocketelevatorscanada.freshdesk.com/a/admin )
- Once inside the freshdesk interface, click the ticket button at the left side of the page. 
- You should've receive a new ticket with the type of credentials you entered, either in the "Contact us" or "Quote" page.

# Sendgrid API

Use case to implement the Sendgrid API is sending a thank you email automatically when a contact completes the "Contact Us" form on the Rocket Elevators website. The form is saved with the email field to use. When saving to the database, a transactional thank-you email must be sent with the text below:

- Enter your credentials inside the "Contact us" form at the bottom of the main landing page.
- Press the submit button and the button should turn green meaning the infos are sent to the database.
- Open your mail service to see your "Thank you" email.

# GraphQL API

The definition of the GraphQL API is setup using the Ruby on rails GEM : https://graphql-ruby.org/

GraphQL queries applied to the API are returning results for the following questions :

1. Retrieving the address of the building, the beginning and the end of the intervention for a specific intervention.

``` 
 {

    intervention(id: 5){
     startIntervention
     endIntervention
     status
       address {
         city
         country
         numberAndStreet
       }
    }
 }
 ```

2. Retrieving customer information and the list of interventions that took place for a specific building

```
{  
 building(id: 10){
     id
     customer{
       id
       CompanyName
       CompanyDescription
       FullNameCompanyContact
       FullNameServiceTechnicalAuth  
     }
   interventions{
       id
       startIntervention
       endIntervention
      	status
       result
     }
   }
 }
```

3. Retrieval of all interventions carried out by a specified employee with the buildings associated with these interventions including the details (Table BuildingDetails) associated with these buildings.

```
 {  
	employee(id: 6){
    firstName
    lastName
    interventions{
      id
      status
      result
      building{
        id
      }
      buildingDetails{
        informationKey
        value
      }
    }
  }
}
```

## Usage

- Make sure your local sql and psql databases are seeded

```ubuntu
$ cd Rocket_Elevators_API/
$ bundle install
$ rake db:drop db:create db:migrate db:seed
$ rake pg:db:drop pg:db:create pg:db:migrate pg:db:fact_interventions
$ rails server
```

- Open your browser and enter the following link : http://localhost:3000/graphiql
- Copy one of the querie code blocks in this readme file and paste with the id number of your choice in the graphql interface
- Press the play button to see the result


# Video's Link

Yanni's video : https://www.youtube.com/watch?v=ncBOzzTVfIo

Michael's video : https://www.youtube.com/watch?v=cUv8bDaL488
