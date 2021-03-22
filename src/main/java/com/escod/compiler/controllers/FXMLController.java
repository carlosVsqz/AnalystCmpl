package com.escod.compiler.controllers;

import javafx.event.ActionEvent;
import javafx.fxml.Initializable;
import javafx.scene.control.Button;
import javafx.scene.control.Label;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import java.net.URL;
import java.util.ResourceBundle;

public class FXMLController implements Initializable {

    public Label lblInfo;
    public Button btnAction;
    public Label lblResult;
    public Label lblHead;
    private ResourceBundle resourceBundle;

    Logger logger = LoggerFactory.getLogger(FXMLController.class);

    @Override
    public void initialize(URL url, ResourceBundle rb) {
        this.resourceBundle = rb;
        btnAction.setOnAction(this::getResult);
    }

    private void getResult(ActionEvent event) {
        boolean isValid = false;

        if (event != null)
            event.consume();

        if (isValid) {
            logger.info("valid: " + isValid);
            lblResult.setText(resourceBundle.getString("text_valid_string_result"));
        } else {
            logger.info("valid: " + isValid);
            lblResult.setText(resourceBundle.getString("text_invalid_string_resut"));
        }
    }
}
