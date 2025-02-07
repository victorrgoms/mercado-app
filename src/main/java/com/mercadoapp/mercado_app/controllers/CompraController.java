package com.mercadoapp.mercado_app.controllers;

import com.mercadoapp.mercado_app.models.Compra;
import com.mercadoapp.mercado_app.services.CompraService;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.Optional;

@RestController
@RequestMapping("/compras")
public class CompraController {
    private final CompraService compraService;

    public CompraController(CompraService compraService) {
        this.compraService = compraService;
    }

    @GetMapping
    public List<Compra> listarTodas() {
        return compraService.listarTodas();
    }

    @GetMapping("/{id}")
    public Optional<Compra> buscarPorId(@PathVariable Long id) {
        return compraService.buscarPorId(id);
    }

    @PostMapping
    public Compra salvar(@RequestBody Compra compra) {
        return compraService.salvar(compra);
    }

    @DeleteMapping("/{id}")
    public void deletar(@PathVariable Long id) {
        compraService.deletar(id);
    }
}
