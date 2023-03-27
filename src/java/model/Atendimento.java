/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import java.io.Serializable;
import java.util.ArrayList;
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
import model.Usuario;

@Entity
@Table(name = "atendimento")

/**
 *
 * @author adriano
 */
public class Atendimento implements Serializable {
    @Id
    @GeneratedValue (strategy = GenerationType.IDENTITY)
    private int id;
    @Column
    private String nomepaciente;
    @Column
    private String email;
    @Column
    private String data;
    @Column
    private String codigo;
    @Column
    private String observacoes;
    @Column
    private String diagnostico;
    @Column
    private String situacao;
    @ManyToOne
    @JoinColumn(name = "usuario_id")
    private Usuario usuario;

    public String getSituacao() {
        return situacao;
    }

    public void setSituacao(String situacao) {
        this.situacao = situacao;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getNomepaciente() {
        return nomepaciente;
    }

    public void setNomepaciente(String nomepaciente) {
        this.nomepaciente = nomepaciente;
    }

    public String getData() {
        return data;
    }

    public void setData(String data) {
        this.data = data;
    }

    public String getCodigo() {
        return codigo;
    }

    public void setCodigo(String codigo) {
        this.codigo = codigo;
    }

    public String getObservacoes() {
        return observacoes;
    }

    public void setObservacoes(String observacoes) {
        this.observacoes = observacoes;
    }

    public String getDiagnostico() {
        return diagnostico;
    }

    public void setDiagnostico(String diagnostico) {
        this.diagnostico = diagnostico;
    }

    public Usuario getUsuario() {
        return usuario;
    }

    public void setUsuario(Usuario usuario) {
        this.usuario = usuario;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }
    
    public static Atendimento getById(int id){
        EntityManager em = Connection.openConnection();
        Atendimento atendimento = em.createQuery("SELECT a FROM Atendimento a WHERE a.id = :id", Atendimento.class).setParameter("id", id).getSingleResult();
        Connection.closeConnection(em);
        
        return atendimento;
    }
    
    public static List<Atendimento> listAll(){
        EntityManager em = Connection.openConnection();
        List<Atendimento> list = em.createQuery("SELECT a FROM Atendimento a", Atendimento.class).getResultList();
        Connection.closeConnection(em);
        
        return list;
    }
    
    public static List<Atendimento> listAllUser(Usuario user){
        EntityManager em = Connection.openConnection();
        List<Atendimento> list = em.createQuery("SELECT a FROM Atendimento a", Atendimento.class).getResultList();
        List<Atendimento> atendimentos = new ArrayList<Atendimento>();
       
        for(int i = 0; i < list.size(); i++){
            if(list.get(i).getUsuario().getId() == user.getId()){
                atendimentos.add(list.get(i));
            }
        }
        Connection.closeConnection(em);
        
        return atendimentos;
    }
    
    public void create(){
        EntityManager em = Connection.openConnection();
        em.persist(this);
        Connection.closeConnection(em);
    }
    
    public static void delete(int id){
        EntityManager em = Connection.openConnection();
        int atendimento = em.createQuery("DELETE FROM Atendimento a WHERE a.id = :id", Atendimento.class).setParameter("id", id).executeUpdate();
        Connection.closeConnection(em);
    }
    
    public static void editar(String nomepaciente, String data, String codigo, String observacoes, String diagnostico, String situacao, String email, int id){
        EntityManager em = Connection.openConnection();
        int atendimento = em.createQuery("UPDATE Atendimento a SET a.nomepaciente = :nomepaciente, a.data = :codigo, a.codigo = :descricao, a.observacoes, a.diagnostico = :diagnostico, a.situacao = :situacao, a.email = :email WHERE a.id = :id", Atendimento.class).setParameter("nomepaciente", nomepaciente).setParameter("data", data).setParameter("codigo", codigo).setParameter("observacoes", observacoes).setParameter("diagnostico", diagnostico).setParameter("situacao", situacao).setParameter("email", email).setParameter("id", id).executeUpdate();
        Connection.closeConnection(em);
    }
}
