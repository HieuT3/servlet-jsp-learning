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

var profileBtn = document.querySelector('.acc-profile');
profileBtn.addEventListener('click', function(){
	window.location.href = 'view_profile';
});