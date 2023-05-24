package com.example.open_screen_kt

import android.content.Intent
import android.content.pm.PackageInfo
import android.widget.TextView
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodChannel



class MainActivity: FlutterActivity() {
    companion object{
        const val DATA = "DATA"
    }

    private val CHANNEL = "com.example.app/open"


    @Suppress("DEPRECATION")
    override fun configureFlutterEngine(flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)

        MethodChannel(flutterEngine.dartExecutor.binaryMessenger, CHANNEL).setMethodCallHandler {
                call, result ->
            if(call.method.equals("open")){
                val data = call.arguments as String
                navigateTo(data)
            }else{
                result.notImplemented()
            }
        }
    }

    private fun navigateTo(data:String) {
        val intent = Intent(this, screen::class.java)
        intent.putExtra(DATA, data)
        startActivity(intent)
    }
}
