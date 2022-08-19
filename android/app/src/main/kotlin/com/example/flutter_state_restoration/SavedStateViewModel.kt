package com.example.flutter_state_restoration

import android.util.Log
import androidx.lifecycle.SavedStateHandle
import androidx.lifecycle.ViewModel

class SavedStateViewModel(private val state: SavedStateHandle) : ViewModel() {
    private val countKey = "count"
    var count = 0
        set(value) {
            field = value
            state[countKey] = value
        }

    init {
        state.get<Int>(countKey)?.let {
            count = it
            Log.i("StateRestoration", "SavedStateViewModel restoring state")
        }
    }

    override fun onCleared() {
        Log.i("StateRestoration", "SavedStateViewModel onCleared")
        super.onCleared()
    }
}