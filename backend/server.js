const express = require('express');
const cors = require('cors');

const app = express();
const port = 3000;

app.use(cors());

// Replace with your actual Short.io API details
const domainId = '1302637';  // Example domain ID
const apiKey = 'sk_jvceAgWruARdP4sV';  // Example API key

// Endpoint to fetch Short.io data
app.get('/fetchShortIoData', async (req, res) => {
  const url = `https://statistics.short.io/statistics/domain/1302637?period=last30&tz=UTC`;

  const headers = {
    'Authorization': 'sk_jvceAgWruARdP4sV',
    'Accept': '*/*',
  };

  try {
    // Send the GET request using fetch

    const response = await fetch(url, { method: 'GET', headers: headers });
    const data = await response.json();

    if (response.ok) {
      console.log(data);  // Log the data to the console
      res.json(data);     // Send the data back to the frontend
    } else {
      res.status(response.status).json({ error: 'Failed to fetch data from Short.io', details: data });
    }
  } catch (error) {
    res.status(500).json({ error: 'Internal Server Error', details: error.message });
  }
});

app.listen(port, () => {
  console.log(`Backend server running on http://localhost:${port}`);
});
