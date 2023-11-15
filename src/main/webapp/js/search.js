var contentByGrid = document.querySelector('.content-wrapper-grid');
var contentByList = document.querySelector('.content-wrapper-list');
var categories = document.querySelectorAll('.view-category');
var searchInput = document.getElementById('search-input');
var searchBtn = document.getElementById('search-btn');

categories.forEach(function(category){
	category.addEventListener('click', function(event){
		event.preventDefault();
		var categoryId = category.getAttribute('data-category');
		if(categoryId == 0) {
			console.log('OK');
			fetchAllBook();
		}
		else fetchBookByCategory(categoryId);
	});
});

function limitContent(content, limit) {
	var words = content.split(' ');
	if(words.length > limit) {
		var content = words.slice(0, limit);
		var fullContent = content.join(' ');
		return fullContent + '.....';
	}
}

window.addEventListener('load', fetchAllBook);

function fetchBookByCategory(categoryId) {
	fetch('view_category?id=' + categoryId)
	.then(response => response.json())
	.then(listBook => {
		for(var i = 0; i < listBook.length; i++) {
			listBook[i].description = limitContent(listBook[i].description, 80);
		}
		let listBookByCategoryByGridHTML = listBook.map(book => `
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
                            <a class="cart" href=""./add_to_cart?bookId=${book.bookId}"">Add to Cart</a>
                        </div>
                    </div>
                    <div class="why-text">
                        <h4><a href="view_book?id=${book.bookId}">${book.title}</a></h4>
                        <h5> $${book.price}</h5>
                    </div>
                </div>
            </div>
        `).join('');
        

		let listBookByCategoryByListHTML = listBook.map(book => `
        <div class=" list-view-box">  
        	<div class="row">
                <div class="col-sm-6 col-md-6 col-lg-4 col-xl-4">
                    <div class="products-single fix">
                        <div class="box-img-hover">
                            <div class="type-lb">
                                <p class="sale">Sale</p>
                            </div>
                            <a href="view_book?id=${book.bookId}"><img src="data:image/jpg;base64,${book.base64Image}" class="img-fluid" alt="Image"></a>
                        </div>
                    </div>
                </div>
                <div class="col-sm-6 col-md-6 col-lg-8 col-xl-8">
                    <div class="why-text full-width">
                        <h4><a href="view_book?id=${book.bookId}">${book.title}</a></h4>
                        <h5> <del>$ 60.00</del> ${book.price}</h5>
                        <p class="book-desc">${book.description}</p>
                        <a class="btn hvr-hover" href="./add_to_cart?bookId=${book.bookId}">Add to Cart</a>
                    </div>
                </div>
            </div>
         </div>
        `).join('');
        
        contentByGrid.innerHTML = '';
        contentByGrid.innerHTML = listBookByCategoryByGridHTML;
        
        contentByList.innerHTML = '';
        contentByList.innerHTML = listBookByCategoryByListHTML;
	});
}


function fetchAllBook() {
	fetch('list_all_books')
	.then(response => response.json())
	.then(listBook => {
		for(var i = 0; i < listBook.length; i++) {
			listBook[i].description = limitContent(listBook[i].description, 80);
		}
		let listBookByCategoryByGridHTML = listBook.map(book => `
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
                            <a class="cart" href=""./add_to_cart?bookId=${book.bookId}"">Add to Cart</a>
                        </div>
                    </div>
                    <div class="why-text">
                        <h4><a href="view_book?id=${book.bookId}">${book.title}</a></h4>
                        <h5> $${book.price}</h5>
                    </div>
                </div>
            </div>
        `).join('');
        
        let listBookByCategoryByListHTML = listBook.map(book => `
        <div class=" list-view-box">  
        	<div class="row">
                <div class="col-sm-6 col-md-6 col-lg-4 col-xl-4">
                    <div class="products-single fix">
                        <div class="box-img-hover">
                            <div class="type-lb">
                                <p class="sale">Sale</p>
                            </div>
                            <a href="view_book?id=${book.bookId}"><img src="data:image/jpg;base64,${book.base64Image}" class="img-fluid" alt="Image"></a>
                        </div>
                    </div>
                </div>
                <div class="col-sm-6 col-md-6 col-lg-8 col-xl-8">
                    <div class="why-text full-width">
                        <h4><a href="view_book?id=${book.bookId}">${book.title}</a></h4>
                        <h5> <del>$ 60.00</del> ${book.price}</h5>
                        <p class="book-desc">${book.description}</p>
                        <a class="btn hvr-hover" href="./add_to_cart?bookId=${book.bookId}">Add to Cart</a>
                    </div>
                </div>
            </div>
         </div>
        `).join('');

        contentByGrid.innerHTML = '';
        contentByGrid.innerHTML = listBookByCategoryByGridHTML;
        
        contentByList.innerHTML = '';
        contentByList.innerHTML = listBookByCategoryByListHTML;
	});
}

function fetchSearchBook(keyword) {
	fetch('search_book?keyword=' + keyword)
	.then(response => response.json())
	.then(listBook => {
		if(listBook.length === 0) {
			contentByGrid.innerHTML = '';
			contentByList.innerHTML = '';
			return;
		}
		for(var i = 0; i < listBook.length; i++) {
			listBook[i].description = limitContent(listBook[i].description, 80);
		}
		let listBookByCategoryByGridHTML = listBook.map(book => `
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
                            <a class="cart" href=""./add_to_cart?bookId=${book.bookId}"">Add to Cart</a>
                        </div>
                    </div>
                    <div class="why-text">
                        <h4><a href="view_book?id=${book.bookId}">${book.title}</a></h4>
                        <h5> $${book.price}</h5>
                    </div>
                </div>
            </div>
        `).join('');
        
        let listBookByCategoryByListHTML = listBook.map(book => `
        <div class=" list-view-box">  
        	<div class="row">
                <div class="col-sm-6 col-md-6 col-lg-4 col-xl-4">
                    <div class="products-single fix">
                        <div class="box-img-hover">
                            <div class="type-lb">
                                <p class="sale">Sale</p>
                            </div>
                            <a href="view_book?id=${book.bookId}"><img src="data:image/jpg;base64,${book.base64Image}" class="img-fluid" alt="Image"></a>
                        </div>
                    </div>
                </div>
                <div class="col-sm-6 col-md-6 col-lg-8 col-xl-8">
                    <div class="why-text full-width">
                        <h4><a href="view_book?id=${book.bookId}">${book.title}</a></h4>
                        <h5> <del>$ 60.00</del> ${book.price}</h5>
                        <p class="book-desc">${book.description}</p>
                        <a class="btn hvr-hover" href="./add_to_cart?bookId=${book.bookId}">Add to Cart</a>
                    </div>
                </div>
            </div>
         </div>
        `).join('');
        
        contentByGrid.innerHTML = '';
        contentByGrid.innerHTML = listBookByCategoryByGridHTML;
        
        contentByList.innerHTML = '';
        contentByList.innerHTML = listBookByCategoryByListHTML;
	});
}

searchInput.addEventListener('keypress', function(event){
	if(event.key === 'Enter') {
		var keyword = searchInput.value;
		delayedSearch(keyword);
		
	}
});

searchBtn.addEventListener('click', function(){
	var keyword = searchInput.value;
	delayedSearch(keyword);
});


function delayedSearch(keyword) {
	clearTimeout(window.searchTimer);
	
	document.getElementById('myModal').style.display = 'flex';
	
	window.searchTimer = setTimeout(function(){
		fetchSearchBook(keyword);
		hideModal();
	}, 1300);
}
		
function hideModal() {
    document.getElementById('myModal').style.display = 'none';
}