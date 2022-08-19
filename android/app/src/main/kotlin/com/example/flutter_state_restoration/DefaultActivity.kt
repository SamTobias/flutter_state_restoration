package com.example.flutter_state_restoration

import android.os.Bundle
import android.util.Log
import android.widget.TextView
import androidx.appcompat.app.AppCompatActivity
import com.google.android.material.floatingactionbutton.FloatingActionButton

class DefaultActivity : AppCompatActivity() {
    var count = 0

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        Log.i("StateRestoration", "SimpleActivity onRestoreInstanceState")
        setContentView(R.layout.simple_layout)

        val button = findViewById<FloatingActionButton>(R.id.button)
        val textView = findViewById<TextView>(R.id.textView2)

        button.setOnClickListener {
            count++
            textView.text = count.toString()
        }
    }

    override fun onRestoreInstanceState(savedInstanceState: Bundle) {
        super.onRestoreInstanceState(savedInstanceState)
        Log.i("StateRestoration", "SimpleActivity onRestoreInstanceState")
        Log.i("StateRestoration", savedInstanceState.toString())
    }

    override fun onStart() {
        super.onStart()
        Log.i("StateRestoration", "SimpleActivity onStart")
    }

    override fun onRestart() {
        super.onRestart()
        Log.i("StateRestoration", "SimpleActivity onRestart")
    }

    override fun onResume() {
        super.onResume()
        Log.i("StateRestoration", "SimpleActivity onResume")
    }

    override fun onSaveInstanceState(outState: Bundle) {
        super.onSaveInstanceState(outState)
        Log.i("StateRestoration", "SimpleActivity onSaveInstanceState")
        Log.i("StateRestoration", outState.toString())
    }

    override fun onPause() {
        Log.i("StateRestoration", "SimpleActivity onPause")
        super.onPause()
    }

    override fun onStop() {
        Log.i("StateRestoration", "SimpleActivity onStop")
        super.onStop()
    }

    override fun onDestroy() {
        Log.i("StateRestoration", "SimpleActivity onDestroy")
        super.onDestroy()
    }
}