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

      let output = "✨  Thank you for taking our survey!  ✨\n\n";
      for (const [key, val] of data) {

        let label;
        switch (key) {
          case 'fav-color':
            label = '🌈  Favorite Color';
            break;
          case 'fav-supe':
            label = '🚀  Favorite Super Hero';
            break;
          case 'fav-sport':
            label = '⚾️  Favorite Sport(s)';
            break;
          default:
            label = key;
        }
        output += `    ${label} = ${val}\n`
      }
      output += "\nThose are my favorite too.  😁\n"
      alert(output);
    });
  }
});