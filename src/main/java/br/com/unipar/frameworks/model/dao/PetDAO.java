package br.com.unipar.frameworks.model.dao;

import br.com.unipar.frameworks.model.Pet;
import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;
import javax.persistence.TypedQuery;

public class PetDAO extends GenericDAO<Pet> {

    public PetDAO() {
        super(Pet.class);
    }

    public Pet findByNome(String nome) {
        EntityManagerFactory emf = Persistence.createEntityManagerFactory("HibernateMaven");
        EntityManager em = emf.createEntityManager();

        TypedQuery<Pet> query = em.createQuery("SELECT p FROM Pet p WHERE p.nome = :nome", Pet.class);
        query.setParameter("nome", nome);

        Pet pet = null;
        try {
            pet = query.getSingleResult();
        } catch (Exception e) {
            System.out.println("Erro ao buscar pet por nome: " + e.getMessage());
        } finally {
            em.close();
        }
        return pet;
    }
}
