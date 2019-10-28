import React from "react";
import logo from "./logo.svg";
import "./App.css";

import Box from "@material-ui/core/Box";
import Container from "@material-ui/core/Container";
import Content from "./container/Content";
import Dataviz from "./container/Dataviz";

import MapWorldWide from "./media/png/tourist_arrival_ph_map_worldwide_wide.png";
import BumpWorldWide from "./media/png/tourist_arrival_ph_bumpchart_worldwide_wide.png";
import MapRegionalTotal from "./media/png/tourist_arrival_ph_map_regional_wide_total.png";
import MapRegionalDomFor from "./media/png/tourist_arrival_ph_map_regional_wide_domfor.png";
import TrendRegional from "./media/png/tourist_arrival_ph_trend_regional_wide.png";
import { flexbox } from "@material-ui/system";

import { ReactComponent as MapWorldWideSVG } from "./media/svg/tourist_arrival_ph_map_worldwide_wide.svg";
import { ReactComponent as BumpWorldWideSVG } from "./media/svg/tourist_arrival_ph_bumpchart_worldwide_wide.svg";
import { ReactComponent as MapRegionalTotalSVG } from "./media/svg/tourist_arrival_ph_map_regional_wide_total.svg";
import { ReactComponent as MapRegionalDomesticForeignSVG } from "./media/svg/tourist_arrival_ph_map_regional_wide_domfor.svg";
import { ReactComponent as TrendRegionalSVG } from "./media/svg/tourist_arrival_ph_trend_regional_wide.svg";
import { ReactComponent as AreaChartWorldSVG } from "./media/svg/tourist_arrival_ph_areachart_world_yearly.svg";

function App() {
  return (
    <div>
      {/* Cover Image and Title */}
      <section>
        <Content>
          <center>
            <h1>
              Visualizing Philippine Tourism: Trends on Tourists and Travel
              Destinations
            </h1>
            <p>
              <strong>
                By Bart Sakwerda, Design and Development by Joseph Ricafort
              </strong>
            </p>
          </center>
        </Content>
      </section>
      <section>
        <Content>
          <h2>How Popular is The Philippines Among Tourists?</h2>
          <p>
            Is Philippines still a worthy travel destination? We visualized the
            current state of tourism in the Philippines using public available
            data from 2014 to 2018.
          </p>
          <p>
            We analyzed which countries often visit the Philippines. Asia
            supplies the highest proportion of visitors, led by South Korea and
            Japan which together with the USA accounted for almost half of the
            total in 2008. The importance of Philippine passport holders
            permanently residing abroad, excluding overseas workers, should not
            be overlooked (DOT, 2009a).
          </p>
          <p>
            There were around 5.5M tourists visiting the Philippines annually
            since 2014. Using the data from Department of Tourism, we were able
            to identify and visualize origin of tourist. We also learned which
            countries where most tourists were coming from.
          </p>
        </Content>
      </section>
      <section>
        <Content>
          <h2>Country of Origin of Tourists to the Philippines 2016</h2>
        </Content>
        <div class="Dataviz-wide">
          <MapWorldWideSVG></MapWorldWideSVG>
        </div>
        <div className="Content-container">
          <div className="Dataviz-tiny">
            <AreaChartWorldSVG></AreaChartWorldSVG>
          </div>
          <p>
            Almost 50% of the tourists to the Philippines, come from neighboring
            Asian coutries. Tourists from Africa are almost non-existent. Almost
            50% of the tourists to the Philippines, come from neighboring Asian
            coutries. Tourists from Africa are almost non-existent. Almost 50%
            of the tourists to the Philippines, come from neighboring Asian
            coutries. Tourists from Africa are almost non-existent. Asian
            coutries. Tourists from Africa are almost non-existent.
          </p>
        </div>
      </section>

      <section>
        <Content>
          <h2>
            Timeline of Country of Origin of Tourists to the Philippines from
            January 2014 to December 2016
          </h2>
        </Content>
        <div class="Dataviz-medium">
          <BumpWorldWideSVG></BumpWorldWideSVG>
        </div>
      </section>

      <section>
        <Content>
          <h2>
            Comparison of the Volume between Domestic and Foreign Tourists in
            2018
          </h2>
        </Content>
        <div className="Container">
          <div className="MapRegional">
            <MapRegionalTotalSVG></MapRegionalTotalSVG>
          </div>
          <div className="MapRegional">
            <MapRegionalDomesticForeignSVG></MapRegionalDomesticForeignSVG>
          </div>
        </div>
        <Content>
          <h2>
            Top 15 Most Popular Tourist Destinations to the Philippines (Foreign
            and Domestic Tourists)
          </h2>
        </Content>
        <div className="Dataviz-small">
          <TrendRegionalSVG></TrendRegionalSVG>
        </div>
      </section>

      <section>
        <Content>
          <h2>Data Sources</h2>
          <ul>
            <li>Source 1</li>
            <li>Source 2</li>
            <li>Source 3</li>
          </ul>
        </Content>
      </section>
    </div>
  );
}

export default App;
