package main;

import javafx.application.Application;
import javafx.scene.Parent;
import javafx.scene.Scene;
import javafx.scene.layout.Pane;
import javafx.stage.Stage;
import main.models.CaminhoRetangular;
import main.models.Ponto;
import main.models.Trilho;

import java.util.ArrayList;
import java.util.Arrays;

public class Main extends Application {

    public static void main(String[] args) {
        launch(args);
    }

    private Parent criaMundo() {
        var origem = new Ponto(140, 250);
        Integer lado = 190;

        var trilho1 = new Trilho(origem.menos(0, lado), lado, 90);
        var trilho2 = new Trilho(origem, lado, 0);
        var trilho3 = new Trilho(origem.mais(lado, 0), lado, -90);
        var trilho4 = new Trilho(origem.mais(lado, 0).menos(0, lado), lado, 180);
        var trilho5 = new Trilho(origem.mais(2 * lado, 0), lado, -90);
        var trilho6 = new Trilho(origem.mais(2 * lado, 0).menos(0, lado), lado, 180);
        var trilho7 = new Trilho(origem.mais(lado, 0), lado, 0);
        var trilho8 = new Trilho(origem.mais(2 * lado, 0).mais(0, lado), lado, -90);
        var trilho9 = new Trilho(origem.mais(2 * lado, 0).mais(0, lado), 2*lado, 180);
        var trilho10 = new Trilho(origem.mais(0, lado), lado, -90);

        var conjunto1 = new ArrayList<Trilho>(Arrays.asList(
                trilho1, trilho2, trilho3, trilho4
        ));
        var conjunto2 = new ArrayList<Trilho>(Arrays.asList(
                trilho3, trilho7, trilho5, trilho6
        ));
        var conjunto3 = new ArrayList<Trilho>(Arrays.asList(
                trilho10, trilho4, trilho6, trilho8, trilho9
        ));

        var pista1 = new CaminhoRetangular(conjunto1);
        var pista2 = new CaminhoRetangular(conjunto2);
        var pista3 = new CaminhoRetangular(conjunto3);

        Pane mundo = new Pane();
        mundo.getChildren().addAll(
                pista1.getDesenho(),
                pista2.getDesenho(),
                pista3.getDesenho()
        );

        return mundo;
    }

    @Override
    public void start(Stage stage) throws Exception {
        stage.setTitle("Trens sincronizados");

        stage.setScene(new Scene(criaMundo(), 700, 600));


        stage.show();
    }
}
