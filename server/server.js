const axios = require("axios");
const express = require("express");

const path = require("path");

const app = express();
const port = process.env.PORT || 8000;
const processArgs = process.argv.slice(2);

app.use(express.static(path.join(__dirname, "/../public")));

app.get('/:word', function (req, res) {
  axios.get(`http://localhost:8001/${req.params.word}`)
    .then(definitionData => {
      axios.get(`http://localhost:8002/${req.params.word}`)
        .then(activityData => {
          let html =
            `
        <!DOCTYPE html>
          <html>
            <head>
              <meta charset="UTF-8" />
              <meta name="viewport" content="width=device-width, initial-scale=1.0" />
              <meta http-equiv="X-UA-Compatible" content="ie=edge" />
              <link rel="stylesheet" type="text/css" href="http://localhost:8001/style.css">
              <link rel="stylesheet" type="text/css" href="http://localhost:8002/c3.min.css">
              <title>UrbanDiction</title>
            </head>
            <body>
              <div id="definitionApp">${definitionData.data}</div>
              <div id="activityApp">${activityData.data}</div>
              <script src="https://d3js.org/d3.v5.min.js"></script>
              <script src="http://localhost:8002/c3.min.js"></script>
              <script src="http://localhost:8001/bundle.js"></script>
              <script src="http://localhost:8002/bundle.js"></script>
              <script src="http://localhost:8002/generateChart.js"></script>
            </body>
          </html>
        `
          res.send(html)

        })
    })
})

app.listen(port, () => {
  if (processArgs.includes("development")) {
    // eslint-disable-next-line
    console.log("Listening on", port);
  }
});
