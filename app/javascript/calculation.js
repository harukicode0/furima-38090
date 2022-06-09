function calculate (){
  const amount = document.getElementById("item-price");
  amount.addEventListener("input",() =>{
    let amount_number = Number(amount.value) 
    let fee = Math.floor(amount_number * 0.1)
    const fee_box = document.getElementById("add-tax-price")
    let profit = amount_number - fee
    const profit_box = document.getElementById("profit")
    fee_box.innerHTML = `${fee}`
    profit_box.innerHTML = `${profit}`
  });
 };
 
 window.addEventListener('load', calculate);