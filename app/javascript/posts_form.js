const validateNote = () => {
  const noteField = document.getElementById("note");

  if (noteField) {
    const updateErrorAndCount = () => {
      const noteLength = noteField.value.length;

      let errorText = noteField.parentNode.querySelector(".postsNew__errorText");
      let countText = noteField.parentNode.querySelector(".postsNew__countText");

      if (!errorText) {
        errorText = document.createElement("span");
        errorText.classList.add("postsNew__errorText");
        noteField.parentNode.appendChild(errorText);
      }

      if (!countText) {
        countText = document.createElement("span");
        countText.classList.add("postsNew__countText");
        noteField.parentNode.appendChild(countText);
      }

      countText.textContent = `${noteLength}/100文字`;

      if (noteLength > 100) {
        errorText.textContent = "メモは100文字以内で入力してください";
        noteField.style.borderColor = "red";
      } else {
        errorText.textContent = "";
        noteField.style.borderColor = "";
      }
    };

    noteField.addEventListener("input", updateErrorAndCount);

    updateErrorAndCount();
  }
};

document.addEventListener("turbo:load", validateNote);
document.addEventListener("turbo:render", validateNote);
