
/************************************jquery validação***************************************************************/
$(document).ready(function(){

	$('#cadastroForm').validate({
		rules:{
			nome:{
				required:true
			},    
			email:{
				required:true,
				email:true,  
				remote:{
					url:"verificarEmail",
					type:"get",
					data:{
						email: function(){
							
								return $("#email").val();	
							
						}
					}
				}
			},
			dataNascimento:{
				required:true
			}
		},
	messages:{
		
		nome:{
			required:"Digite um nome"
		},
		dataNascimento:{
			required:"data inválida",
			minlength:"formato inválido"
		},
		email:{
			required:"Digite um email",
			email: "Digite um email válido",
			remote: "Esse email já está sendo usado"
		},
	}
});
});

/************************************Mascara data de nascimento***************************************************************/


var $jscomp={scope:{},findInternal:function(a,k,c){a instanceof String&&(a=String(a));for(var n=a.length,f=0;f<n;f++){var b=a[f];if(k.call(c,b,f,a))return{i:f,v:b}}return{i:-1,v:void 0}}};$jscomp.defineProperty="function"==typeof Object.defineProperties?Object.defineProperty:function(a,k,c){if(c.get||c.set)throw new TypeError("ES3 does not support getters and setters.");a!=Array.prototype&&a!=Object.prototype&&(a[k]=c.value)};
$jscomp.getGlobal=function(a){return"undefined"!=typeof window&&window===a?a:"undefined"!=typeof global&&null!=global?global:a};$jscomp.global=$jscomp.getGlobal(this);$jscomp.polyfill=function(a,k,c,n){if(k){c=$jscomp.global;a=a.split(".");for(n=0;n<a.length-1;n++){var f=a[n];f in c||(c[f]={});c=c[f]}a=a[a.length-1];n=c[a];k=k(n);k!=n&&null!=k&&$jscomp.defineProperty(c,a,{configurable:!0,writable:!0,value:k})}};
$jscomp.polyfill("Array.prototype.find",function(a){return a?a:function(a,c){return $jscomp.findInternal(this,a,c).v}},"es6-impl","es3");
(function(a,k,c){"function"===typeof define&&define.amd?define(["jquery"],a):"object"===typeof exports?module.exports=a(require("jquery")):a(k||c)})(function(a){var k=function(b,h,e){var d={invalid:[],getCaret:function(){try{var a,p=0,h=b.get(0),e=document.selection,g=h.selectionStart;if(e&&-1===navigator.appVersion.indexOf("MSIE 10"))a=e.createRange(),a.moveStart("character",-d.val().length),p=a.text.length;else if(g||"0"===g)p=g;return p}catch(A){}},setCaret:function(a){try{if(b.is(":focus")){var d,
l=b.get(0);a+=1;l.setSelectionRange?l.setSelectionRange(a,a):(d=l.createTextRange(),d.collapse(!0),d.moveEnd("character",a),d.moveStart("character",a),d.select())}}catch(z){}},events:function(){b.on("keydown.mask",function(a){b.data("mask-keycode",a.keyCode||a.which)}).on(a.jMaskGlobals.useInput?"input.mask":"keyup.mask",d.behaviour).on("paste.mask drop.mask",function(){setTimeout(function(){b.keydown().keyup()},100)}).on("change.mask",function(){b.data("changed",!0)}).on("blur.mask",function(){c===
d.val()||b.data("changed")||b.trigger("change");b.data("changed",!1)}).on("blur.mask",function(){c=d.val()}).on("focus.mask",function(b){!0===e.selectOnFocus&&a(b.target).select()}).on("focusout.mask",function(){e.clearIfNotMatch&&!k.test(d.val())&&d.val("")})},getRegexMask:function(){for(var a=[],b,d,e,g,c=0;c<h.length;c++)(b=m.translation[h.charAt(c)])?(d=b.pattern.toString().replace(/.{1}$|^.{1}/g,""),e=b.optional,(b=b.recursive)?(a.push(h.charAt(c)),g={digit:h.charAt(c),pattern:d}):a.push(e||
b?d+"?":d)):a.push(h.charAt(c).replace(/[-\/\\^$*+?.()|[\]{}]/g,"\\$&"));a=a.join("");g&&(a=a.replace(new RegExp("("+g.digit+"(.*"+g.digit+")?)"),"($1)?").replace(new RegExp(g.digit,"g"),g.pattern));return new RegExp(a)},destroyEvents:function(){b.off("input keydown keyup paste drop blur focusout ".split(" ").join(".mask "))},val:function(a){var d=b.is("input")?"val":"text";if(0<arguments.length){if(b[d]()!==a)b[d](a);d=b}else d=b[d]();return d},getMCharsBeforeCount:function(a,b){for(var d=0,e=0,
g=h.length;e<g&&e<a;e++)m.translation[h.charAt(e)]||(a=b?a+1:a,d++);return d},caretPos:function(a,b,e,c){return m.translation[h.charAt(Math.min(a-1,h.length-1))]?Math.min(a+e-b-c,e):d.caretPos(a+1,b,e,c)},behaviour:function(e){e=e||window.event;d.invalid=[];var h=b.data("mask-keycode");if(-1===a.inArray(h,m.byPassKeys)){var c=d.getCaret(),l=d.val(),g=l.length,k=d.getMasked(),f=k.length,n=d.getMCharsBeforeCount(f-1)-d.getMCharsBeforeCount(g-1),l=c<g&&k!==l;d.val(k);l&&(8!==h&&46!==h?c=d.caretPos(c,
g,f,n):--c,d.setCaret(c));return d.callbacks(e)}},getMasked:function(a,b){var c=[],l=void 0===b?d.val():b+"",g=0,k=h.length,f=0,n=l.length,p=1,v="push",w=-1,r,u;e.reverse?(v="unshift",p=-1,r=0,g=k-1,f=n-1,u=function(){return-1<g&&-1<f}):(r=k-1,u=function(){return g<k&&f<n});for(var y;u();){var x=h.charAt(g),t=l.charAt(f),q=m.translation[x];if(q)t.match(q.pattern)?(c[v](t),q.recursive&&(-1===w?w=g:g===r&&(g=w-p),r===w&&(g-=p)),g+=p):t===y?y=void 0:q.optional?(g+=p,f-=p):q.fallback?(c[v](q.fallback),
g+=p,f-=p):d.invalid.push({p:f,v:t,e:q.pattern}),f+=p;else{if(!a)c[v](x);t===x?f+=p:y=x;g+=p}}l=h.charAt(r);k!==n+1||m.translation[l]||c.push(l);return c.join("")},callbacks:function(a){var l=d.val(),k=l!==c,f=[l,a,b,e],g=function(a,b,d){"function"===typeof e[a]&&b&&e[a].apply(this,d)};g("onChange",!0===k,f);g("onKeyPress",!0===k,f);g("onComplete",l.length===h.length,f);g("onInvalid",0<d.invalid.length,[l,a,b,d.invalid,e])}};b=a(b);var m=this,c=d.val(),k;h="function"===typeof h?h(d.val(),void 0,b,
e):h;m.mask=h;m.options=e;m.remove=function(){var a=d.getCaret();d.destroyEvents();d.val(m.getCleanVal());d.setCaret(a-d.getMCharsBeforeCount(a));return b};m.getCleanVal=function(){return d.getMasked(!0)};m.getMaskedVal=function(a){return d.getMasked(!1,a)};m.init=function(c){c=c||!1;e=e||{};m.clearIfNotMatch=a.jMaskGlobals.clearIfNotMatch;m.byPassKeys=a.jMaskGlobals.byPassKeys;m.translation=a.extend({},a.jMaskGlobals.translation,e.translation);m=a.extend(!0,{},m,e);k=d.getRegexMask();if(c)d.events(),
d.val(d.getMasked());else{e.placeholder&&b.attr("placeholder",e.placeholder);b.data("mask")&&b.attr("autocomplete","off");c=0;for(var f=!0;c<h.length;c++){var l=m.translation[h.charAt(c)];if(l&&l.recursive){f=!1;break}}f&&b.attr("maxlength",h.length);d.destroyEvents();d.events();c=d.getCaret();d.val(d.getMasked());d.setCaret(c+d.getMCharsBeforeCount(c,!0))}};m.init(!b.is("input"))};a.maskWatchers={};var c=function(){var b=a(this),c={},e=b.attr("data-mask");b.attr("data-mask-reverse")&&(c.reverse=
!0);b.attr("data-mask-clearifnotmatch")&&(c.clearIfNotMatch=!0);"true"===b.attr("data-mask-selectonfocus")&&(c.selectOnFocus=!0);if(n(b,e,c))return b.data("mask",new k(this,e,c))},n=function(b,c,e){e=e||{};var d=a(b).data("mask"),h=JSON.stringify;b=a(b).val()||a(b).text();try{return"function"===typeof c&&(c=c(b)),"object"!==typeof d||h(d.options)!==h(e)||d.mask!==c}catch(u){}};a.fn.mask=function(b,c){c=c||{};var e=this.selector,d=a.jMaskGlobals,f=d.watchInterval,d=c.watchInputs||d.watchInputs,h=function(){if(n(this,
b,c))return a(this).data("mask",new k(this,b,c))};a(this).each(h);e&&""!==e&&d&&(clearInterval(a.maskWatchers[e]),a.maskWatchers[e]=setInterval(function(){a(document).find(e).each(h)},f));return this};a.fn.masked=function(a){return this.data("mask").getMaskedVal(a)};a.fn.unmask=function(){clearInterval(a.maskWatchers[this.selector]);delete a.maskWatchers[this.selector];return this.each(function(){var b=a(this).data("mask");b&&b.remove().removeData("mask")})};a.fn.cleanVal=function(){return this.data("mask").getCleanVal()};
a.applyDataMask=function(b){b=b||a.jMaskGlobals.maskElements;(b instanceof a?b:a(b)).filter(a.jMaskGlobals.dataMaskAttr).each(c)};var f={maskElements:"input,td,span,div",dataMaskAttr:"*[data-mask]",dataMask:!0,watchInterval:300,watchInputs:!0,useInput:function(a){var b=document.createElement("div"),c;a="on"+a;c=a in b;c||(b.setAttribute(a,"return;"),c="function"===typeof b[a]);return c}("input"),watchDataMask:!1,byPassKeys:[9,16,17,18,36,37,38,39,40,91],translation:{0:{pattern:/\d/},9:{pattern:/\d/,
optional:!0},"#":{pattern:/\d/,recursive:!0},A:{pattern:/[a-zA-Z0-9]/},S:{pattern:/[a-zA-Z]/}}};a.jMaskGlobals=a.jMaskGlobals||{};f=a.jMaskGlobals=a.extend(!0,{},f,a.jMaskGlobals);f.dataMask&&a.applyDataMask();setInterval(function(){a.jMaskGlobals.watchDataMask&&a.applyDataMask()},f.watchInterval)},window.jQuery,window.Zepto);




var options =  {onKeyPress: function(data, e, field, options){
  console.log(data.length)
  
  var dia = data.split('/')[0],
      mes = data.split('/')[1];
  
  if(data.length >=2) {
    if(dia > 31) $('#dataNascimento').val('31/');
  }
    
  if(data.length >=5) {
    if(mes > 12) $('#dataNascimento').val(dia+'/12/');
  }

}};

$('#dataNascimento').mask('00/00/0000', options);




/**************************************************************************************************************/