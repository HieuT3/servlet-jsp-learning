function limitParagraph() {
	var descriptions = document.querySelectorAll('.book-desc');
	for(var i = 0; i < descriptions.length; i++) {
		var content = descriptions[i].textContent;
		
		var newContent = limitContent(content, 80);
		
		descriptions[i].textContent = newContent + ".....";
	}	
}

function limitContent(content, limit) {
	var words = content.split(' ');
	if(words.length > limit) {
		var content = words.slice(0, limit);
		var fullContent = content.join(' ');
		return fullContent;
	}
}

window.addEventListener('load', limitParagraph);

var categories = document.querySelectorAll('.view-category');
categories.forEach(function(category){
	category.addEventListener('click', function(event){
		event.preventDefault();
		var categoryId = category.getAttribute('data-category');
		fetchBookByCategory(categoryId);
	});
});


function fetchBookByCategory(categoryId) {
	fetch('view_category?id=' + categoryId)
	.then(response => response.json())
	.then(listBook => {
		let listBookByCategoryHTML = listBook.map(book => `
            <div class="col-sm-6 col-md-6 col-lg-4 col-xl-4">
                <div class="products-single fix">
                    <div class="box-img-hover">
                        <div class="type-lb">
                            <p class="sale">Sale</p>
                        </div>
                        <img style="width: 260px; height: 300px;" src="data:image/jpg;base64,${book.base64Image}" class="img-fluid" alt="Image">
                        <div class="mask-icon">
                            <ul>
                                <li><a href="./view_book?id=${book.bookId}" data-toggle="tooltip" data-placement="right" title="View"><i class="fas fa-eye"></i></a></li>
                            </ul>
                            <a class="cart" href="#">Add to Cart</a>
                        </div>
                    </div>
                    <div class="why-text">
                        <h4><a href="view_book?id=${book.bookId}">${book.title}</a></h4>
                        <h5> $${book.price}</h5>
                    </div>
                </div>
            </div>
        `).join('');
        console.log(listBookByCategoryHTML);
	});
}