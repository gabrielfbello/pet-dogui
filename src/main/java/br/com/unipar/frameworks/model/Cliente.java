package br.com.unipar.frameworks.model;

import java.util.ArrayList;
import java.util.List;
import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;

@Entity
public class Cliente {
    
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Long id_cliente;
    
    @Column(length = 120)
    private String nome;
    
    @Column(unique = true)
    private String cpf;
    
    private String email;
    private Boolean ativo = true;
    
    @OneToMany(mappedBy = "cliente", cascade = CascadeType.ALL, 
            orphanRemoval = true)
    private List<Endereco> enderecos = new ArrayList<>();
    
     @OneToMany(mappedBy = "cliente", cascade = CascadeType.ALL, 
            orphanRemoval = true)
    private List<Pet> pets = new ArrayList<>();

    public Cliente() { }
    
    public Cliente(String nome, String cpf, String email, Boolean ativo) {
        this.nome = nome;
        this.cpf = cpf;
        this.email = email;
        this.ativo = ativo;
    }

    public Long getId_cliente() {
        return id_cliente;
    }

    public void setId_cliente(Long idCliente) {
        this.id_cliente = idCliente;
    }

    public String getNome() {
        return nome;
    }

    public void setNome(String nome) {
        this.nome = nome;
    }

    public String getCpf() {
        return cpf;
    }

    public void setCpf(String cpf) {
        this.cpf = cpf;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public Boolean getAtivo() {
        return ativo;
    }

    public void setAtivo(Boolean ativo) {
        this.ativo = ativo;
    }

    public List<Endereco> getEnderecos() {
        return enderecos;
    }

    public void setEnderecos(List<Endereco> enderecos) {
        this.enderecos = enderecos;
    }

    public List<Pet> getPets() {
        return pets;
    }

    public void setPets(List<Pet> pets) {
        this.pets = pets;
    }

    @Override
    public String toString() {
        return "Cliente{" + "idCliente=" + id_cliente +
                ", nome=" + nome + 
                ", cpf=" + cpf + 
                ", email=" + email + 
                ", ativo=" + ativo + 
                ", enderecos=" + enderecos + 
                ", pets=" + pets + '}';
    }
    
    
    
    
}
