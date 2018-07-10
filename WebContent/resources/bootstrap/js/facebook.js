$(function() {

	var app_id = '1815458145180497';
	var scopes = 'email';
	var btn_login = '<a href="#" class="btn btn-primary" id="login"><i class="fab fa-facebook-square"></i>&nbsp; Facebook</a>';
	var div_session = "<div id='facebook-session'>" + "<strong></strong>"
			+ "<img>"
			+ "<a href='#' id='logout' class='btn btn-danger'>Sair</a>"
			+ "</div>";

	window.fbAsyncInit = function() {
		FB.init({
			appId : app_id,
			status : true,
			cookie : true,
			xfbml : true,
			version : 'v2.1'
		});

		FB.getLoginStatus(function(response) {
			statusChangeCallback(response, function() {
			});
		});
	};

	var statusChangeCallback = function(response, callback) {
		console.log(response);
		if (response.status === 'connected') {
			getFacebookData();
		} else {
			callback(false);
		}
	}

	var checkLoginState = function(callback) {
		FB.getLoginStatus(function(response) {
			callback(response);
		});
	}

	var getFacebookData = function() {
		FB.api('/me', function(response) {
			$('#login').after(div_session);
			$('#login').remove();
			$('#facebook-session strong')
					.text("Bem-vindo(a): " + response.name);
			$('#facebook-session img').attr(
					'src',
					'http://graph.facebook.com/' + response.id
							+ '/picture?type=large');
		});
	}

	var facebookLogin = function() {
		checkLoginState(function(data) {
			if (data.status !== 'connected') {
				FB.login(function(response) {
					if (response.status === 'connected')
						getFacebookData();
				}, {
					scope : scopes
				});
			}
		})
	}

	var facebookLogout = function() {
		checkLoginState(function(data) {
			if (data.status === 'connected') {
				FB.logout(function(response) {
					$('#facebook-session').before(btn_login);
					$('#facebook-session').remove();
				})
			}
		})
	}

	$(document).on('click', '#login', function(e) {
		e.preventDefault();
		facebookLogin();
	})

	$(document).on('click', '#logout', function(e) {
		e.preventDefault();
		if (confirm("Certeza?"))
			facebookLogout();
		else
			return false;
	})
})
