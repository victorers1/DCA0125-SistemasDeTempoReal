package main;

import javafx.animation.Animation;
import javafx.animation.TranslateTransition;
import javafx.application.Application;
import javafx.scene.Parent;
import javafx.scene.Scene;
import javafx.scene.layout.Pane;
import javafx.scene.layout.StackPane;
import javafx.scene.paint.Color;
import javafx.scene.shape.Circle;
import javafx.scene.shape.Rectangle;
import javafx.scene.text.Text;
import javafx.stage.Stage;
import javafx.util.Duration;
import main.models.CaminhoRetangular;
import main.models.Ponto;

public class Main extends Application {

    private Parent createContent() {
        var origem = new Ponto(50,50);


        var caminho1 = new CaminhoRetangular(origem, 100, 100);



        var box = new Rectangle(100,50, Color.BLUE);
        return new Pane(box);
    }

    @Override
    public void start(Stage stage) throws Exception{
        stage.setTitle("Trens sincronizados");

        stage.setScene(new Scene(createContent(), 1000, 640));

        stage.show();
    }

    public static void main(String[] args) {
        launch(args);
    }
}


/*
* Circle circle = new Circle();
  circle.setFill(Color.AQUAMARINE);
  circle.setRadius(30);
  circle.setLayoutX(50);
  circle.setLayoutY(50);

  TranslateTransition transition = new TranslateTransition();
  transition.setDuration(Duration.seconds(3));
  transition.setToX(500);
  transition.setToY(500);
  transition.setAutoReverse(true);
  transition.setCycleCount(Animation.INDEFINITE);
  transition.setNode(circle);
  transition.play();

  Pane root = new Pane();
  root.getChildren().add(circle);
  Scene scene = new Scene(root, 600,600);
*/