package br.com.samueltobias.staterestoration

import android.util.Log
import androidx.lifecycle.ViewModel

class DefaultViewModel : ViewModel() {
    var count = 0

    override fun onCleared() {
        Log.i("StateRestoration", "DefaultViewModel onCleared")
        super.onCleared()
    }
}