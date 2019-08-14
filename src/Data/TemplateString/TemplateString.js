
exports._buildExclamationKeyObject = function (tuples) {
  var valueMap = {};
  tuples.forEach(function (tuple) {
    valueMap['!' + tuple.value0] = tuple.value1;
  });
  return valueMap;
};

var templatePattern = /\$\{([^}]+)\}/g;

exports._getTemplateVars = function (str) {
  return (str.match(templatePattern) || []).map(function (str) {
    return str.substring(2, str.length - 1);
  });
};
