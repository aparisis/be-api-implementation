# Programming Challenge: API Development #

## Objective ##

Implement the code that will generate the responses sent as reply to a set of HTTP requests. Communication will be based
on a RESTful API specification.

### Key features ###

- Organize your code being cautious of re-usability and readability principles.
- Consider changes in given code or database schema to promote scalability and improve performance.
- Build a meaningful for the client error handling mechanism.
- Test your code to avoid preliminary failures.
- Write indicative commit messages.

## Assignment ##

Following tasks refer to RESTful web-services of our API. Each task is associated with a request that client (e.g.
browser) sends to the web service on the server.  
You will be provided with the description of request, however, you should generate response's body (e.g data) send back
to client. Sample data structure of response will also be given.

- Data is sent and received in a JSON format.
- The sample request is formatted in cURL.

### Task 1 ###

Get the info of a specific ticket.  
The info should include the id of the ticket, its winning amount, the date of its creation and a json array containing the bets associated with it. Each bet info should include the bet id, the bet amount and the name of the bet type.

The sample request:  
`curl -X GET 'http://YOUR.SERVER.HERE/ticket/10' -H 'Content-Type: application/json'`

Sample response data:

```json
{
  "ticket": {
    "id": 10,
    "winning_amount": 10000,
    "created_at": "2020-10-14 10:31:13",
    "bets": [
      {
        "id": 19,
        "amount": 2000,
        "type": "straight" 
      },
      {
        "id": 21,
        "amount": 1500,
        "type": "black" 
      }
    ]
  }
}
```

### Task 2 ###

Create a new ticket. You should provide an array of bets with each bet containing its amount and its type.  
The server will respond with the newly created ticket info.

The sample request:  
`curl -X POST 'http://YOUR.SERVER.HERE/ticket' -H 'Content-Type: application/json' -d '{"bets": [{"amount": 1.5,"type": "straight"}, {"amount": 2,"type": "split"}]}'`

Sample response data:

```json
{
  "ticket": {
    "id": 17,
    "winning_amount": 0,
    "created_at": "2020-10-14 10:31:13",
    "bets": [
      {
        "id": 29,
        "amount": 1.5,
        "type": "straight" 
      },
      {
        "id": 30,
        "amount": 2,
        "type": "split" 
      }
    ]
  }
}
```

### Task 3 ###

Update the user username or password.  
The server will respond with the updated user info.

The sample request:  
`curl -X PATCH 'http://YOUR.SERVER.HERE/user/10' -H 'Content-Type: application/json' -d '{"user": {"username":"testuser", "password":"xGfdsek20g"}}'`

Sample response data:

```json
{
  "user": {
    "id": 10,
    "username": "testuser",
    "created_at": "2020-10-14 10:31:13"
  }
}
```

### Task 4 ###

Get the list of the top N (N = 3) users that have won the largest winning amount in total from the game.  
The list should include the username of users, userId and the total winning amount for each one, sorted in descending
order by total winning amount.  
If more than one user has the same total winning amount, they should be ordered alphabetically based on their username.

The sample request:  
`curl -X GET 'http://YOUR.SERVER.HERE/top' -H 'Content-Type: application/json'`

Sample response data:

```json
{
  "top":[
    {
      "id":2,
      "total_winning_amount": 305000,
      "username": "luckyhope"
    }, {
      "id":1,
      "total_winning_amount": 72500,
      "username": "kenoman"
    }, {
      "id":5,
      "total_winning_amount": 50000,
      "username": "zafko"
    }
  ]
}
```

## Guidelines ##

The above mentioned services have to be written in PHP ^7.2, and it is advisable to use the Symfony framework, but you can use none if it is your choice.  

### Technical Requirements ###

1. Install PHP 7.2.5 or higher and these PHP extensions (which are installed and enabled by default in most PHP 7 installations): Ctype, iconv, JSON, PCRE, Session, SimpleXML, and Tokenizer.
2. Install Composer, which is used to install PHP packages.
3. Set up a web development environment with Apache2, MySQL server and PHP.
    - It is recommended to use a suite like WAMP for Windows or XAMPP as Linux alternative.
        > If you decide a different deployment setup (e.g. container/vm), please put the setup guidelines in the README of your repository.

### Installation instructions ###

- Clone the current repository and re-initialize it as your own. Make the first commit without applying any changes to the code and then start your implementation.

  ```bash
  git init . 
  git add .
  git commit -m "{your initial commit message}"
  ```

- Install dependencies of project with Composer.

  ```bash
  composer install
  ```

- Make PHPUnit classes available in the project.

  ```bash
  ./bin/phpunit
  ```

- Add a new virtual host in the main Apache configuration file.

  ```conf
  <VirtualHost *:80>
    ServerName {SERVER_NAME}
    DocumentRoot "{APACHE_WEB_ROOT_DIR}/be-api-implementation/public/"
    
    RewriteEngine On
    
    RewriteRule ^(.+)/$ $1 [L,R]
    
    RewriteCond %{DOCUMENT_ROOT}%{SCRIPT_FILENAME} !-f
    RewriteCond %{DOCUMENT_ROOT}%{SCRIPT_FILENAME} !-d
    RewriteRule . /index.php [L]
    
    <Directory  "{APACHE_WEB_ROOT_DIR}/be-api-implementation/public/">
        Options +Indexes +Includes +FollowSymLinks +MultiViews
        AllowOverride All
        Require local
    </Directory>
  </VirtualHost>
  ```

  **Note:**

  1. Replace {SERVER_NAME} placeholder with your server's domain name (e.g localhost or a name of your choice).
  2. Replace {APACHE_WEB_ROOT_DIR} with the Apache document root directory.

### Quick start with Symfony framework ###

- [creating-routes-as-attributes-or-annotations](https://symfony.com/doc/current/routing.html#creating-routes-as-attributes-or-annotations)
- [route-parameters](https://symfony.com/doc/current/routing.html#route-parameters)
- [accessing-request-data](https://symfony.com/doc/current/components/http_foundation.html#accessing-request-data)
- [creating-a-json-response](https://symfony.com/doc/current/components/http_foundation.html#creating-a-json-response)
- [unit-testing](https://symfony.com/index.php/doc/current/testing.html)

## Contact ##

For general questions, send an email at aparisis@jokersattractions.com

## Submission ##

Feel free to place this test on your Github/Gitlab/Bitbucket/... account as a public repository and send us the link.

We are looking forward to hearing from you. Good luck!
