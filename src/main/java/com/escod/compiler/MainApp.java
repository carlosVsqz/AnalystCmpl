package com.escod.compiler;

import javafx.application.Application;
import javafx.fxml.FXMLLoader;
import javafx.scene.Parent;
import javafx.scene.Scene;
import javafx.stage.Stage;

import java.util.Locale;
import java.util.ResourceBundle;


public class MainApp extends Application {

    @Override
    public void start(Stage stage) throws Exception {
        ResourceBundle resources = ResourceBundle.getBundle("values", Locale.getDefault());
        Parent root = FXMLLoader.load(getClass().getResource("/fxml/scene.fxml"), resources);
        Scene scene = new Scene(root, 500, 300);
        scene.getStylesheets().add(getClass().getResource("/styles/style.css").toExternalForm());
        stage.setTitle("JavaFX and Gradle");
        stage.setScene(scene);
        stage.setResizable(false);
        stage.show();
    }

    public static void main(String[] args) {
        launch(args);
    }

}
