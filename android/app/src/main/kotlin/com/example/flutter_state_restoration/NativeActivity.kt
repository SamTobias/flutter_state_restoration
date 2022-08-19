package com.example.flutter_state_restoration

import android.content.Intent
import android.os.Bundle
import android.util.Log
import androidx.activity.ComponentActivity
import androidx.activity.compose.setContent
import androidx.compose.foundation.layout.Arrangement
import androidx.compose.foundation.layout.Column
import androidx.compose.foundation.layout.fillMaxSize
import androidx.compose.material.MaterialTheme
import androidx.compose.material.OutlinedButton
import androidx.compose.material.Surface
import androidx.compose.material.Text
import androidx.compose.runtime.Composable
import androidx.compose.ui.Alignment
import androidx.compose.ui.Modifier
import androidx.compose.ui.tooling.preview.Preview

class NativeActivity : ComponentActivity() {
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContent {
            MaterialTheme {
                // A surface container using the 'background' color from the theme
                Surface(
                    modifier = Modifier.fillMaxSize(),
                    color = MaterialTheme.colors.background
                ) {
                    ActivitySelection(
                        onSimpleButtonClick = {
                            startActivity(
                                Intent(
                                    this,
                                    DefaultActivity::class.java
                                )
                            )
                        },
                        onInstanceStateButtonClick = {
                            startActivity(
                                Intent(
                                    this,
                                    InstanceStateActivity::class.java
                                )
                            )
                        },
                        onViewModelButtonClick = {
                            startActivity(
                                Intent(
                                    this,
                                    ViewModelActivity::class.java
                                )
                            )
                        },
                        onSavedStateClick = {
                            startActivity(
                                Intent(
                                    this,
                                    SavedStateActivity::class.java
                                )
                            )
                        }
                    )
                }
            }
        }
    }

    override fun onRestoreInstanceState(savedInstanceState: Bundle) {
        super.onRestoreInstanceState(savedInstanceState)
        Log.i("StateRestoration", "MainActivity onRestoreInstanceState")
        Log.i("StateRestoration", savedInstanceState.toString())
    }

    override fun onStart() {
        super.onStart()
        Log.i("StateRestoration", "MainActivity onStart")
    }

    override fun onRestart() {
        super.onRestart()
        Log.i("StateRestoration", "MainActivity onRestart")
    }

    override fun onResume() {
        super.onResume()
        Log.i("StateRestoration", "MainActivity onResume")
    }

    override fun onSaveInstanceState(outState: Bundle) {
        super.onSaveInstanceState(outState)
        Log.i("StateRestoration", "MainActivity onSaveInstanceState")
        Log.i("StateRestoration", outState.toString())
    }

    override fun onPause() {
        Log.i("StateRestoration", "MainActivity onPause")
        super.onPause()
    }

    override fun onStop() {
        Log.i("StateRestoration", "MainActivity onStop")
        super.onStop()
    }

    override fun onDestroy() {
        Log.i("StateRestoration", "MainActivity onDestroy")
        super.onDestroy()
    }
}

@Composable
fun ActivitySelection(
    onSimpleButtonClick: () -> Unit,
    onInstanceStateButtonClick: () -> Unit,
    onViewModelButtonClick: () -> Unit,
    onSavedStateClick: () -> Unit
) {
    Column(
        verticalArrangement = Arrangement.Center,
        horizontalAlignment = Alignment.CenterHorizontally
    ) {
        Text("Select an activity:")
        OutlinedButton(onClick = onSimpleButtonClick) {
            Text("Default")
        }
        OutlinedButton(onClick = onInstanceStateButtonClick) {
            Text("RestoreInstanceState")
        }
        OutlinedButton(onClick = onViewModelButtonClick) {
            Text("ViewModel")
        }
        OutlinedButton(onClick = onSavedStateClick) {
            Text("ViewModel+SavedState")
        }
    }
}

@Preview(showBackground = true)
@Composable
fun DefaultPreview() {
    MaterialTheme {
        ActivitySelection(
            onSimpleButtonClick = {  },
            onInstanceStateButtonClick = {  },
            onViewModelButtonClick = {  },
            onSavedStateClick = {  })
    }
}