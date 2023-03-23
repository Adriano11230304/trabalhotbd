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
    
    public List<Atendimento> listAll(){
        Connection con = new Connection();
        EntityManager em = con.openConnection();
        List<Atendimento> list = em.createQuery("SELECT a FROM Atendimento a", Atendimento.class).getResultList();
        
        return list;
    }
}
