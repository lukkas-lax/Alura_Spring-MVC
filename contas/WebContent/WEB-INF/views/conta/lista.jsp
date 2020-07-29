<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Listagem de Contas</title>
<script src="resources/js/jquery.js"></script>
<script type="text/javascript">
	
function pagaAgora(id) {
	$.post("pagaConta", {'id' : id}, function() {
	  $("#conta_"+id).html("Paga!");
	});
	window.location.reload()
	}
	

</script>
</head>
<body>

	<h3>Listagem de Contas</h3>

	<table>

		<tr>
			<th>Código</th>
			<th>Descrição</th>
			<th>Valor?</th>
			<th>Tipo</th>
			<th>Pago?</th>
			<th>Data de Pagamento</th>
			<th>Ações</th>
		</tr>


		<c:forEach items="${todascontas}" var="conta">
			<tr>
				<td>${conta.id}</td>
				<td>${conta.descricao}</td>
				<td>${conta.valor}</td>
				<td>${conta.tipo}</td>
				<td><c:if test="${conta.paga eq false }">
				Não paga
				</c:if> <c:if test="${conta.paga eq true }">
				Paga
				</c:if></td>
				<td><fmt:formatDate value="${conta.dataPagamento.time}" pattern="dd/MM/yyyy"/></td>
				<td><a href="removeConta?id=${conta.id }">Deletar</a>/
				<a href="mostraConta?id=${conta.id}">Alterar</a>/</td>
				
				<td id="conta_${conta.id}">
  				<c:if test="${conta.paga eq false}">
    			<a href="#" onClick="pagaAgora(${conta.id})">
      			Pagar agora!
    			</a>
  				</c:if>
  				<c:if test="${conta.paga eq true }">
   				 Paga!
  				</c:if>
				</td>
				
			</tr>
		</c:forEach>
	</table>
	
	<br><br>
	
	<form action="logout" method="post">
<input type="submit" value="Logout"/>
</form>

</body>
</html>