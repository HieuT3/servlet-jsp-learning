var searchBtn = document.getElementById('search_btn');
if(searchBtn) {
	searchBtn.onclick = function(event) {
		var keyword = document.getElementById('search_content').value;
		if(keyword == '') {
			event.preventDefault();
		}
	}
} 


var registerForm = document.getElementById('register_form');
if(registerForm) {
	registerForm.addEventListener('submit', function(event){
		event.preventDefault();
		var password = document.getElementById('password').value;
		var rePassword = document.getElementById('rePassword').value;
		if(password === rePassword) {
			registerForm.submit();
		} else {
			var messageContent = document.getElementById('message_content');
			messageContent.textContent = "Confirm password error";
			document.getElementById('message').style.display = 'block';
			document.getElementById('password').focus();
		}
	});
}

var updateForm = document.getElementById('update_form');
if(updateForm) {
	updateForm.addEventListener('submit', function(event){
		event.preventDefault();
		var password = document.getElementById('password');
		var rePassword = document.getElementById('rePassword');
		var passVal = password.value;
		var rePassVal = rePassword.value;
		if(passVal !== '' || rePassVal !== '') {
			if(passVal !== '' && rePassVal !== '') {
				if(passVal === rePassVal) {
					updateForm.submit();
				} else {
					var messageContent = document.getElementById('message_content');
					messageContent.textContent = "Confirm password error";
					document.getElementById('message').style.display = 'block';
				}
			} else {
				if(passVal === '') {
					password.focus();
				} else {
					rePassword.focus();
				}
			}
		} else {
			updateForm.submit();
		}
	});
}

var addItem = document.getElementById('add_btn');
if(addItem != null) {
	addItem.onclick = function(event) {
	var bookId = addItem.getAttribute('data');
	window.location.href = 'add_to_cart?bookId=' + bookId;
	}
}

const formOpenBtn = document.querySelector("#form-open"),
	modalForm = document.querySelector("#modal-form"),
  formContainer = document.querySelector(".form_container"),
  formCloseBtn = document.querySelector(".form_close"),
  signupBtn = document.querySelector("#signup"),
  loginBtn = document.querySelector("#login"),
  pwShowHide = document.querySelectorAll(".pw_hide");

if(formOpenBtn != null) {
	formOpenBtn.addEventListener("click", () => modalForm.style.display = 'flex');
}

if(formCloseBtn != null) {
	formCloseBtn.addEventListener("click", () => modalForm.style.display = 'none');
}

pwShowHide.forEach((icon) => {
  icon.addEventListener("click", () => {
    let getPwInput = icon.parentElement.querySelector("input");
    if (getPwInput.type === "password") {
      getPwInput.type = "text";
      icon.classList.replace("fa-eye-slash", "fa-eye");
    } else {
      getPwInput.type = "password";
      icon.classList.replace("fa-eye", "fa-eye-slash");
    }
  });
});

signupBtn.addEventListener("click", (e) => {
  e.preventDefault();
  formContainer.classList.add("active");
});
loginBtn.addEventListener("click", (e) => {
  e.preventDefault();
  formContainer.classList.remove("active");
});


$(document).ready(function(){
	$('.signInForm').on('submit', function(event){
		event.preventDefault();
		var email = document.querySelector('.email-login').value;
		var password = document.querySelector('.pass-login').value;
		
		$.ajax({
			url: 'login',
			type: 'POST',
			async: false,
			data: {
				'email': email,
				'password': password
			},
			success: function(data) {
				var result = JSON.parse(data);
				if(result == true) {
					location.reload();
				} else {
					setTimeout(function(){
						document.querySelector('.alert-form-signin').style.display = 'flex';
					}, 1000);
					
				}
			},
			error: function() {
			}
		});
	});
	
	$('.signUpForm').on('submit', function(event){
		event.preventDefault();
		var name = document.querySelector('.name-signup').value;
		var email = document.querySelector('.email-signup').value;
		var password = document.querySelector('.pass-signup').value;
		var rePassword = document.querySelector('.re-pass-signup').value;
		
		if(password != rePassword) {
			setTimeout(function(){
				document.querySelector('.signup-failed-content').textContent = 'Passwords do not match. Please enter matching passwords.';
				document.querySelector('.alert-form-signup').style.display = 'flex';
			}, 1000);
			return;
		}
		
		$.ajax({
			url: 'register_customer',
			type: 'POST',
			async: false,
			data: {
				'fullname': name,
				'email': email,
				'password': password
			},
			success: function(data) {
				var result = JSON.parse(data);
				if(result == true) {
					location.reload();
				} else {
					setTimeout(function(){
						document.querySelector('.signup-failed-content').textContent = 'There was a problem creating your account. Check that your email address is spelled correctly.';
						document.querySelector('.alert-form-signup').style.display = 'flex'
					}, 1000);
				}
			},
			error: function() {
			}
		});
	});
});


var profileBtn = document.querySelector('.acc-profile');
if(profileBtn != null) {
	profileBtn.addEventListener('click', function(){
		window.location.href = 'view_profile';
	});
}