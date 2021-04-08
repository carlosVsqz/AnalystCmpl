package com.escod.compiler.controllers;

import javafx.fxml.Initializable;
import javafx.scene.control.Button;
import javafx.scene.control.Label;
import javafx.scene.control.TextField;
import javafx.scene.input.KeyEvent;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import java.net.URL;
import java.util.ResourceBundle;

public class FXMLController implements Initializable {

    public Label lblInfo;
    public Button btnAction;
    public Label lblResult;
    public Label lblHead;
    public TextField txtA;

    Logger logger = LoggerFactory.getLogger(FXMLController.class);

    @Override
    public void initialize(URL url, ResourceBundle rb) {
        btnAction.setOnAction(actionEvent -> getResult());
    }

    private void getResult() {

    }

    public void actionKeyPressed(KeyEvent keyEvent) {
        if (keyEvent != null)
            keyEvent.consume();
    }
}
