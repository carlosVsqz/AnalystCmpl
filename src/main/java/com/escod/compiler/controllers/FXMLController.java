package com.escod.compiler.controllers;

import com.escod.compiler.cup.Syntax;
import com.escod.compiler.jflex.LexerCup;
import java_cup.runtime.Symbol;
import javafx.fxml.Initializable;
import javafx.scene.control.Button;
import javafx.scene.control.Label;
import javafx.scene.control.TextArea;
import javafx.scene.input.KeyEvent;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import java.io.StringReader;
import java.net.URL;
import java.util.ArrayList;
import java.util.ResourceBundle;

public class FXMLController implements Initializable {

    public Label lblInfo;
    public Button btnAction;
    public Label lblResult;
    public Label lblHead;
    public TextArea txtA;
    ResourceBundle resourceBundle;

    Logger logger = LoggerFactory.getLogger(FXMLController.class);
    Syntax syntax;

    @Override
    public void initialize(URL url, ResourceBundle rb) {
        resourceBundle = rb;
        btnAction.setOnAction(actionEvent -> getResult(this.txtA.getText()));
    }

    private void getResult(String string) {
        logger.info(string);
        syntax = new Syntax(new LexerCup(new StringReader(string)));
        try {
            syntax.parse();
            lblResult.setText("Analisis realizado correctamente :'");
        } catch (Exception e) {
            Symbol sym = syntax.getS();
            lblResult.setText("Error de sintaxis. Linea: "
                    + (sym.right + 1)
                    + " Columna: "
                    + (sym.left + 1)
                    + ", Texto: \""
                    + sym.value + "\""
            );
            logger.error(e.getMessage());
        }
    }

    public void actionKeyPressed(KeyEvent event) {
        if (event != null)
            event.consume();

//        logger.info(event.getText());
//        assert event != null;
//        this.getResult(event.getText());
//        result.add(event.getText());
//        logger.info(String.valueOf(result));
//        this.getResult(result.toString());
//        getResult();
//        logger.info("Cadena valida");
//        lblResult.setText("Cadena valida :v ");
    }
}
