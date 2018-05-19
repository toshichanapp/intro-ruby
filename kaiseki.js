// var list = Array();
// var row = document.querySelector('.container').children[0];
// var e = row.childNodes; //ul直下の子要素のみをeに格納
// var i = -1;
// var j = 0;
// while (++i < e.length) {
//     if(e[i].nodeType == 1) { //タグ要素のみ実行
//         if(e[i].nodeName.toLowerCase() == "li") { //liタグであれば実行
//             list[j] = e[i];
//             j++;
//         }
//     }
// }

let getSiblings = function (elem) {
  let siblings = [];
  let sibling = elem.parentNode.firstChild

  while(sibling){
      if (sibling.nodeType ==1 || sibling !== elem){
        sibling.push(sibling);
      }
      sibling = sibling.nextSibling;
  }
  return siblings;
}

let elem = document.querySelector('.container').children[1].childNodes[1];
let siblings = getSiblings(elem);

console.log(siblings)