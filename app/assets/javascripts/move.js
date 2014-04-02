var currentPos = 0;
var birds = document.getElementById("smileybirds");
var bodWidth = screen.availWidth;
var birdPos = -215;

function move() {
  if (currentPos < (bodWidth + 500)) {

    currentPos = parseInt(birds.style.right ?
      birds.style.right : birdPos) + 5;

    birds.style.right = currentPos + "px";

    setTimeout("move()", 20);
  }
}

move();
