
// module Data.TemplateString.Unsafe

exports._template = function(str, obj) {
  return Object.keys(obj).reduce(function(newStr, key) {
    return newStr.replace(new RegExp('\\${'+ key +'}', 'g'), obj[key]);
  }, str);
}
