package br.com.fiap.orgs.ui.activity

import android.app.Activity
import android.os.Bundle
import android.os.PersistableBundle
import android.widget.TextView
import android.widget.Toast
import androidx.appcompat.app.AppCompatActivity
import androidx.recyclerview.widget.LinearLayoutManager
import androidx.recyclerview.widget.RecyclerView
import br.com.fiap.orgs.R
import br.com.fiap.orgs.R.id.descricao
import br.com.fiap.orgs.R.id.valor
import br.com.fiap.orgs.model.Produto
import br.com.fiap.orgs.ui.adapter.ListaProdutosAdapter
import java.math.BigDecimal

class MainActivity : AppCompatActivity(R.layout.activity_main) {
    override fun onCreate(savedInstanceState: Bundle?, persistentState: PersistableBundle?) {
        super.onCreate(savedInstanceState, persistentState)
        //Toast.makeText(this, "Bem vindo(a) ao Orgs!", Toast.LENGTH_SHORT).show()
        val nome = findViewById<TextView>(R.id.nome)
        nome.text = "Cesta de frutas"
        val descricao = findViewById<TextView>(descricao)
        descricao.text = "Laranja, manga e maçã"
        val valor = findViewById<TextView>(R.id.valor)
        valor.text = "19.99"

        val recyclerView = findViewById<RecyclerView>(R.id.recyclerView)
        recyclerView.adapter = ListaProdutosAdapter(
            context = this, produtos = listOf(
                Produto(
                    nome = "teste",
                    descricao = "teste desc",
                    valor = BigDecimal("19.99")
                ),
                Produto(
                    nome = "teste 1",
                    descricao = "teste desc 1",
                    valor = BigDecimal("29.99")
                ),
                Produto(
                    nome = "teste 2",
                    descricao = "teste desc 2",
                    valor = BigDecimal("39.99")
                ),
                Produto(
                    nome = "teste 3",
                    descricao = "teste desc 3",
                    valor = BigDecimal("49.99")
                ),
            )
        )

       // recyclerView.layoutManager = LinearLayoutManager(this)
    }
}