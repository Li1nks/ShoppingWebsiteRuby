# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version : 3.3.5

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

# Project Title

A brief description of your project.

## Prerequisites

Before you can run the application, you will need to install the following software:

1. **Ruby**: Ensure you have Ruby installed. You can download Ruby from [https://www.ruby-lang.org/en/documentation/](https://www.ruby-lang.org/en/documentation/).
2. **Rails**: You can install Rails using the command:
3. **Database**: You will need to have a database management system installed. 
This project uses **SQLite3** (which comes by default with Rails) or you can use other databases like PostgreSQL or MySQL depending on your setup.

4. **Git**: If you haven't already, install Git from [https://git-scm.com/downloads](https://git-scm.com/downloads).

## Setting Up the Project

1. **Clone the Repository**

First, clone the repository to your local machine by running the following command in your terminal or command prompt:

git clone https://github.com/Li1nks/ShoppingWebsiteRuby

2. **Navigate to the Project Folder**

Go into the project directory:
cd ShoppingWebsite
3. **Install Dependencies**

Install the necessary gems by running:
bundle install
This command will install all the required Ruby gems (including Rails).

4. **Set Up the Database**

You may need to create and migrate the database. Run the following commands to set up the database:

rails db:create
rails db:migrate

This will create the database and apply any necessary schema changes.

5. **Run the Application**

You can now start the Rails development server with:

rails server or rails s in your project console

This will start the Rails server on `http://localhost:3000` by default. You can open this URL in your web browser to view the application.

## Customizing the Application

You can customize the application by editing the files in the `app/` directory, including the controllers, views, and models.

If you are using a different database (e.g., PostgreSQL or MySQL), you may need to update your `config/database.yml` file with the appropriate settings for your environment.

