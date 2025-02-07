package com.mercadoapp.mercado_app.services;

import com.mercadoapp.mercado_app.models.Atendimento;
import com.mercadoapp.mercado_app.repositories.AtendimentoRepository;
import org.springframework.stereotype.Service;
import java.util.List;
import java.util.Optional;

@Service
public class AtendimentoService {
    private final AtendimentoRepository atendimentoRepository;

    public AtendimentoService(AtendimentoRepository atendimentoRepository) {
        this.atendimentoRepository = atendimentoRepository;
    }

    public List<Atendimento> listarTodos() {
        return atendimentoRepository.findAll();
    }

    public Optional<Atendimento> buscarPorId(Long id) {
        return atendimentoRepository.findById(id);
    }

    public Atendimento salvar(Atendimento atendimento) {
        return atendimentoRepository.save(atendimento);
    }

    public void deletar(Long id) {
        atendimentoRepository.deleteById(id);
    }
}
