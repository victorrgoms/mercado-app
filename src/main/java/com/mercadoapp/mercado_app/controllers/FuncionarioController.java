package com.mercadoapp.mercado_app.controllers;

import com.mercadoapp.mercado_app.models.Funcionario;
import com.mercadoapp.mercado_app.services.FuncionarioService;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.Optional;

@RestController
@RequestMapping("/funcionarios")
public class FuncionarioController {
    private final FuncionarioService funcionarioService;

    public FuncionarioController(FuncionarioService funcionarioService) {
        this.funcionarioService = funcionarioService;
    }

    @GetMapping
    public List<Funcionario> listarTodos() {
        return funcionarioService.listarTodos();
    }

    @GetMapping("/{id}")
    public Optional<Funcionario> buscarPorId(@PathVariable Long id) {
        return funcionarioService.buscarPorId(id);
    }

    @PostMapping
    public Funcionario salvar(@RequestBody Funcionario funcionario) {
        return funcionarioService.salvar(funcionario);
    }

    @DeleteMapping("/{id}")
    public void deletar(@PathVariable Long id) {
        funcionarioService.deletar(id);
    }
}
