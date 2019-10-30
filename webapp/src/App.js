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
import Cover from "./media/png/cover-03.png";

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
      <img src={Cover} className="cover"></img>
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
          <h3>Seeing the Philippine Tourism Industry Using Data</h3>
          <p>
            There were around 5.5M tourists visiting the Philippines annually
            since 2014. Using the data from Department of Tourism, we were able
            to identify and visualize origin of tourist. We also learned which
            countries where most tourists were coming from.
          </p>
          <p>
            Would the Philippines still be a worthy travel destination or a
            worthy to invest into? We visualized the current state of tourism in
            the Philippines using public available data from 2014 to 2018.
          </p>
          <h3>What To Expect?</h3>
          <p>
            If you have some plans visiting the Philippines as a tourists, you
            would be able to learn more about destinations you might have not
            known yet or hesitant to travel into.
          </p>
          <p>
            If you plan to invest into the tourism market in the Philippines,
            you might be able to discover opportunities of the market in terms
            of tourist origins and potential travel destinations not everyone
            knows about.
          </p>
          <p>
            There could be other discoveries you could uncover using the data
            visualizations we've designed and developed for you to explore
            further.
          </p>
        </Content>
      </section>
      <section>
        <Content>
          <h2>Which Countries Were The Tourists From?</h2>
          <h3>World Map of Volume of Tourists' Country of Origin (2016)</h3>
        </Content>
        <div class="Dataviz-wide">
          <MapWorldWideSVG></MapWorldWideSVG>
        </div>
        <Content>
          <div className="Content-container">
            <div className="Dataviz-tiny figure">
              <AreaChartWorldSVG></AreaChartWorldSVG>
              <p>Trend of tourists per region 2014 - 2016</p>
            </div>
            <div>
              <p>
                Almost 50% of the tourists to the Philippines, come from
                neighboring Asian coutries. Tourists from Africa are almost
                non-existent.
              </p>
              <p>
                Philippines being an archipelago are mainly reached via air
                traffic. International ferry and cruise ship arrival numbers are
                presently insignificant compared to over 40 million
                international arrivals.
              </p>
              <p>
                As self-reported by the airline passengers on the immigrations
                slips (country of origin, purpose of the visit) are the most
                reliable data regarding inbound tourism.
              </p>
            </div>
          </div>
        </Content>
        <Content>
          <div>
            <h3>
              Timeline of Country of Origin of Tourists to the Philippines from
              January 2014 to December 2016
            </h3>
            <p>
              We tried to visualize the flow of tourists' and their country of
              origin. Using a bumpchart, we could see how the countries rank in
              terms of the volume of tourists coming from every country.
            </p>
          </div>
        </Content>
        <div class="Dataviz-medium">
          <BumpWorldWideSVG></BumpWorldWideSVG>
        </div>
        <Content>
          <div className="Content-container">
            <div className="half-column">
              <p>
                Top 10 tourists’ countries of origin as of December 2018:
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
            <div className="half-column">
              <p>Below are some of the notable observations on the data:</p>
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
            </div>
          </div>
        </Content>
      </section>

      <section>
        <Content>
          <h2>Which Are The Most Popular Travel Destinations?</h2>
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
        <Content>
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
              The Mindanao region has by far the biggest disparity in popularity
              between foreign and local tourists. It is not as popular with the
              foreign tourists as compared to the domestic tourists. Davao City
              is the most visited destination for local tourists while Lapulapu
              City is the most popular among foreign tourists.
            </p>
          </div>
        </Content>
        <Content>
          <h3>
            Top 15 Most Popular Tourist Destinations in the Philippines (Foreign
            and Domestic Tourists)
          </h3>
          <p>
            We compared foreign and domestic tourist arrivals in travel
            destinations in the Philippines and visualized the trend. Then, we
            ranked accordingly in every group, by domestic, by foreign or by
            overall total. The rating was based on the accumulated number of
            tourists since 2014 up to 2018. See the disparity between the volume
            of tourists between tourist origins and their respective volume.
          </p>
        </Content>
        <Content>
          <TrendRegionalSVG></TrendRegionalSVG>
          <p>
            Most of the destinations have an upward trend both for international
            arrivals and domestic tourists except for Metro Manila, Boracay and
            others.
          </p>
          <p>
            Metro Manila ranks 9th among the most visited destinations despite
            being capital city and biggest international flight recipient in the
            country. It might only have served as a transit hub where
            international tourists enter the country and proceed for more remote
            and inaccessible locations via international flights.
          </p>
          <p>
            The significant drop in tourists in Boracay, might have been caused
            by the 6 months rehabilitation closure. This shows that the decrease
            in tourist arrivals was self-imposed.
          </p>
          <p>
            Cebu City is at the top spot as a tourist destination but it started
            to decrease in tourist arrivals as well, both in domestic and
            foreign origins.
          </p>
          <p>
            Despite the decrease in tourist arrivals of the previously mentioned
            travel destinations, most cities still enjoy the upward trend of
            tourist arrivals. These cities are Davao City, Baguio City, Naga
            City and Iloilo City.
          </p>
        </Content>
      </section>

      <section>
        <Content>
          <h2>What We've Learned So Far</h2>
          To summarize, here are the highlight insights and discoveries we have
          learned so far:
          <ul>
            <li>
              Overseas visitors account for almost half of the international
              passenger traffic.
            </li>
            <li>
              Manila's tourists have been continuously decreasing. Although, it
              still serves as an important transit hub in the Philippines.
            </li>
            <li>
              Regional airports facilitate growth of international and domestic
              tourist traffic.
            </li>
            <li>
              The 2017 conflict in Marawi seems to not have any major effect on
              tourism.
            </li>
            <li>
              From 2014 to 2018 period, there have been no major natural
              disasters
            </li>
            <li>
              There had been no occurrence of rendering airports or destinations
              unusable, as in the case of November 2013 Super Typhoon Yolanda.
            </li>
          </ul>
        </Content>
      </section>

      <section>
        <Content>
          <h2>Data Sources</h2>
          <div>
            <ul>
              {Sources.map(src => (
                <li>
                  <Source data={src} />
                </li>
              ))}
            </ul>
          </div>
        </Content>
      </section>
    </div>
  );
}

export default App;
