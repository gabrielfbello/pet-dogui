package br.com.unipar.frameworks.hibernatemaven;

import br.com.unipar.frameworks.model.Cidade;
import br.com.unipar.frameworks.model.Cliente;
import br.com.unipar.frameworks.model.Endereco;
import br.com.unipar.frameworks.model.dao.CidadeDAO;
import br.com.unipar.frameworks.model.dao.ClienteDAO;
import br.com.unipar.frameworks.model.util.EntityManagerUtil;
import br.com.unipar.frameworks.model.util.PetDoguiLog;
import java.util.logging.LogManager;
import java.util.logging.Logger;

public class HibernateMaven {
  
    public static void main(String[] args) {
//        EntityManagerUtil.getEntityManagerFactory();
        try {
            new ClienteDAO().save(new Cliente());
        } catch (Exception e) {
            PetDoguiLog.erroPersistencia(e);
        }
        PetDoguiLog.infoGeral("TESTE LOG");
    }
}
