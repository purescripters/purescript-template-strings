
var templatePattern = /\$\{([^}]+)\}/g;

exports._templateBy = function (keyFrom, str, obj) {
  return str.replace(templatePattern, function (match, ident) {
     var key = keyFrom(ident);
     return Object.hasOwnProperty.call(obj, key) ? obj[key] : match;
  });
};

