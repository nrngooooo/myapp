const { Client } = require("pg");
const express = require("express");

const app = express();
const port = 5000;

app.use(express.json());
const con = new Client({
  user: "postgres",
  host: "localhost",
  database: "lab9",
  password: "0113",
  port: 5432,
});

con.connect().then(() => console.log("Connected to PostgreSQL"));

// CRUD Routes

// 1. Get All Users
app.get("/", async (req, res) => {
  const selectQuery = "SELECT * FROM users";
  try {
    const result = await con.query(selectQuery);
    res.json(result.rows);
  } catch (err) {
    res.status(500).json({ error: err.message });
  }
});

// 2. Get User by ID
app.get("/:id", async (req, res) => {
  const selectQuery = "SELECT * FROM users WHERE id = $1";
  try {
    const result = await con.query(selectQuery, [req.params.id]);
    if (result.rows.length > 0) {
      res.status(200).json(result.rows[0]);
    } else {
      res.status(404).json({ message: "User not found" });
    }
  } catch (err) {
    res.status(500).json({ error: err.message });
  }
});

// 3. Create a New User
app.post("/create", async (req, res) => {
  const insertQuery = "INSERT INTO users (name, email) VALUES ($1, $2)";
  const { name, email } = req.body;
  try {
    const result = await con.query(insertQuery, [name, email]);
    res.send("User created successfully");
  } catch (err) {
    res.status(500).json({ error: err.message });
  }
});

// 4. Update a User
app.put("/update/:id", async (req, res) => {
  const { name, email } = req.body;
  const updateQuery = "UPDATE users SET name = $1, email = $2 WHERE id = $3";
  try {
    const result = await con.query(updateQuery, [name, email, req.params.id]);
    res.send("User updated successfully");
    // Check if the user was updated
    if (result.rows.length > 0) {
      res.json(result.rows[0]);
    } else {
      res.status(404).json({ message: "User not found" });
    }
  } catch (err) {
    res.status(500).json({ error: err.message });
  }
});

// 5. Delete a User
app.delete("/delete/:id", async (req, res) => {
  const deleteQuery = "DELETE FROM users WHERE id = $1";
  try {
    const result = await con.query(deleteQuery, [req.params.id]);
    if (result.rows.length > 0) {
      res.status(200).send("User deleted successfully");
    } else {
      res.status(404).json({ message: "User not found" });
    }
  } catch (err) {
    res.status(500).json({ error: err.message });
  }
});

// Start Server
app.listen(port, () => {
  console.log(`Server running on http://localhost:${port}`);
  console.log("Connected to PostgreSQL database");
});
