import React from "react";

const Source = ({ data }) => {
  const { source, link } = data;

  return (
    <div>
      <li>
        {source},<br />
        {link.map((el, i) => {
          let lnk = i !== 0 ? `${el}; ` : el;
          return (
            <>
              <a href={el}>{lnk}</a>
              <br />
            </>
          );
        })}
      </li>
    </div>
  );
};

export default Source;
