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
	
	$('.delete-btn').click(function(){
		var id = $(this).data('item');
		window.location.href = 'delete_item?id=' + id;
	});
});