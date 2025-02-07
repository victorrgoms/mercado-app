package com.mercadoapp.mercado_app.repositories;

import com.mercadoapp.mercado_app.models.Mercado;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface MercadoRepository extends JpaRepository<Mercado, Long> {
}
