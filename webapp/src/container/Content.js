import React from "react";

import Container from "@material-ui/core/Container";

const Content = props => {
  return <Container maxWidth="md">{props.children}</Container>;
};

export default Content;
