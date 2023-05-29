package Boletinho;

import java.io.BufferedReader;
import java.io.FileReader;
import java.io.IOException;
import java.util.Formatter;

public class FileConverter {
    public static void main(String[] args) {
        String filePath = "C:/Users/Administrador/IdeaProjects/Boletim/src/main/java/Boletinho/Dados.txt"; // Substitua pelo caminho correto do arquivo

        try (BufferedReader br = new BufferedReader(new FileReader(filePath))) {
            String line;
            while ((line = br.readLine()) != null) {
                String[] columns = line.split(";");
                for (String column : columns) {
                    formatAndPrint(column);
                }
                System.out.println(); // Pula para a próxima linha
            }
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    private static void formatAndPrint(String value) {
        int columnWidth = 5; // Largura da coluna (ajuste conforme necessário)
        Formatter formatter = new Formatter();
        formatter.format("%1$-" + columnWidth + "s", value);
        System.out.print(formatter);
        formatter.close();
    }
}