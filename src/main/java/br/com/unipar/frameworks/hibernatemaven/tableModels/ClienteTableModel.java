/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package br.com.unipar.frameworks.hibernatemaven.tableModels;

import br.com.unipar.frameworks.model.Cliente;
import java.util.List;
import javax.swing.JTable;
import javax.swing.table.DefaultTableModel;

/**
 *
 * @author Juliane
 */
public class ClienteTableModel extends DefaultTableModel {

    public ClienteTableModel() {
        this.addColumn("ID");
        this.addColumn("NOME");
        this.addColumn("CPF");
    }

    public ClienteTableModel(List<Cliente> listClientes) {
        this();
        for (Cliente c : listClientes) {
            this.addRow(new String[]{c.getId_cliente().toString(), c.getNome(), c.getCpf()});
        }
    }

    public Cliente getSelectedCliente(JTable table, List<Cliente> clientes) {
        int rowIndex = table.getSelectedRow();
        if (rowIndex < 0) {
            return null;
        }
        Object idObj = table.getValueAt(rowIndex, 0);
        Long id = Long.valueOf(idObj.toString());
        for (Cliente c : clientes) {
            if (c.getId_cliente().equals(id)) {
                return c;
            }
        }
        return null;
    }
}
