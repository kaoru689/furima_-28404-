
document.addEventListener('DOMContentLoaded', function(e) {
  const price = document.getElementById('item-price');
  price.addEventListener('keyup', function() {
    let input_price = price.value;
    let fee = input_price / 10;  fee = Math.round(fee);
    let tax_price = document.getElementById('add-tax-price');
    let profit = document.getElementById('profit');
    tax_price.textContent = fee + "円";
    let total = input_price - fee ;
    profit.textContent = total + "円";
  });
});
