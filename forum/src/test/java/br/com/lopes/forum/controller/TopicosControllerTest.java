package br.com.lopes.forum.controller;

import br.com.lopes.forum.controller.form.AtualizacaoTopicoForm;
import br.com.lopes.forum.model.Topico;
import br.com.lopes.forum.repository.CursoRepository;
import br.com.lopes.forum.repository.TopicoRepository;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import java.util.List;
import java.util.Optional;

import static org.junit.jupiter.api.Assertions.*;

@SpringBootTest
class TopicosControllerTest {

    @Autowired
    CursoRepository cursoRepository;
    @Autowired
    TopicoRepository topicoRepository;

    final long TOPICO_ID_UM = 1L;
    private List<Topico> topicos;

    @BeforeEach
    void init()  {
        topicos = topicoRepository.findAll();
    }


    @Test
    @DisplayName("Deve Listar todos os topicos")
    void lista() {
        assertNotNull(topicos);
        assertEquals(3, topicos.size());
    }

    @Test
    @DisplayName("Deve Atualizar o Titulo do topico")
    void atualiza() {
        Optional<Topico> topico = topicoRepository.findById(TOPICO_ID_UM);
        Topico novoTopico = new Topico();
        AtualizacaoTopicoForm form = atualizaForm();
        if (topico.isPresent()) {
            novoTopico = form.atualizar(TOPICO_ID_UM, topicoRepository);
        }
        assertNotNull(topico);
        assertEquals("Novo Titulo", novoTopico.getTitulo());
    }

    @Test
    @DisplayName("Deve retornar topico de ID 1")
    void detalhar() {
        Optional<Topico> topico = topicoRepository.findById(TOPICO_ID_UM);
        assertNotNull(topico);
        assertEquals("Novo Titulo", topico.get().getTitulo());
    }

    private AtualizacaoTopicoForm atualizaForm() {
        AtualizacaoTopicoForm form = new AtualizacaoTopicoForm();
        form.setTitulo("Novo Titulo");
        form.setMensagem("Mensagem atualizada");
        return form;
    }
}