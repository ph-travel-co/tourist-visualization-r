import React from "react";
import logo from "./logo.svg";
import "./App.css";

import Box from "@material-ui/core/Box";
import Cover from "./container/Cover";
import Content from "./container/Content";
import Dataviz from "./container/Dataviz";

import MapWorldWide from "./media/png/tourist_arrival_ph_map_worldwide_wide.png";
import BumpWorldWide from "./media/png/tourist_arrival_ph_bumpchart_worldwide_wide.png";
import MapRegional from "./media/png/tourist_arrival_ph_map_regional_wide.png";
import TrendRegional from "./media/png/tourist_arrival_ph_trend_regional_wide.png";

function App() {
  return (
    <Box>
      {/* Cover Image and Title */}
      <Content>
        <center>
          <h1>
            Visualizing Philippine Tourism: Trends on Tourists and Travel
            Destinations
          </h1>
        </center>
      </Content>
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
      </Content>
      <Content>
        <h2>Country of Origin of Tourists to the Philippines 2016</h2>
      </Content>
      <Dataviz>
        <img src={MapWorldWide} alt="MapWorldWide" class="Dataviz-wide"></img>
      </Dataviz>
      <Content>
        <h2>
          Timeline of Country of Origin of Tourists to the Philippines from
          January 2014 to December 2016
        </h2>
      </Content>
      <Dataviz>
        <img
          src={BumpWorldWide}
          alt="BumpWorldWide"
          class="Dataviz-medium"
        ></img>
      </Dataviz>
      <Content>
        <h2>
          Comparison of the Volume between Domestic and Foreign Tourists in 2018
        </h2>
      </Content>
      <Dataviz>
        <img src={MapRegional} alt="MapRegional" class="Dataviz-medium"></img>
      </Dataviz>
      <Content>
        <h2>
          Top 15 Most Popular Tourist Destinations to the Philippines (Foreign
          and Domestic Tourists)
        </h2>
      </Content>
      <Dataviz>
        <img
          src={TrendRegional}
          alt="TrendRegional"
          class="Dataviz-medium"
          style={{
            maxWidth: "960px"
          }}
        ></img>
      </Dataviz>
    </Box>
  );
}

export default App;
