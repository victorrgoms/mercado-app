package com.mercadoapp.mercado_app.repositories;

import com.mercadoapp.mercado_app.models.Produto;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface ProdutoRepository extends JpaRepository<Produto, Long> {
}
