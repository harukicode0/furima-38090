const pay = () => {
  Payjp.setPublicKey("pk_test_02173a5cc36a18cafaaa5f85");
  const submit = document.getElementById("button");
  submit.addEventListener("click", (e) => {
    e.preventDefault();
    
    const formResult = document.getElementById("charge-form");
    const formData = new FormData(formResult);
    
    const card = {
      number: formData.get("match[number]"),
      cvc: formData.get("match[cvc]"),
      exp_month: formData.get("match[exp_month]"),
      exp_year: `20${formData.get("match[exp_year]")}`,
    };
  
    Payjp.createToken(card, (status, response) => {
      if (status == 200) {
        const token = response.id;
        console.log(token)
      }
    });
  });
};

window.addEventListener("load", pay);