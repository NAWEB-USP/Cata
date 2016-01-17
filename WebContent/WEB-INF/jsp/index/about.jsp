<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		
		<link href="<c:url value='/css/style.css'/>" rel="stylesheet" type="text/css" />
		<link href="<c:url value='/css/user-menu.css'/>" rel="stylesheet" type="text/css" />
		
		<script type="text/javascript" src="<c:url value='/js/jquery-1.5.1.js'/>"></script>
		<script type="text/javascript">
			$(document).ready(function () {
				$("#about-menu").addClass('selected');
			});
		</script>
		
		<title>Sobre</title>
	</head>
	
	<body>
		<%@ include file="../shared/header.jsp"%>		
		<%@ include file="../shared/user-menu.jsp"%>
		
		<div id="page">
			<div id="content">
				<h1>Sobre</h1>
				<b>CATA (Collaborative Academic Text Advisor)</b> é desenvolvido na <a href="http://www.usp.br" target="_blank">Universidade de São Paulo</a>
				no escopo do <a href="http://nap.usp.br/naweb/" target="_blank">Núcleo de Pesquisa em Ambientes Colaborativos na Web</a> e do
				<a href="http://ccsl.ime.usp.br/" target="_blank">Centro de Competência em Software Livre</a>.<br>
				<p>
					<h3>Um verificador de estilo</h3>
					O CATA tem por finalidade detectar problemas de estilo em textos
					acadêmicos de Computação, bem como sugerir possíveis correções para tais problemas. O sistema analisa textos levando
					em conta aspectos linguísticos e estéticos, para, por exemplo, detectar ocorrências de traduções incorretas e
					estrangeirismos.
				</p>
				<p>
					<h3>Cadastre suas próprias regras e sugestões</h3>
					Um usuário autenticado no Sistema CATA pode cadastrar novas regras e sugestões de estilo, que ficam disponíveis a todos os demais usuários.
				</p>
				<p>
					<h3>CATA é Software Livre</h3>
					O código-fonte do Sistema CATA está hospedado no GitHub, acessível a partir deste
					<a href="https://github.com/NAWEB-USP/Cata" target="_blank">link</a>.
				</p>
				<p>
					<h3>Coordenação do projeto</h3>
					<a href="https://www.ime.usp.br/~gerosa" target="_blank">Prof. Dr. Marco Aurélio Gerosa</a>
				</p>
				<p>
					<h3>Desenvolvedores atuais</h3>
					Yoshio Mori
				</p>
				<p>
					<h3>Desenvolvedores anteriores</h3>
					Ana Luiza<br>
					Camila Achutti<br>
					Arthur<br>
					Daniel<br>
					Diego de Araújo Martinez Camarinha
				</p>
			</div>
		</div>	

<%@ include file="../shared/footer.jsp"%>