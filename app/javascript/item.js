function item (){
  const itemPrice  = document.getElementById("item-price");
  itemPrice.addEventListener("input", () => {
    const countVal = itemPrice.value;
    const charNum = document.getElementById("add-tax-price");
    const charNum2 = document.getElementById("profit");
    charNum.innerHTML = Math.floor(countVal * 0.1);
    charNum2.innerHTML = Math.floor(countVal * 0.9);
  });
}

window.addEventListener('load', item);