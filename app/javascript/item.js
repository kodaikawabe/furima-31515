function item (){
  const itemPrice  = document.getElementById("item-price");
  itemPrice.addEventListener("keyup", () => {
    const countVal = itemPrice.value;
    const charNum = document.getElementById("add-tax-price");
    const charNum2 = document.getElementById("profit");
    charNum.innerHTML = Math.ceil(countVal * 0.1);
    charNum2.innerHTML = Math.ceil(countVal * 0.9);
  });
}

window.addEventListener('load', item);