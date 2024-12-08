document.addEventListener("turbo:load", () => {
  const noteField = document.getElementById("note");

  if (noteField) {
    noteField.addEventListener("input", () => {
      const noteLength = noteField.value.length;
      let errorText = noteField.parentNode.querySelector(".postsNew__errorText");

      if (!errorText) {
        errorText = document.createElement("span");
        errorText.classList.add("postsNew__errorText");
        noteField.parentNode.appendChild(errorText);
      }

      if (noteLength > 100) {
        errorText.textContent = `メモは100文字以内で入力してください (${noteLength}/100文字)`;
        noteField.style.borderColor = "red";
      } else {
        errorText.textContent = "";
        noteField.style.borderColor = "";
      }
    });
  }
});
