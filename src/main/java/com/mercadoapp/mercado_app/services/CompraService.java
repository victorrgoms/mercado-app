package com.mercadoapp.mercado_app.services;

import com.mercadoapp.mercado_app.models.Compra;
import com.mercadoapp.mercado_app.repositories.CompraRepository;
import org.springframework.stereotype.Service;
import java.util.List;
import java.util.Optional;

@Service
public class CompraService {
    private final CompraRepository compraRepository;

    public CompraService(CompraRepository compraRepository) {
        this.compraRepository = compraRepository;
    }

    public List<Compra> listarTodas() {
        return compraRepository.findAll();
    }

    public Optional<Compra> buscarPorId(Long id) {
        return compraRepository.findById(id);
    }

    public Compra salvar(Compra compra) {
        return compraRepository.save(compra);
    }

    public void deletar(Long id) {
        compraRepository.deleteById(id);
    }
}
