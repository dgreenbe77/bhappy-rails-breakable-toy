<script type="text/javascript">
var currentPos = 0;
var smiley = document.getElementById("smiley");
var menuObj = document.getElementById("menu");
var bodWidth = screen.availWidth;
var carWidth = -220;
var menuHeight=200;

function menuSlide() {

currentPos = parseInt(menuObj.style.height ?
menuObj.style.height : 0) + 1;
if (currentPos < menuHeight) {
menuObj.style.height = currentPos + "px";
setTimeout("menuSlide()", 20);

}

}


function move() {
if (currentPos < (bodWidth + carWidth)) {

currentPos = parseInt(smiley.style.right ?
smiley.style.right : carWidth) + 5;

smiley.style.right = currentPos + "px";

setTimeout("move()", 20);
}
else {
menuObj.style.visibility = "visible";
menuSlide();
}

}

move();


</script>
