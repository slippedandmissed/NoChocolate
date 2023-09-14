window.videoUrl = "";
window.transcript = [];

async function generateCaptions(lang = "en") {

  window.videoUrl = $("#youtube-link").val() || "https://www.youtube.com/watch?v=B3xZC3jn1_4";
  const data = await (await fetch(`/proxy?url=${encodeURIComponent(window.videoUrl)}`)).text();

  if (!data.includes("captionTracks")) {
    return void alert("Could not find captions for video");
  }

  const regex = /({"captionTracks":.*isTranslatable":(true|false)}])/;
  const [match] = regex.exec(data);
  const { captionTracks } = JSON.parse(`${match}}`);

  const langRegex = RegExp(`^a?\\.${lang}$`);
  const subtitle = captionTracks.filter((x) => {
    return x.vssId && langRegex.test(x.vssId)
  })[0];

  if (!(subtitle?.baseUrl)) {
    return void alert(`No captions in language: "${lang}"`);
  }

  const transcript = await (await fetch(`/proxy?url=${encodeURIComponent(subtitle.baseUrl)}`)).text();

  const parser = new DOMParser();
  const xmlDoc = parser.parseFromString(transcript, "text/xml");

  window.transcript = [];
  let allText = "";
  for (const node of xmlDoc.getElementsByTagName("text")) {
    const txt = document.createElement("textarea");
    txt.innerHTML = node.textContent;
    window.transcript.push({
      start: +node.getAttribute("start"),
      dur: +node.getAttribute("dur"),
      text: txt.value,
    });
    allText += `${txt.value} `;
  }

  const allWords = allText.toLowerCase().match(/\b(\w+'?\w*)\b/g);
  const occuranceCount = {};
  for (const word of allWords) {
    occuranceCount[word] = (occuranceCount[word] ?? 0) + 1;
  }
  const termFrequency = {};
  for (const word in occuranceCount) {
    termFrequency[word] = Math.log(occuranceCount[word] + 1);
  }

  const documentFrequency = await (await fetch("/resources/idf.json")).json()
  const idf = {};

  for (const word in termFrequency) {
    idf[word] = Math.log((documentFrequency.num_docs + 1) / ((documentFrequency.document_frequency[word] ?? 0) + 1))
  }

  const wordData = [];
  for (const word in termFrequency) {
    wordData.push({ word, occurances: occuranceCount[word], tfIdf: termFrequency[word] * idf[word] });
  }

  wordData.sort((a, b) => b.tfIdf - a.tfIdf);

  $(".word:not(#word-template)").remove();
  $(".player-total").text("0");
  let i = 0;
  for (const word of wordData) {
    if (i++ > 100) {
      break;
    }
    addWord(word);
  }
}

function makeDroppable(elt) {
  elt.droppable({
    drop: function (ev, ui) {
      const dropped = ui.draggable;
      const droppedOn = $(this);
      const value = +$(dropped).find(".occurances").text();
      const oldPlayerTotal = $(dropped).closest(".player").find(".player-total");
      oldPlayerTotal.text(+oldPlayerTotal.text() - value);
      $(dropped).detach().css({ top: 0, left: 0, }).appendTo(droppedOn);
      const playerTotal = $(droppedOn).closest(".player").find(".player-total");
      playerTotal.text(+playerTotal.text() + value);

      droppedOn.find(".word").sort((a, b) => (+$(b).data("tf-idf")) - +($(a).data("tf-idf"))).appendTo(droppedOn);
    }
  });
}

function addPlayer() {
  const player = $("#player-template").clone();
  player.removeAttr("id");
  makeDroppable(player.find(".player-bin"));
  player.insertBefore($("#player-template"));
}


function addWord({ word: text, occurances, tfIdf }) {
  const word = $("#word-template").clone();
  word.removeAttr("id");
  word.draggable({ cursor: "pointer", helper: "clone", appendTo: "body" });
  word.find(".text").text(text);
  word.find(".occurances").text(occurances);
  word.data("tf-idf", tfIdf);
  word.insertBefore($("#word-template"));
}

function startGame() {
  const players = $.map($(".player:not(#player-template)"), (playerElt) => {
    const name = $(playerElt).find("input[type=\"text\"]").val();
    const words = $.map($(playerElt).find(".word"), (wordElt) => {
      return {
        word: $(wordElt).find(".text").text(),
        occurances: +$(wordElt).find(".occurances").text(),
        tfIdf: +$(wordElt).data("tf-idf"),
      }
    });
    return {
      name, words
    };
  });
  const gameData = {
    videoUrl: window.videoUrl,
    transcript: window.transcript,
    players
  }

  console.log(gameData);

  fetch("/start-game", {
    method: "post",
    headers: {"Content-Type": "application/json"},
    body: JSON.stringify(gameData),
  });
}

addPlayer();
makeDroppable($("#words"));
