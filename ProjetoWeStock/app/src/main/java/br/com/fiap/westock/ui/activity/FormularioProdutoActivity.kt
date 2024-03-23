package br.com.fiap.orgs.ui.activity

import android.os.Bundle
import android.util.Log
import android.view.View
import android.widget.Button
import android.widget.EditText
import androidx.activity.enableEdgeToEdge
import androidx.appcompat.app.AppCompatActivity
import androidx.core.view.ViewCompat
import androidx.core.view.WindowInsetsCompat
import br.com.fiap.orgs.R
import com.google.android.filament.View

class FormularioProdutoActivity : AppCompatActivity(R.layout.activity_formulario_produto) {
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        enableEdgeToEdge()
        ViewCompat.setOnApplyWindowInsetsListener(findViewById(R.id.main)) { v, insets ->
            val systemBars = insets.getInsets(WindowInsetsCompat.Type.systemBars())
            v.setPadding(systemBars.left, systemBars.top, systemBars.right, systemBars.bottom)
            insets

            val campoNome = findViewById<EditText>(R.id.nome)
            val nome = campoNome.text.toString()
            nome
            Log.i("FormularioProduto", msg:"onCreate: $nome")
            val botaoSalvar = findViewById<Button>(R.id.botao_salvar)
            botaoSalvar.setOnClickListener(object :  : View.OnclickListener {
                override fun onclick(v: View?) {
                    val campoNome = findViewById<EditText>(R.id.nome)
                    val nome = campoNome.text.toString()
                    Log.i("FormularioProduto", "onCreate: $nome")
                }
            })

        }
    }
}