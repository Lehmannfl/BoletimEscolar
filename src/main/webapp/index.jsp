<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="Boletinho.DataProcessor" %>


<html>

<link rel="stylesheet" href="Boletim_war/custom.css">
<head>
    <style>
        thead{color: #F0FFF0
        }
        thead{ background-color: #d7792c
        }


        table,th,td{border: 2px solid #000;}
        table{border-collapse: collapse}
        table,tr {
            background-color: #8a8;
            color:black;
            font-size: 10px;
            text-align: center;

        }
        body{
            font-family: Arial, Verdana, Tahoma, Sans-Serif;
            color: #333333;
            font-size: 16px;
            text-align: center;

        }

        p{
            line-height: 150%;
            text-align: justify;
        }
        h1{
            font-size: 30px;
            color: #003366;
            text-transform: uppercase;
        }
        h3{
            font-size: 20px;
            padding: 5px;
            background-color: #E3E3E3;
            color: #4C4C4C;
        }




    </style>

</head>
<body bgcolor="#bdb76b">

<h1>BOLETIM ESCOLAR</h1>

<form action="index.jsp" method="post">
    <h3 >Informe o código da Escola seguido do nome da turma:</h3>
    <h6>Exemplo: Código da sua Escola: 44008. Nome da sua turma:1ºEMREG1. Digite abaixo: 440081EMREG1</h6>
    <h6>OBSERVAÇÃO: As letras da sua turma precisam ser digitadas em Letras "MAIÚSCULAS"</h6>
    <label for="idToQuery1">Digite aqui==></label>
    <input type="text" id="idToQuery1" class="btn btn-green" name="idToQuery1" >
    <H2>-------------------------------------------------------</H2>
    <h3>CONFIRME os códigos acima porém, com a letras "minúsculas":</h3>
    <h6>Exemplo: Código da sua Escola: 44008. Nome da sua turma:1ºEMREG1. Digite abaixo: 440081emreg1</h6>
    <h6>OBSERVAÇÃO: As letras da sua turma precisam ser digitadas em Letras "minúsculas"</h6>
    <label for="idToQuery2">Digite aqui==></label>
    <input type="text" id="idToQuery2" class="btn btn-green" name="idToQuery2">
    <H2>-------------------------------------------------------</H2>
    <h3>Informe o seu número de matrícula:</h3>
    <h6>Digite abaixo o número de sua Matrícula. Peça ao seu professor ou a Secretaria de sua Escola o seu número de sua Matrícula.</h6>
    <label for="idToQuery3">Digite aqui==></label>
    <input type="text" id="idToQuery3" class="btn btn-green" name="idToQuery3">
    <p></p>
    <input type="submit" class="btn btn-green" value="Consultar Boletim">

</form>
</body>
<% DataProcessor dataProcessor = new DataProcessor();
    dataProcessor.processFile("C:/Users/Administrador/IdeaProjects/Boletim/src/main/java/Boletinho/Dados.txt");%>

<%-- Processamento dos dados e exibição da tabela formatada --%>
<%-- Verifica se o formulário foi submetido --%>
<% if (request.getMethod().equals("POST")) { %>
<%-- Extrai os parâmetros do formulário --%>
<%-- Supondo que os parâmetros foram enviados corretamente --%>
<%-- Substitua 'separador' pelo caractere que separa os valores no seu arquivo 'dados.txt' --%>
<%-- Por exemplo, se os valores estiverem separados por ponto e vírgula (;), use ';' --%>
<%-- Você pode adaptar esta lógica de acordo com a estrutura dos dados no seu arquivo --%>


<% String idToQuery1 = request.getParameter("idToQuery1"); %>
<% String idToQuery2 = request.getParameter("idToQuery2"); %>
<% String idToQuery3 = request.getParameter("idToQuery3"); %>
<%
    String separador = ",";
%>
<%-- Crie um ArrayList para armazenar as informações fornecidas --%>
<% java.util.List<String[]> dados = new java.util.ArrayList<>(); %>

<%-- Adicione as informações fornecidas ao ArrayList --%>
<%-- Aqui está um exemplo considerando as informações fornecidas --%>

<%String value = dataProcessor.getValueById(idToQuery1);%>
<% if (value != null) { %>
<% dados.add(new String[]{"Componente Curricular " + idToQuery1, value}); %>
<% } else { %>
<% dados.add(new String[]{"ALERTA: Código com letras MAIÚSCULAS NÃO ENCONTRADO!!", idToQuery1}); %>
<% } %>

<%String value1 = dataProcessor.getValueById(idToQuery2);%>
<% if (value1 != null) { %>
<% dados.add(new String[]{"Colunas de NOTAS & FALTAS " + idToQuery2, value1}); %>
<% } else { %>
<% dados.add(new String[]{"ALERTA: Código com letras MINÚSCULAS NÃO ENCONTRADO!!", idToQuery2}); %>
<% } %>

<%String value2 = dataProcessor.getValueById(idToQuery3);%>
<% if (value2 != null) { %>
<% dados.add(new String[]{"Nome do ALUNO " + idToQuery3, value2}); %>
<% } else { %>
<% dados.add(new String[]{"ALERTA: Número de Matrícula NÃO ENCONTRADO!!", idToQuery3}); %>

<% } %>


<%-- Exiba a tabela formatada --%>
<table border="1"  >
    <%-- Percorra o ArrayList para exibir as linhas e colunas da tabela --%>

    <% for (String[] linha : dados) { %>
    <tr>
        <% for (String coluna : linha) { %>
        <%-- Separe o conteúdo da coluna por ponto e vírgula --%>
        <% String[] colunas = coluna.split(";"); %>
        <%-- Percorra as colunas e gere as células da tabela --%>
        <% for (String colunaSeparada : colunas) { %>
        <td ><%= colunaSeparada %></td>
        <% } %>
        <% } %>
    </tr>
    <% } %>
</table>
<% } %>

</html>