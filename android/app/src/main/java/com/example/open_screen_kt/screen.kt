package com.example.open_screen_kt

import android.os.Build
import android.os.Bundle
import android.view.View
import android.widget.TextView
import androidx.appcompat.app.AppCompatActivity
import androidx.appcompat.widget.Toolbar
import com.example.open_screen_kt.MainActivity.Companion.DATA


private lateinit var tvMessage: TextView
private lateinit var toolbar: Toolbar

class screen : AppCompatActivity() {
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_screen)
        val result: String? = intent.extras?.getString(DATA)
        initComponent()
        if (result != null) {
            setMessage(result)
        }

    }
    private fun initComponent() {
        tvMessage = findViewById(R.id.tvMessage)
        toolbar = findViewById(R.id.toolbar)
        toolbar.setNavigationOnClickListener {
            onBackPressed();
        }

    }

    private fun setMessage(data: String){
        tvMessage.text = data
    }


}

