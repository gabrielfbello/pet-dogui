package br.com.unipar.frameworks.model.dao;

import br.com.unipar.frameworks.model.Pet;

public class PetDAO extends GenericDAO<Pet> {
    
    public PetDAO() { 
        super(Pet.class);
    }
    
}
