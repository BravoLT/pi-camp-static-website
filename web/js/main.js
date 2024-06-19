import {ready} from "./common.js";

let isLayoutLeft = true;

function updateViewButtonClick() {
  console.log('updateViewButtonClick');

  let dir1;
  let dir2;
  if (isLayoutLeft) {
    dir1 = 'dir-left';
    dir2 = 'dir-right';
  } else {
    dir1 = 'dir-right';
    dir2 = 'dir-left';
  }
  isLayoutLeft = !isLayoutLeft;

  const dir1Elements = document.getElementsByClassName(dir1);
  const dir2Elements = document.getElementsByClassName(dir2);

  for (const i of dir1Elements) {
    i.classList.remove(dir1);
    i.classList.add(dir2);
  }
  for (const i of dir2Elements) {
    i.classList.remove(dir2);
    i.classList.add(dir1);
  }
}

function updateBackgroundColor(color) {
  const headerElement = document.getElementById('header');
  headerElement.style.backgroundColor = color;

  const footerElement = document.getElementById('footer');
  footerElement.style.backgroundColor = color;
}

ready(function () {
  const updateViewButton = document.getElementById('update-view-button');
  if (updateViewButton) {
    updateViewButton.addEventListener('click', updateViewButtonClick);
    updateViewButton.click();
  }

  const camperSurveyForm = document.getElementById('camper-survey');
  if (camperSurveyForm) {
    camperSurveyForm.addEventListener('submit', (event) => {
      event.preventDefault();

      console.log('camper-survey Form Submitted');

      const data = new FormData(camperSurveyForm);

      // create pop-up message
      let output = "✨  Thank you for taking our survey!  ✨\n\n";
      let sports = [];
      for (const [key, val] of data) {

        let label;
        switch (key) {
          case 'fav-color':
            label = '🌈  Favorite Color';
            updateBackgroundColor(val);
            break;
          case 'fav-supe':
            label = '🚀  Favorite Super Hero';
            break;
          case 'fav-sport':
            sports.push(val);
            continue;
          default:
            label = key;
        }
        output += `    ${label} = ${val}\n`
      }
      if (sports.length > 0) {
        output += `    ⚾️  Favorite Sport(s) = ${sports}\n`
      }

      output += "\nThose are my favorite too.  😁"
      alert(output);
    });
  }
});