package Boletinho;

import java.util.Scanner;

public class Main {
    public static void main(String[] args) {


        DataProcessor dataProcessor = new DataProcessor();
        dataProcessor.processFile("C:/Users/Administrador/IdeaProjects/Boletim/src/main/java/Boletinho/Dados.txt");


        //Informando a linha de Componentes Curriculares
        Scanner input = new Scanner(System.in);
        System.out.print("Informe código da Escola seguido do nome da turma: ");
        String idToQuery1 = input.nextLine();


        String value1 = dataProcessor.getValueById(idToQuery1);
        if (value1 != null) {
            System.out.println("Componente Curricular " + idToQuery1 + ": " + value1);
        } else {
            System.out.println("Código da Escola não encontrado: " + idToQuery1);
        }


        //Informando a segunda linha com Nomes: NOTA e  FALTAS
        Scanner nota = new Scanner(System.in);
        System.out.print("Informe o nome da turma seguido do código da Escola : ");
        String idToQuery2 = nota.nextLine();


        String value2 = dataProcessor.getValueById(idToQuery2);
        if (value2 != null) {
            System.out.println("NOTAS / FALTAS " + idToQuery2 + ": " + value2);

        } else {
            System.out.println("NOTAS / FALTAS não encontrado: " + idToQuery2);
        }

        //informando a linha com valor das notas e quantidades de faltas
        Scanner valor = new Scanner(System.in);
        System.out.print("Informe o seu número de matrícula: ");
        String idToQuery3 = valor.nextLine();


        String value3 = dataProcessor.getValueById(idToQuery3);
        if (value3 != null) {

            System.out.println("Notas e Faltas do Aluno " + idToQuery3 + ": " + value3);

        } else {
            System.out.println("Número de matrícula não encontrado: " + idToQuery3);
        }

        }
    }
