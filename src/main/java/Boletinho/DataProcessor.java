package Boletinho;

import java.io.BufferedReader;
import java.io.FileReader;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

public class DataProcessor {
    private List<Data> dataList;

    public DataProcessor() {
        dataList = new ArrayList<>();
    }

    public void processFile(String filePath) {
        try (BufferedReader br = new BufferedReader(new FileReader(filePath))) {
            String line;
            while ((line = br.readLine()) != null) {
                String[] parts = line.split(":");
                if (parts.length == 2) {
                    String id = parts[0];
                    String value = parts[1];
                    Data data = new Data(id, value);
                    dataList.add(data);
                }
            }
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    public String getValueById(String id) {
        for (Data data : dataList) {
            if (data.getId().equals(id)) {
                return data.getValue();
            }
        }
        return null;
    }

}