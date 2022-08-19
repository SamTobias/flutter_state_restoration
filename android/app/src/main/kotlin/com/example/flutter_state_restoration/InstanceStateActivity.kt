package com.example.flutter_state_restoration

import android.os.Bundle
import android.util.Log
import android.widget.TextView
import androidx.appcompat.app.AppCompatActivity
import com.google.android.material.floatingactionbutton.FloatingActionButton

class InstanceStateActivity : AppCompatActivity() {
    private val countKey = "count"
    var count = 0

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        Log.i("StateRestoration", "InstanceStateActivity onRestoreInstanceState")
        setContentView(R.layout.simple_layout)

        val button = findViewById<FloatingActionButton>(R.id.button)
        val textView = findViewById<TextView>(R.id.textView2)

        if (savedInstanceState != null) {
            with(savedInstanceState) {
                count = getInt(countKey)
                textView.text = count.toString()
            }
        }

        button.setOnClickListener {
            count++
            textView.text = count.toString()
        }
    }

    override fun onRestart() {
        super.onRestart()
        Log.i("StateRestoration", "InstanceStateActivity onRestart")
    }

    override fun onStart() {
        super.onStart()
        Log.i("StateRestoration", "InstanceStateActivity onStart")
    }

    override fun onRestoreInstanceState(savedInstanceState: Bundle) {
        super.onRestoreInstanceState(savedInstanceState)
        Log.i("StateRestoration", "InstanceStateActivity onRestoreInstanceState")
        Log.i("StateRestoration", savedInstanceState.toString())
    }

    override fun onResume() {
        super.onResume()
        Log.i("StateRestoration", "InstanceStateActivity onResume")
    }

    override fun onPause() {
        Log.i("StateRestoration", "InstanceStateActivity onPause")
        super.onPause()
    }

    override fun onStop() {
        Log.i("StateRestoration", "InstanceStateActivity onStop")
        super.onStop()
    }

    override fun onSaveInstanceState(outState: Bundle) {
        Log.i("StateRestoration", "InstanceStateActivity onSaveInstanceState")
        Log.i("StateRestoration", outState.toString())
        outState.putInt(countKey, count)
        super.onSaveInstanceState(outState)
    }

    override fun onDestroy() {
        Log.i("StateRestoration", "InstanceStateActivity onDestroy")
        super.onDestroy()
    }
}