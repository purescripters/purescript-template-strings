
exports._buildExclamationKeyObject = function (tuples) {
  var valueMap = {};
  tuples.forEach(function (tuple) {
    valueMap['!' + tuple.value0] = tuple.value1;
  });
  return valueMap;
};

