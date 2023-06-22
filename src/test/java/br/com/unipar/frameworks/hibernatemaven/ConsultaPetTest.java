/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package br.com.unipar.frameworks.hibernatemaven;

import br.com.unipar.frameworks.model.Agendamento;
import br.com.unipar.frameworks.model.Cliente;
import br.com.unipar.frameworks.model.Pet;
import static br.com.unipar.frameworks.model.Pet.nome;
import jdk.internal.ValueBased;
import jdk.internal.agent.Agent;
import org.junit.Assert;
import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertTrue;
import org.junit.Test;
import org.junit.jupiter.params.provider.ValueSource;
import org.junit.runners.Parameterized;

/**
 *
 * @author Renan
 */
public class ConsultaPetTest {
    
    @Test
    public void testSoma(){
        //Definir os parâmetros de entrada
        int a = 2;
        int b = 3;
        
        //Chamar o método a ser testado
        int resultado = Agendamento.soma(a, b);
        
        //Verificsar o resultado esperado usando asserções
        assertEquals(5, resultado);
    }
    
    //Teste Renan
//    @Test
//    public void verificaEmail(){
//        
//        boolean correto = Cliente.email();
//        
//        String emailValidado = "";
//        emailValidado = Cliente.class(email);
//        
//        String emailValidado = Cliente.email();
//        assertTrue(email);
//    }
    
    //Teste Renan
//    @Test
//    public void verificaSeNomePetAtivoSemValor(){
//        //Definir os parâmetros de entrada
//        String a = "";
//        String b = "";
//        
//        //Chamar o método a ser testado
//        Pet pet = new Pet("Jorge", 10, PetStatus.ATIVO);
//        String validaNome = Pet.nome();
//        
//        //Verificsar o resultado esperado usando asserções
//        assertEquals(, validaNome);
//        PetValidador validador = new PetValidador();
//        assertThrows(PetAtivadoSemNomeException.class, () -> validador.validar(pet));
//    }
}