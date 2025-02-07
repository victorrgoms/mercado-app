package com.mercadoapp.mercado_app.controllers;

import com.mercadoapp.mercado_app.models.Mercado;
import com.mercadoapp.mercado_app.services.MercadoService;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.Optional;

@RestController
@RequestMapping("/mercados")
public class MercadoController {
    private final MercadoService mercadoService;

    public MercadoController(MercadoService mercadoService) {
        this.mercadoService = mercadoService;
    }

    @GetMapping
    public List<Mercado> listarTodos() {
        return mercadoService.listarTodos();
    }

    @GetMapping("/{id}")
    public Optional<Mercado> buscarPorId(@PathVariable Long id) {
        return mercadoService.buscarPorId(id);
    }

    @PostMapping
    public Mercado salvar(@RequestBody Mercado mercado) {
        return mercadoService.salvar(mercado);
    }

    @DeleteMapping("/{id}")
    public void deletar(@PathVariable Long id) {
        mercadoService.deletar(id);
    }
}
