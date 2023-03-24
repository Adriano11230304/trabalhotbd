/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import java.io.Serializable;
import java.util.List;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.EntityManager;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import model.Connection;
import model.Usuario;

/**
 *
 * @author ppgant
 */
@Entity
@Table(name = "setor")
public class Setor implements Serializable {
    @Id
    @GeneratedValue (strategy = GenerationType.IDENTITY)
    private int id;
    @Column
    private String nome;
    @Column
    private String descricao;
    @Column
    private String codigo;
    @OneToMany
    private List<Usuario> usuarios;

    public List<Usuario> getUsuarios() {
        return usuarios;
    }

    public void setUsuarios(List<Usuario> usuarios) {
        this.usuarios = usuarios;
    }

    public int getId() {
        return id;
    }

    public String getDescricao() {
        return descricao;
    }

    public void setDescricao(String descricao) {
        this.descricao = descricao;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getNome() {
        return nome;
    }

    public void setNome(String nome) {
        this.nome = nome;
    }

    public String getCodigo() {
        return codigo;
    }

    public void setCodigo(String codigo) {
        this.codigo = codigo;
    }
    
    public static List<Setor> listAll(){
        Connection con = new Connection();
        EntityManager em = con.openConnection();
        List<Setor> list = em.createQuery("SELECT s FROM Setor s", Setor.class).getResultList();
        
        return list;
    }
    
    public static Setor queryName(String nome){
        Connection con = new Connection();
        EntityManager em = con.openConnection();
        Setor s = em.createQuery("SELECT s FROM Setor s WHERE s.nome = :nome", Setor.class).setParameter("nome", nome).getSingleResult();
        
        return s;
    }
    
    public void create(){
        Connection con = new Connection();
        EntityManager em = con.openConnection();
        em.persist(this);
        con.closeConnection(em);
    }
    
    public static void delete(int id){
        EntityManager em = Connection.openConnection();
        int setor = em.createQuery("DELETE FROM Setor s WHERE s.id = :id", Setor.class).setParameter("id", id).executeUpdate();
        Connection.closeConnection(em);
    }
    
    public static Setor getById(int id){
        EntityManager em = Connection.openConnection();
        Setor setor = em.createQuery("SELECT s FROM Setor s WHERE s.id = :id", Setor.class).setParameter("id", id).getSingleResult();
        Connection.closeConnection(em);
        
        return setor;
    }
}
