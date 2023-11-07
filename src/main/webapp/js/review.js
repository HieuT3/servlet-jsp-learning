function deleteReview(reviewId) {
	if(confirm("Are you sure want to delete this review?")) {
		window.location = 'delete_review?id=' + reviewId;
	}
}