package com.mercadoapp.mercado_app.models;

import jakarta.persistence.*;
import lombok.Data;

@Data
@Entity
@Table(name = "CLIENTE")
public class Cliente {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Column(unique = true, nullable = false)
    private String cpfClient;

    @Column(nullable = false)
    private String nomeClient;

    private String nacionalidade;

    private Integer idadeClient;
}
