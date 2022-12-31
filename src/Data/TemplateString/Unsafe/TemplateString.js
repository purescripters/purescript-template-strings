
const templatePattern = /\$\{([^}]+)\}/g;

export const function _templateBy(keyFrom, str, obj) {
  return str.replace(templatePattern, function (match, ident) {
     const key = keyFrom(ident);
     return Object.hasOwnProperty.call(obj, key) ? obj[key] : match;
  });
};

