import React from "react";

import Box from "@material-ui/core/Box";
import "./Dataviz.css";

const Dataviz = props => {
  return (
    <Box component="div" class="responsive">
      {props.children}
    </Box>
  );
};

export default Dataviz;
