import React from "react";
import logo from "./logo.svg";
import "./App.css";

import Box from "@material-ui/core/Box";
import Cover from "./container/Cover";
import Content from "./container/Content";
import Dataviz from "./container/Dataviz";

import MapWorldWide from "./media/png/tourist_arrival_ph_map_worldwide_wide.png";

function App() {
  return (
    <Box>
      {/* Cover Image and Title */}
      <Cover>
        <center>
          <h1>
            Visualizing Philippine Tourism: Trends on Tourists and Travel
            Destinations
          </h1>
        </center>
      </Cover>
      {/* Author */}
      {/* Content */}
      <Content>
        <h2>How Popular is The Philippines Among Tourists?</h2>
        <p>
          Is Philippines still a worthy travel destination? We visualized the
          current state of tourism in the Philippines using public available
          data from 2014 to 2018.
        </p>
        <p>
          We analyzed which countries often visit the Philippines. Asia supplies
          the highest proportion of visitors, led by South Korea and Japan which
          together with the USA accounted for almost half of the total in 2008.
          The importance of Philippine passport holders permanently residing
          abroad, excluding overseas workers, should not be overlooked (DOT,
          2009a).
        </p>
        <p>
          There were around 5.5M tourists visiting the Philippines annually
          since 2014. Using the data from Department of Tourism, we were able to
          identify and visualize origin of tourist. We also learned which
          countries where most tourists were coming from.
        </p>
        <h2>
          Map: Country of Origin of Tourists to the Philippines from January
          2014 to December 2016 [Map]
        </h2>
      </Content>
      {/* Dataviz */}
      <Dataviz>
        <img src={MapWorldWide} alt="MapWorldWide" class="responsive"></img>
      </Dataviz>
      {/* Content */}
      <Content></Content>
      {/* Dataviz */}
      <Dataviz></Dataviz>
      {/* Content */}
      {/* Data Sources */}
      <Content></Content>
    </Box>
  );
}

export default App;
