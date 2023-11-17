$(document).ready(function(){
	$('.delete-btn').on('click' ,function(event){
		var id = $(this).data('item');
		$.ajax({
			type: 'GET',
			async: false,
			url: 'delete_item',
			data: {
				"id": id
			},
			success: function() {
		        location.reload();
			},
			error: function() {
				console.log(error);
			}
		});
	});
	
	$('.update-btn').on('click', function(){
		var ids = document.querySelectorAll('.qty-item');
		var bookIds = [];
		ids.forEach(function(id){
			bookIds.push(id.value);
		});
		var str = bookIds.join(',');
		
		$.ajax({
			type: 'POST',
			async: false,
			url: 'update_cart',
			data: {
				'bookIds': str
			},
			success: function() {
				location.reload();
			}, 
			error: function() {
				
			}
		});
	});
});


function checkLoginStatus() {
	fetch('check_login_status')
    .then(response => response.text())
    .then(data => {
        if(data == 'null') {
			document.querySelector('.alert-login').style.display = 'flex';
			document.querySelector('.form-checkout').setAttribute('style', 'opacity: 0.5; pointer-events: none');
		}
    })
    .catch(error => console.error('Error:', error));
}

var url = window.location.pathname;
if(url.includes('checkout')) {
	checkLoginStatus();
}