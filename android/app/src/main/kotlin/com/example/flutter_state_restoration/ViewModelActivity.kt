package com.example.flutter_state_restoration

import android.os.Bundle
import android.util.Log
import android.widget.TextView
import androidx.activity.viewModels
import androidx.appcompat.app.AppCompatActivity
import br.com.samueltobias.staterestoration.DefaultViewModel
import com.google.android.material.floatingactionbutton.FloatingActionButton

class ViewModelActivity : AppCompatActivity() {

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        Log.i("StateRestoration", "ViewModelActivity onRestoreInstanceState")
        setContentView(R.layout.simple_layout)

        val model: DefaultViewModel by viewModels()

        val button = findViewById<FloatingActionButton>(R.id.button)
        val textView = findViewById<TextView>(R.id.textView2)
        textView.text = model.count.toString();

        button.setOnClickListener {
            model.count++
            textView.text = model.count.toString()
        }
    }

    override fun onRestoreInstanceState(savedInstanceState: Bundle) {
        super.onRestoreInstanceState(savedInstanceState)
        Log.i("StateRestoration", "ViewModelActivity onRestoreInstanceState")
        Log.i("StateRestoration", savedInstanceState.toString())
    }

    override fun onStart() {
        super.onStart()
        Log.i("StateRestoration", "ViewModelActivity onStart")
    }

    override fun onRestart() {
        super.onRestart()
        Log.i("StateRestoration", "ViewModelActivity onRestart")
    }

    override fun onResume() {
        super.onResume()
        Log.i("StateRestoration", "ViewModelActivity onResume")
    }

    override fun onSaveInstanceState(outState: Bundle) {
        super.onSaveInstanceState(outState)
        Log.i("StateRestoration", "ViewModelActivity onSaveInstanceState")
        Log.i("StateRestoration", outState.toString())
    }

    override fun onPause() {
        Log.i("StateRestoration", "ViewModelActivity onPause")
        super.onPause()
    }

    override fun onStop() {
        Log.i("StateRestoration", "ViewModelActivity onStop")
        super.onStop()
    }

    override fun onDestroy() {
        Log.i("StateRestoration", "ViewModelActivity onDestroy")
        super.onDestroy()
    }
}