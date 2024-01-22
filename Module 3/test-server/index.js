const express = require('express');
const bodyParser = require('body-parser');
const session = require('express-session');

const app = express();
const port = 3000;

// Middleware
app.use(bodyParser.json());
app.use(bodyParser.urlencoded({ extended: true }));
app.use(session({ secret: 'secret-key', resave: false, saveUninitialized: true }));

// In-memory user data
const users = [];

// Routes
app.get('/', (req, res) => {
  res.send('Welcome to the authentication demo!');
});

app.post('/signup', (req, res) => {
  const { name, email, password, passwordConfirmation } = req.body;
  console.log("Signup attempt: ", req.body)
  
  // Check if the username is already taken
  if (users.some(user => user.email === email)) {
    console.log("current users", users)
    return res.send({errorMessage: 'Username already taken'});
  }

  // Store user in memory
  users.push({ name, email, password });
  console.log("current users", users)
  res.send({success: true});
});

app.post('/login', (req, res) => {
  console.log("login attempt", req.body)
  const { email, password } = req.body;

  // Check if the user exists
  const user = users.find(user => user.email === email);

  if (!user || user.password !== password) {
    return res.send({ errorMessage: 'Invalid username or password'});
  }

  // Set session
  req.session.user = user;
  res.send({user: {name: user.name, email: user.email}});
});

app.post('/logout', (req, res) => {
  // Destroy session
  req.session.destroy(() => {
    res.send('Logged out successfully');
  });
});

// Start server
app.listen(port, () => {
  console.log(`Server is running at http://localhost:${port}`);
});
