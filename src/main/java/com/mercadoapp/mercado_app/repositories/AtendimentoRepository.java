package com.mercadoapp.mercado_app.repositories;

import com.mercadoapp.mercado_app.models.Atendimento;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface AtendimentoRepository extends JpaRepository<Atendimento, Long> {
}