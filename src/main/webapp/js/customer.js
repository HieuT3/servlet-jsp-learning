var deleteCustomer = document.querySelectorAll('#delete_customer');
deleteCustomer.forEach(function(customer){
	var id = customer.getAttribute('data');
	customer.onclick = function() {
		if(confirm('Are you sure want to delete this customer?')) {
			window.location = 'delete_customer?id=' + id;
		}
	}
});

window.addEventListener('DOMContentLoaded', function(){
	var alertContentSuccess = document.querySelector('.alert-content-success').textContent;
	if(alertContentSuccess !== '') {
		document.querySelector('.alert-success').style.display = 'block';
	}
});

var updateProfileForm = document.querySelector('.update-profile-form');
if(updateProfileForm != null) {
	updateProfileForm.addEventListener('submit', function(event){
		event.preventDefault();
		var newPass = document.getElementById('newPass').value;
		var newPassConfirm = document.getElementById('newPassConfirm').value;
		
		if(newPass !== '' && newPassConfirm !== '' && newPass !== newPassConfirm) {
			setTimeout(function(){
				document.querySelector('.alert-success').style.display = 'none';
				document.querySelector('.alert-failed').style.display = 'block';
			}, 1000);
		} else {
			event.target.submit();
		}
	});
}