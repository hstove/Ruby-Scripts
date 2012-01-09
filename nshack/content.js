
  console.log('started');
  var url = document.location;
  var patt = /http:\/\/(www.)?newschoolers\.com\/watch\/([0-9]*)/;
  var id = url.match(patt);
  console.log('ran');
  console.log(id[2]);
