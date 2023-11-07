var deleteCustomer = document.querySelectorAll('#delete_customer');
deleteCustomer.forEach(function(customer){
	var id = customer.getAttribute('data');
	customer.onclick = function() {
		if(confirm('Are you sure want to delete this customer?')) {
			window.location = 'delete_customer?id=' + id;
		}
	}
})