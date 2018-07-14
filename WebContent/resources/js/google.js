//Autenticação da conta

	  var googleUser = {};
	  var startApp = function() {
	    gapi.load('auth2', function(){
	      // Retrieve the singleton for the GoogleAuth library and set up the client.
	      auth2 = gapi.auth2.init({
	        client_id: '686903218226-p5t42arftgs3onms88c2pvhj4j5tlvfb.apps.googleusercontent.com',
	        cookiepolicy: 'single_host_origin',
	        // Request scopes in addition to 'profile' and 'email'
	        //scope: 'additional_scope'
	      });
	      attachSignin(document.getElementById('customBtn'));
	    });
	  };

	  
//Resgate dos dados
	  
	  function attachSignin(element) {
	    console.log(element.id);
	    auth2.attachClickHandler(element, {},
	        function(googleUser) {
	    	 var profile = googleUser.getBasicProfile();
			  $.ajax({
				     type: "POST",
				     url: "usuario/google",
				     data: { nome: profile.getName(), email: profile.getEmail() },
				     
				     success: function(data){
				    	 if(data == "true"){
				    		//Url para a tela inicial
							window.location.href = "/VOX4T/usuario/logadoGoogle";
				    	 }
				     }
				});
	        }, function(error) {
	          alert(JSON.stringify(error, undefined, 2));
	        });
	  }