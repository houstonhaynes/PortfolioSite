---
title: "contact"
author: "Houston Haynes"
date: "October 7, 2019"
output: html_document
---

<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <meta http-equiv="X-UA-Compatible" content="ie=edge">
  <title>Send us an email</title>
  <style>
    body {
      padding-top:40px;
    }
  </style>
</head>

<body>
  <div class="container">
    <h2>Send us an email</h2>
    <hr>
    <div id="output"></div>
    <form id="submitMessage">
      <div class="form-group">
        <input type="text" id="name" class="form-control" placeholder="Your name">
      </div>
      <div class="form-group">
        <input type="email" id="email" class="form-control" placeholder="Your email">
      </div>
      <div class="form-group">
        <textarea id="message" class="form-control" placeholder="Type your message..."></textarea>
      </div>
      <input type="submit" class="btn btn-secondary" value="Submit">
    </form>
  </div>

  <script>
    document.getElementById('submitMessage').addEventListener('submit', submitMessage);
    function processResponse(response) {
      if (response.status === 200) {
        output =
          `
        <div class="alert alert-success" role="alert">
          Thanks, ${document.getElementById('name').value}! We'll be in touch soon!
        </div>        
        `;
        document.getElementById('output').innerHTML = output;
      } else {
        output =
          `
        <div class="alert alert-danger" role="alert">
          Oh no! Something went wrong :(
        </div>        
        `;
        document.getElementById('output').innerHTML = output;
      }
    }
    function submitMessage(e) {
      e.preventDefault();
      let name = document.getElementById('name').value;
      let email = document.getElementById('email').value;
      let message = document.getElementById('message').value;
      fetch('https://h3portfolio.azurewebsites.net/api/contact?code=2QMArxtbP3h9ofc7fqQFZANRisSRSq7jjIWCU7gFfOY0Nuheaf4J2Q==', {
          method: 'POST',
          headers: {
            'Accept': 'application/json, text/plain, */*',
            'Content-type': 'application/json'
          },
          body: JSON.stringify({
            name: name,
            email: email,
            message: message
          })
        })
        .then((res) => processResponse(res))
    }
  </script>
</body>