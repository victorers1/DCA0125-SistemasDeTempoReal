package main;

import javafx.application.Application;
import javafx.scene.Parent;
import javafx.scene.Scene;
import javafx.scene.layout.Pane;
import javafx.scene.paint.Color;
import javafx.scene.shape.Circle;
import javafx.stage.Stage;
import main.models.Ponto;

public class Main extends Application {

    public static void main(String[] args) {
        launch(args);
    }

    private Parent criaMundo() {
        var origem = new Ponto(140, 250);
        Integer lado = 190;
        var controller = new Controller(origem, lado);

        Pane mundo = new Pane();
        controller.trens.forEach(
                t -> {
                    mundo.getChildren().add(t.getDesenho());
                }
        );
        controller.pistas.forEach(
                p -> {
                    mundo.getChildren().add(p.getDesenho());
                }
        );

        var c = new Circle(5);
        c.setCenterX(origem.getX());
        c.setCenterY(origem.getY());
        c.setFill(Color.RED);
        mundo.getChildren().add(c);

        controller.ligarPistas();

        return mundo;
    }

    @Override
    public void start(Stage stage) throws Exception {
        stage.setTitle("Trens sincronizados");
        stage.setScene(new Scene(criaMundo(), 700, 600));
        stage.show();
    }
}
