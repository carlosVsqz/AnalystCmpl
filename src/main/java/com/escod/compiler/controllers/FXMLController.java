package com.escod.compiler.controllers;

import com.escod.compiler.flex.Lexer;
import com.escod.compiler.utils.Tokens;
import javafx.event.ActionEvent;
import javafx.fxml.Initializable;
import javafx.scene.control.Button;
import javafx.scene.control.Label;
import javafx.scene.control.TextField;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import java.io.IOException;
import java.io.StringReader;
import java.net.URL;
import java.util.ResourceBundle;

public class FXMLController implements Initializable {

    public Label lblInfo;
    public Button btnAction;
    public Label lblResult;
    public Label lblHead;
    public TextField txtA;
    private ResourceBundle resourceBundle;

    Logger logger = LoggerFactory.getLogger(FXMLController.class);

    @Override
    public void initialize(URL url, ResourceBundle rb) {
        this.resourceBundle = rb;
        btnAction.setOnAction(this::getResult);
    }

    private void getResult(ActionEvent event) {

        if (event != null)
            event.consume();

        try {
            analyzeLex(this.txtA.getText());
        } catch (IOException e) {
            e.printStackTrace();
        }

    }

    private void analyzeLex(String expr) throws IOException {
        int cont = 1;
        Lexer lexer = new Lexer(new StringReader(expr));
        StringBuilder resulted = new StringBuilder("LINEA " + cont + "\t\tSIMBOLO\n");
        while (true) {
            Tokens token = lexer.yylex();
            if (token == null) {
                lblResult.setText(resulted.toString());
                return;
            }
            switch (token) {
                case AND:
                    cont++;
                    resulted.append("LINEA ").append(cont).append("\n");
                    break;
                case OR:
                    resulted.append("  <Comillas>\t\t").append(lexer.lexeme).append("\n");
                    break;
                case NOT:
                case Parentesis_abierto:
                    resulted.append("  <Tipo de dato>\t").append(lexer.lexeme).append("\n");
                    break;
                case Parentesis_cerrado:
                    resulted.append("  <Reservada if>\t").append(lexer.lexeme).append("\n");
                    break;
                default:
                    resulted.append("  < ").append(lexer.lexeme).append(" >\n");
                    break;
            }
        }
    }
}
