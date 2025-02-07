package com.mercadoapp.mercado_app.repositories;

import com.mercadoapp.mercado_app.models.Compra;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface CompraRepository extends JpaRepository<Compra, Long> {
}
