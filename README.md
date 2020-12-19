# wjobsid-app

# WJobsID RESTfull API

A simple REST API using node js with DBMS MySQL

## Built With

[![Express.js](https://img.shields.io/badge/Express.js-4.x-orange.svg?style=rounded-square)](https://expressjs.com/en/starter/installing.html)
[![Node.js](https://img.shields.io/badge/Node.js-v.12.13-green.svg?style=rounded-square)](https://nodejs.org/)

## Requirements

1. Node Js
2. Node_modules
3. Postman
4. Web Server
5. Visual Studio Code

## How to run the app ?

1. Open app's directory in CMD or Terminal
2. Type `npm install`
3. Make new file a called **.env**, set up first [here](#set-up-env-file)
4. Turn on Web Server and MySQL can using Third-party tool like xampp, etc.
5. Create a database with the name db_wjobsid, and Import file sql to **phpmyadmin**
6. Open Postman desktop application or Chrome web app extension that has installed before
7. Choose HTTP Method and enter request url (http://localhost:3000/)
8. You can see all the end point [here](#end-point)

## Set up .env file

Open .env file on code editor, and copy paste this code below :

```
DB_HOST     = localhost
DB_USER     = root
DB_PASSWORD =
DB_DATABASE = db_wjobsid

JWT_KEY = WJOBSID1242212
```

## Documentation Postman Link:

https://documenter.getpostman.com/view/4644051/TVeneoEQ

## End point

```
1. Account
    - Login Account [POST]
      http://localhost/3000/account/login

    - Registrasi Engineer / Company [POST]
      http://localhost/3000/account

    - Update Account [PUT]
      http://localhost/3000/account

2. Enginner
    - List Engineer [GET]
      http://localhost/3000/engineer

    - Detail Engineer [GET]
      http://localhost/3000/engineer/detail/{id}

    - Update Engineer [PUT]
      http://localhost/3000/engineer/{id}

3. Company
    - List Company [GET]
      http://localhost/3000/company

    - Detail Company [GET]
      http://localhost/3000/company/detail/{id}

    - Update Company [PUT]
      http://localhost/3000/company/{id}

4. Skill
    - Add Skill [POST]
      http://localhost/3000/skill

    - List Skill [GET]
      http://localhost/3000/skill

    - Detail Skill [GET]
      http://localhost/3000/skill/detail/{id}

    - Update Skill [PUT]
      http://localhost/3000/skill/{id}

    - Delete Skill [DELETE]
      http://localhost/3000/skill/{id}

5. Experience
    - Add Experience [POST]
      http://localhost/3000/experience

    - List Experience [GET]
      http://localhost/3000/experience

    - Detail Experience [GET]
      http://localhost/3000/experience/{id}

    - Update Experience [PUT]
      http://localhost/3000/experience/{id}

    - Delete Experience [DELETE]
      http://localhost/3000/experience/{id}

6. Portfolio
    - Add Portfolio [POST]
      http://localhost/3000/portfolio

    - List Portfolio [GET]
      http://localhost/3000/portfolio

    - Detail Portfolio [GET]
      http://localhost/3000/portfolio/{id}

    - Update Portfolio [PUT]
      http://localhost/3000/portfolio/{id}

    - Delete Portfolio [DELETE]
      http://localhost/3000/portfolio/{id}

7. Project
    - Add Project [POST]
      http://localhost/3000/project

    - List Project [GET]
      http://localhost/3000/project

    - Detail Project [GET]
      http://localhost/3000/project/{id}

    - Update Project [PUT]
      http://localhost/3000/project/{id}

    - Delete Project [DELETE]
      http://localhost/3000/project/{id}

8. Hire
    - Hiring Proccess [POST]
      http://localhost/3000/hire

    - List Hire From Engineer [GET]
      http://localhost/3000/hire/engineer/{id}

    - List Hire From Project [GET]
      http://localhost/3000/hire/project/{id}

    - Update Status Hire [PUT]
      http://localhost/3000/hire/{id}
```
