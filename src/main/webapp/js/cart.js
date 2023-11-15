$(document).ready(function(){
	$('.add-btn').click(function(){
		var id = $(this).data('item');
		$.ajax({
			type: 'GET',
			async: false,
			url: 'add_to_cart',
			data: {
				'bookId': id
			},
			success: function(data, textStatus, jqXHR) {
					location.reload();
			},
			error: function(jqXHR, textStatus, error) {
				console.log(error);
			}
		});
	});
	
	$('.minus-btn').click(function(){
		var id = $(this).data('item');
		$.ajax({
			type: 'GET',
			async: false,
			url: 'add_to_cart',
			data: {
				"bookId": (-1) * id
			},
			success: function(data, textStatus, jqXHR) {
					location.reload();
			},
			error: function(jqXHR, textStatus, error) {
				console.log(error);
			}
		});
	});
	
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