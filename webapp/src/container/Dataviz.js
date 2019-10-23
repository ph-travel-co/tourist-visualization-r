import React from "react";

import Box from "@material-ui/core/Box";
import styles from "./Dataviz.module.css";

const Dataviz = props => {
  return (
    <Box component="div" class={styles.responsive}>
      <img source={props.source} alt={props.alt}></img>
      {props.children}
    </Box>
  );
};

export default Dataviz;
