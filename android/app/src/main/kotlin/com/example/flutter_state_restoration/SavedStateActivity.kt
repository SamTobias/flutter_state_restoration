package com.example.flutter_state_restoration

import android.os.Bundle
import android.util.Log
import android.widget.TextView
import androidx.activity.viewModels
import androidx.appcompat.app.AppCompatActivity
import com.google.android.material.floatingactionbutton.FloatingActionButton

class SavedStateActivity : AppCompatActivity() {

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        Log.i("StateRestoration", "SavedStateActivity onRestoreInstanceState")
        setContentView(R.layout.simple_layout)

        val model: SavedStateViewModel by viewModels()

        val button = findViewById<FloatingActionButton>(R.id.button)
        val textView = findViewById<TextView>(R.id.textView2)
        textView.text = model.count.toString();

        button.setOnClickListener {
            model.count++
            textView.text = model.count.toString()
        }
    }

    override fun onRestart() {
        super.onRestart()
        Log.i("StateRestoration", "SavedStateActivity onRestart")
    }

    override fun onStart() {
        super.onStart()
        Log.i("StateRestoration", "SavedStateActivity onStart")
    }

    override fun onRestoreInstanceState(savedInstanceState: Bundle) {
        super.onRestoreInstanceState(savedInstanceState)
        Log.i("StateRestoration", "SavedStateActivity onRestoreInstanceState")
        Log.i("StateRestoration", savedInstanceState.toString())
    }

    override fun onResume() {
        super.onResume()
        Log.i("StateRestoration", "SavedStateActivity onResume")
    }


    override fun onPause() {
        Log.i("StateRestoration", "SavedStateActivity onPause")
        super.onPause()
    }

    override fun onStop() {
        Log.i("StateRestoration", "SavedStateActivity onStop")
        super.onStop()
    }

    override fun onSaveInstanceState(outState: Bundle) {
        super.onSaveInstanceState(outState)
        Log.i("StateRestoration", "SavedStateActivity onSaveInstanceState")
        Log.i("StateRestoration", outState.toString())
    }

    override fun onDestroy() {
        Log.i("StateRestoration", "SavedStateActivity onDestroy")
        super.onDestroy()
    }
}