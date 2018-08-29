<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Teste voz</title>
<!-- Import do jQuery 3.3.1 -->
<script type="text/javascript" src="<%=request.getContextPath()%>/resources/bootstrap/js/jquery-3.3.1.min.js"></script>
<script src="http://code.responsivevoice.org/responsivevoice.js"></script>

<script type="text/javascript">





$( document ).ready(function() {
	function voiceStartCallback() {
	    console.log("Voice started");
	}
	 
	
	lista = [["tu gay", "bixa", "ordinaria"],["bola", "peixe", "gato"], ["verdade"]];
	
	var i = -1;
	var j = 0;
	
	function voiceEndCallback() {
		i++;
		if(i >= lista[j].length){
			j++;
			i = 0;
			if(j >= lista.length){
				console.log("The End");
				i = -1;
				j = 0;
			}else{
				responsiveVoice.speak(lista[j][i], "Brazilian Portuguese Female", parameters);
			}
		}else{
			responsiveVoice.speak(lista[j][i], "Brazilian Portuguese Female", parameters);
		}
	    
	}
	 
	var parameters = {
	    onstart: voiceStartCallback,
	    onend: voiceEndCallback
	}
	 
    	 
	$('#play').click(function(){

    	responsiveVoice.speak(" ", "Brazilian Portuguese Female", parameters);
    });
	
	 $('#pause').click(function(){
		responsiveVoice.pause();
	});
	 
	 $('#passar').click(function(){
		 responsiveVoice.pause();
	 		i++;
	 		if(i >= lista[j].length){
	 			j++;
	 			i = 0;
	 			
	 			if(j >= lista.length){
	 				j = 0;
	 				i = -1;
	 				console.log("The end");
	 			}else{
	 				responsiveVoice.speak(lista[j][i], "Brazilian Portuguese Female", parameters);
	 			}
	 		}else{
	 			responsiveVoice.speak(lista[j][i], "Brazilian Portuguese Female", parameters);
	 		}
	 		
		});
	 
	 $('#voltar').click(function(){
			responsiveVoice.pause();
	 		i--;
	 		if(i < 0){
	 			j--;
	 			if(j < 0){
	 				i= -1;
	 				j=0
	 				responsiveVoice.speak(lista[j][i], "Brazilian Portuguese Female", parameters);
	 			}else{
	 				i = lista[j].length-1;
	 				responsiveVoice.speak(lista[j][i], "Brazilian Portuguese Female", parameters);
	 			}
	 			
	 		}else{
	 			responsiveVoice.speak(lista[j][i], "Brazilian Portuguese Female", parameters);
	 		}
	 		
		});
});

    
</script>

</head>
<body>
	
<input id="play" type="button" value="Play" />
<input id="pause" type="button" value="Pause" />
<input id="passar" type="button" value="Passar" />
<input id="voltar" type="button" value="Voltar" />
</body>
</html>