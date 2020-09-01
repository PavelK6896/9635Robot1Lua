package app.web.pavelk.robot1.calculation1;

import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.util.ArrayList;
import java.util.List;

public class Main {
    public static void main(String[] args) throws IOException {

        List<String> strings = Files.readAllLines(Paths.get("data1.txt"));
        List<List<Float>> list = new ArrayList<>();
        for (int i = 0; i < 3; i++) {
            list.add(new ArrayList<>());
        }

        strings.forEach(m -> {
            String[] split = m.split(",");
            for (int i = 0; i < 3; i++) {
                list.get(i).add(Float.parseFloat(split[i + 1]));
            }
        });

        System.out.println(list.get(0).get(0) + " прошлое дальнее значение количество " + list.get(0).size());
        System.out.println(list.get(0).get(list.get(0).size() - 1) + " первое крайнее только что значение ближнее ");

        List<Float> index = index(list);
        System.out.println(index.get(0) + " дальнее прошлое значение индекса ");
        System.out.println(index.get((index.size() - 1)) + " ближнее крайнее значение индекса ");
    }


    public static List<Float> index(List<List<Float>> f) {
        List<Float> l = new ArrayList<>();
        for (int i = 0; i < f.get(0).size(); i++) {
            float m = 0.0f;
            for (int j = 0; j < 3; j++) {
                m += f.get(j).get(i);
            }
            l.add((m / 3));
        }
        return l;
    }
}
