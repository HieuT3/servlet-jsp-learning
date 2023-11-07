function deleteCategory(categoryId) {
	if(confirm("Are you sure you want to delete this category ?")) {
		window.location = 'delete_category?id=' + categoryId;
	}
}
