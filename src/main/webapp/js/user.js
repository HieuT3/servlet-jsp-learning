function deleteUser(userId) {
	if(confirm("Are you sure you want to delete this user ?")) {
		window.location = 'delete_user?id=' + userId;
	}
}