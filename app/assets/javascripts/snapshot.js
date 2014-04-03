function errorCallback(e) {
  if (e.code == 1) {
    alert('User denied access to their camera');
  } else {
    alert('getUserMedia() not supported in your browser.');
  }
}

(function() {
var video = document.querySelector('#screenshot-stream');
var button = document.querySelector('#screenshot-button');
var canvas = document.querySelector('#screenshot-canvas');
var img = document.querySelector('#screenshot');
var imageInput = $('#info_image');
var ctx = canvas.getContext('2d');
var localMediaStream = null;

function sizeCanvas() {
  // video.onloadedmetadata not firing in Chrome so we have to hack.
  setTimeout(function() {
    canvas.width = video.videoWidth;
    canvas.height = video.videoHeight;
    img.height = video.videoHeight;
    img.width = video.videoWidth;
  }, 100);
}

function snapshot() {
  ctx.drawImage(video, 0, 0);
  var base64Image = canvas.toDataURL('image/webp');
  img.src = base64Image;
  imageInput.val(base64Image);
}

button.addEventListener('click', function(e) {
  if (localMediaStream) {
    snapshot();
    return;
  }

  if (navigator.getUserMedia) {
    navigator.getUserMedia('video', function(stream) {
      video.src = stream;
      localMediaStream = stream;
      sizeCanvas();
      button.textContent = 'Take Shot';
    }, errorCallback);
  } else if (navigator.webkitGetUserMedia) {
    navigator.webkitGetUserMedia({video: true}, function(stream) {
      video.src = window.URL.createObjectURL(stream);
      localMediaStream = stream;
      sizeCanvas();
      button.textContent = 'Take Shot';
    }, errorCallback);
  } else {
    errorCallback({target: video});
  }
}, false);

video.addEventListener('click', snapshot, false);

document.querySelector('#screenshot-stop-button').addEventListener('click', function(e) {
  video.pause();
  localMediaStream.stop(); // Doesn't do anything in Chrome.
}, false);
})();

(function() {
var video = document.querySelector('#cssfilters-stream');
var button = document.querySelector('#capture-button2');
var localMediaStream = null;

var idx = 0;
var filters = [
  'grayscale',
  'sepia',
  'blur',
  'brightness',
  'contrast',
  'hue-rotate', 'hue-rotate2', 'hue-rotate3',
  'saturate',
  'invert',
  ''
];

function changeFilter(e) {
  var el = e.target;
  el.className = '';
  var effect = filters[idx++ % filters.length];
  if (effect) {
    el.classList.add(effect);
  }
}

button.addEventListener('click', function(e) {
  if (navigator.getUserMedia) {
    navigator.getUserMedia('video, audio', function(stream) {
      video.src = stream;
      localMediaStream = stream;
    }, errorCallback);
  } else if (navigator.webkitGetUserMedia) {
    navigator.webkitGetUserMedia({video: true}, function(stream) {
      video.src = window.URL.createObjectURL(stream);
      localMediaStream = stream;
    }, errorCallback);
  } else {
    errorCallback({target: video});
  }
}, false);

document.querySelector('#stop-button2').addEventListener('click', function(e) {
  video.pause();
  localMediaStream.stop(); // Doesn't do anything in Chrome.
}, false);

video.addEventListener('click', changeFilter, false);
})();
