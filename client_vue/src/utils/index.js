export const getRatingColor = function (rate) {
  const lowerInt = Math.floor(rate);
  if (rate > 4.5) {
    return "green-5";
  }
  if (lowerInt === 1) {
    return "red-10";
  }
  if (lowerInt === 2) {
    return "red-6";
  }
  if (lowerInt === 3) {
    return "lime-14";
  }
  if (lowerInt === 4) {
    return "light-green-14";
  }
};
