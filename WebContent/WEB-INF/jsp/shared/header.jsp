<link href="<c:url value='/css/header.css'/>" rel="stylesheet" type="text/css" />

<div id="header">
	<div id="header-content">
		<div id="logo">
			<a href="<c:url value='/'/>" title='CATA'><b>C</b>ollaborative <b>A</b>cademic <b>T</b>ext <b>A</b>dvisor</a>
		</div>
		
		<div id="social">
			<!-- Facebook -->
			<div id="fb-root"></div>
			<script>(function(d, s, id) {
				  var js, fjs = d.getElementsByTagName(s)[0];
				  if (d.getElementById(id)) return;
				  js = d.createElement(s); js.id = id;
				  js.src = "//connect.facebook.net/pt_BR/all.js#xfbml=1";
				  fjs.parentNode.insertBefore(js, fjs);
				}(document, 'script', 'facebook-jssdk'));
			</script>
			<div class="fb-like" data-send="false" data-layout="button_count" data-width="100" data-show-faces="false"></div>
			
			<!-- Twitter -->
			<a id="middle" href="https://twitter.com/share" class="twitter-share-button"
				data-text="Conheça o CATA!" data-lang="pt">Tweetar</a>
			<script>
				!function(d, s, id) {
					var js, fjs = d.getElementsByTagName(s)[0];
					if (!d.getElementById(id)) {
						js = d.createElement(s);
						js.id = id;
						js.src = "//platform.twitter.com/widgets.js";
						fjs.parentNode.insertBefore(js, fjs);
					}
				}(document, "script", "twitter-wjs");
			</script>
			
			<!-- Google Plus -->
			<div id="middle" class="g-plusone" data-size="medium"></div>
			<script type="text/javascript">
			  window.___gcfg = {lang: 'pt-BR'};
			
			  (function() {
			    var po = document.createElement('script'); po.type = 'text/javascript'; po.async = true;
			    po.src = 'https://apis.google.com/js/plusone.js';
			    var s = document.getElementsByTagName('script')[0]; s.parentNode.insertBefore(po, s);
			  })();
			</script>
		</div>
		
		<div id="menu" class="nav_bar">
			<ul id="menu">
				<li><a id="index-menu" href="<c:url value='/'/>" title='Início'>Início</a></li>
				<li><a id="rules-menu" href="<c:url value='/rules'/>" title='Regras'>Regras</a></li>
				<li><a id="about-menu" href="<c:url value='/about'/>" title='Sobre'>Sobre</a></li>
			</ul>	
		</div>
		
	</div>
</div>