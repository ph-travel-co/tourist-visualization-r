import React from "react";

import Box from "@material-ui/core/Box";
import styles from "./Dataviz.module.css";

const Dataviz = props => {
  return (
    <Box component="div" style={{ fontFamily: "Arial" }}>
      {props.children}
    </Box>
  );
};

export default Dataviz;
