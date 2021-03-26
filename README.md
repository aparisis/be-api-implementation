# Programming Challenge: API Development #

---

## Objective ##

Implement the code that will generate the responses sent as reply to a set of HTTP requests. Communication will be based
on a RESTful API specification.

### Key features: ###

- Organize your code being caution about re-usability and readability principles.
- Consider changes in given code or database schema to promote scalability and improve performance.
- Build a meaningful for the client error handling mechanism.
- Test your code to avoid preliminary failures.
- Write indicative commit messages.

## Assignment ##

Following tasks refer to RESTful web-services of our API. Each task is associated with a request that client (e.g.
browser) sends to the web service on the server.  
You will be provided with the description of request, however, you should generate response's body (e.g data) send back
to client. Sample data structure of response will also be given.

* Data is sent and received in a JSON format.
* The sample request is formatted in cURL.

### Task 1: ###

Get the list of top N (<=3) users that have won the largest winning amount in total from the game.  
The list should include the username of users, userId and the total winning amount for each one, sorted in descending
order by total winning amount.  
If more than one user has the same total winning amount, they should be ordered alphabetically based on their username.

The sample request:  
`curl -X GET 'http://YOUR.SERVER.HERE/top/{num_of_top_users}' -H 'Content-Type: application/x-www-form-urlencoded'`

Sample response data:
`{"data":{"top":[{
"id":10,
"total_winning_amount": 250,
"username": "zafko"}, {
"id":7,
"total_winning_amount": 120,
"username": "npmint"}, ...]}}`

## Guidelines ##

## Contact ##

For general questions, send an email at vaggalanis@jokersattractions.com

For more immediate feedback, contact us at Skype profile `live:vaggalanis`

## Submission ##

Feel free to place this test on your Github/Gitlab/Bitbucket/... account as a public repository and send us the link.

We are looking forward to hearing from you. Good luck!
