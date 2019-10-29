import React from "react";
import logo from "./logo.svg";
import "./App.css";

import Box from "@material-ui/core/Box";
import Container from "@material-ui/core/Container";
import Content from "./container/Content";
import Dataviz from "./container/Dataviz";
import Source from "./component/Source";

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

import Sources from "./data/Sources.json";

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
          <h2>Country of Origin of Tourists</h2>
          <h3>World Map of Volume of Tourists' Country of Origin (2016)</h3>
        </Content>
        <div class="Dataviz-wide">
          <MapWorldWideSVG></MapWorldWideSVG>
        </div>
        <div className="Content-container">
          <div className="Dataviz-tiny figure">
            <AreaChartWorldSVG></AreaChartWorldSVG>
            <p>Trend of tourists per region 2014 - 2016</p>
          </div>
          <div>
            <p>
              Almost 50% of the tourists to the Philippines, come from
              neighboring Asian coutries. Tourists from Africa are almost
              non-existent. Philippines being an archipelago are mainly reached
              via air traffic. International ferry and cruise ship arrival
              numbers are presently insignificant compared to over 40 million
              international arrivals. As self-reported by the airline passengers
              on the immigrations slips (country of origin, purpose of the
              visit) are the most reliable data regarding inbound tourism.
            </p>
            <p>
              Based on 2016 data, following points are evident:
              <ul>
                <li>Chinese traffic overtook Japan</li>
                <li> Notable traffic from Taiwan</li>
                <li> Australia comparable with UK</li>
              </ul>
            </p>
          </div>
        </div>
        <div className="Content-container">
          <h3>
            Timeline of Country of Origin of Tourists to the Philippines from
            January 2014 to December 2016
          </h3>
        </div>
        <div class="Dataviz-medium">
          <BumpWorldWideSVG></BumpWorldWideSVG>
        </div>
        <div className="Content-container">
          <div>
            <p>
              Top 10 tourists’ countries of origin as of 2018:
              <ol>
                <li>Korea</li>
                <li>USA</li>
                <li>China</li>
                <li>Japan</li>
                <li>Canada</li>
                <li>Australia</li>
                <li>United Kingdom</li>
                <li>Taiwan</li>
                <li>Singapore</li>
                <li>Malaysia</li>
              </ol>
            </p>
          </div>
          <div>
            <p>
              <ul>
                <li>
                  *UK seems to have the most number of tourists coming from
                  Europe.
                </li>
                <li>
                  July 2017 month in which there has been a dramatic rise in the
                  volume from China. Top 5: South Korea, USA, China, Japan and
                  Australia (countries with large population, developed
                  economies)
                </li>
                <li>
                  Trailing behind are Canada, UK, Most of the significant number
                  of foreign tourists to the Philippines were from East Asia
                  (China, Korea, Taiwan, Japan) and USA. (preBrexit 2019-10).
                </li>
                <li>Very little traffic from Africa and South America</li>
              </ul>
            </p>
          </div>
        </div>
      </section>

      <section>
        <Content>
          <h2>Travel Destinations</h2>
          <h3>
            Comparison of the Volume between Domestic and Foreign Tourists in
            2018
          </h3>
        </Content>
        <div className="Container">
          <div className="MapRegional">
            <MapRegionalTotalSVG></MapRegionalTotalSVG>
          </div>
          <div className="MapRegional">
            <MapRegionalDomesticForeignSVG></MapRegionalDomesticForeignSVG>
          </div>
        </div>
        <div className="Content-container">
          <div>
            <p>
              Map of the most popular destinations with the volumes of traffic
              to the Philippines. Through a scatter map, we pinpoint locations
              that relatively have a number of tourists both in domestic (local)
              and foreign origins. The larger circles represent higher volumes.
            </p>
            <p>
              As you can see, the number of domestic tourists visually weighs
              more than the foreign tourists. There were also some noticeable
              differences between the tourists between where foreign and
              domestic tourists preferred tourist destinations.
            </p>
            <p>
              Davao City is the most visited destination for local tourists
              while Lapulapu City is the most popular among foreign tourists.
              Both destinations are not popular.
            </p>
          </div>
        </div>
        <Content>
          <h3>
            Top 15 Most Popular Tourist Destinations to the Philippines (Foreign
            and Domestic Tourists)
          </h3>
        </Content>
        <div className="Dataviz-small">
          <TrendRegionalSVG></TrendRegionalSVG>
          <p>
            Metro Manila Ranks 9th in most visited destinations, despite being
            capital city and biggest international flight recipient in the
            country.
          </p>
          <p>
            Based on personal experience and qualitative reviews of _________
          </p>
          <p>
            We have concluded that it might be used as a transit hub where
            international tourists enter country and proceed for more remote and
            inaccessible locations via international flights.
          </p>
        </div>
      </section>

      <section></section>

      <section>
        <Content>
          <h2>Data Sources</h2>
          <ul>
            {Sources.map(src => (
              <li>
                <Source data={src} />
              </li>
            ))}
          </ul>
        </Content>
      </section>
    </div>
  );
}

export default App;
