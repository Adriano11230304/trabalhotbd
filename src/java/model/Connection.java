/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;

/**
 *
 * @author ppgant
 */
public class Connection {
    private static final EntityManagerFactory entityManagerFactory = Persistence.createEntityManagerFactory("trabalhotdb1PU");
    public static EntityManager openConnection(){
         EntityManager em = entityManagerFactory.createEntityManager();
         em.getTransaction().begin();
         return em;
    }
    
    public static void closeConnection(EntityManager em){
         em.getTransaction().commit();
    }
    
}
