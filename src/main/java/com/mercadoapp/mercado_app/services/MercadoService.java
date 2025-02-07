package com.mercadoapp.mercado_app.services;

import com.mercadoapp.mercado_app.models.Mercado;
import com.mercadoapp.mercado_app.repositories.MercadoRepository;
import org.springframework.stereotype.Service;
import java.util.List;
import java.util.Optional;

@Service
public class MercadoService {
    private final MercadoRepository mercadoRepository;

    public MercadoService(MercadoRepository mercadoRepository) {
        this.mercadoRepository = mercadoRepository;
    }

    public List<Mercado> listarTodos() {
        return mercadoRepository.findAll();
    }

    public Optional<Mercado> buscarPorId(Long id) {
        return mercadoRepository.findById(id);
    }

    public Mercado salvar(Mercado mercado) {
        return mercadoRepository.save(mercado);
    }

    public void deletar(Long id) {
        mercadoRepository.deleteById(id);
    }
}
