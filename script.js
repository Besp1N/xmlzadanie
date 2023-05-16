let table1 = document.getElementById("table1");
let table2 = document.getElementById("table2");
let table3 = document.getElementById("table3");
let showPlnBtn = document.getElementById("show-pln");
let showEurBtn = document.getElementById("show-eur");
let showPeopleBtn = document.getElementById("show-people");

showPlnBtn.onclick = function () {
  table1.style.display = "block";
  table2.style.display = "none";
  table3.style.display = "none";
};
showEurBtn.onclick = function () {
  table1.style.display = "none";
  table2.style.display = "block";
  table3.style.display = "none";
};
showPeopleBtn.onclick = function () {
  table1.style.display = "none";
  table2.style.display = "none";
  table3.style.display = "block";
};
