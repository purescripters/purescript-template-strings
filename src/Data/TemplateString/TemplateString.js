
export function _buildExclamationKeyObject(tuples) {
  const valueMap = {};
  tuples.forEach(function (tuple) {
    valueMap['!' + tuple.value0] = tuple.value1;
  });
  return valueMap;
};

const templatePattern = /\$\{([^}]+)\}/g;

export function _getTemplateVars(str) {
  return (str.match(templatePattern) || []).map(function (str) {
    return str.substring(2, str.length - 1);
  });
};
