function setupPriceCalc() {
  const priceInput = document.getElementById("item-price");
  if (priceInput){
  priceInput.addEventListener("input", () => {
    const inputValue = priceInput.value;
    const addTaxDom = document.getElementById("add-tax-price");
    if (addTaxDom){
    addTaxDom.innerHTML = Math.floor(inputValue * 0.1);}
    const addSalesProfit =  document.getElementById("profit");
    if (addSalesProfit){
    addSalesProfit.innerHTML = Math.floor(inputValue - (inputValue * 0.1));}
  });
}
}
document.addEventListener('turbo:load', setupPriceCalc)
document.addEventListener('turbo:render', setupPriceCalc)