/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package sb;

import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import model.Manufacturers;

/**
 *
 * @author quocq
 */
@Stateless
public class ManufacturersFacade extends AbstractFacade<Manufacturers> implements ManufacturersFacadeLocal {

    @PersistenceContext(unitName = "NewEAD_EAR-ejbPU")
    private EntityManager em;

    @Override
    protected EntityManager getEntityManager() {
        return em;
    }

    public ManufacturersFacade() {
        super(Manufacturers.class);
    }
    
}
