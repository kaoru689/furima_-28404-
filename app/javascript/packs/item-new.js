
document.addEventListener('DOMContentLoaded', function(e) {
  const price = document.getElementById('item-price');
  price.addEventListener('keyup', function() {
    var input_price = price.value;
    var fee = input_price / 10;  fee = Math.round(fee);
    var tax_price = document.getElementById('add-tax-price');
    var profit = document.getElementById('profit');
    tax_price.textContent = fee + "円";
    var total = input_price - fee ;
    profit.textContent = total + "円";
  });
});
