
// module Data.TemplateString

exports._template = function(str, tuples) {
  return tuples.reduce(function(newStr, tuple) {
    return newStr.replace(new RegExp('\\${'+ tuple.value0 +'}', 'g'), tuple.value1);
  }, str);
}
