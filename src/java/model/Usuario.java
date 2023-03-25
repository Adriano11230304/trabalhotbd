package model;

/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */

import java.io.Serializable;
import java.util.List;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.EntityManager;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import model.Connection;
import model.Atendimento;

/**
 *
 * @author ppgant
 */
@Entity
@Table(name = "usuario")
public class Usuario implements Serializable {
    @Id
    @GeneratedValue (strategy = GenerationType.IDENTITY)
    private int id;
    @Column
    private String nome;
    @Column
    private String senha;
    @Column
    private String codigo;
    @Column
    private String email;
    @ManyToOne
    @JoinColumn(name = "setor_id")
    private Setor setor;
    @OneToMany
    private List<Atendimento> atendimentos;

    public Setor getSetor() {
        return setor;
    }

    public List<Atendimento> getAtendimentos() {
        return atendimentos;
    }

    public void setAtendimentos(List<Atendimento> atendimentos) {
        this.atendimentos = atendimentos;
    }

    public void setSetor(Setor setor) {
        this.setor = setor;
    }
    
    
    

    public int getId() {
        return id;
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

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getCodigo() {
        return codigo;
    }

    public void setCodigo(String codigo) {
        this.codigo = codigo;
    }

    public String getSenha() {
        return senha;
    }

    public void setSenha(String senha) {
        this.senha = senha;
    }
    
    public static Usuario getUser(String email, String senha){
        EntityManager em = Connection.openConnection();
        Usuario user = em.createQuery("SELECT u FROM Usuario u WHERE u.email = :email and u.senha = :senha", Usuario.class).setParameter("email", email).setParameter("senha", senha).getSingleResult();
        
        return user;
    }
    
    public void create(){
        
        EntityManager em = Connection.openConnection();
        em.persist(this);
        Connection.closeConnection(em);
    }
    
    public static List<Usuario> listAll(){
        
        EntityManager em = Connection.openConnection();
        List<Usuario> list = em.createQuery("SELECT u FROM Usuario u", Usuario.class).getResultList();
        
        return list;
    }
    
    public static Usuario getById(int id){
        EntityManager em = Connection.openConnection();
        Usuario usuario = em.createQuery("SELECT u FROM Usuario u WHERE u.id = :id", Usuario.class).setParameter("id", id).getSingleResult();
        Connection.closeConnection(em);
        
        return usuario;
    }
    
    public static void delete(int id){
        EntityManager em = Connection.openConnection();
        int usuario = em.createQuery("DELETE FROM Usuario u WHERE u.id = :id", Usuario.class).setParameter("id", id).executeUpdate();
        Connection.closeConnection(em);
    }
    
}
