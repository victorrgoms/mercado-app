package com.mercadoapp.mercado_app.repositories;

import com.mercadoapp.mercado_app.models.Cliente;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface ClienteRepository extends JpaRepository<Cliente, Long> {
}
