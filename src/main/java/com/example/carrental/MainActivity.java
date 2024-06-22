package com.example.carrental;

import android.os.Bundle;
import android.view.View;
import android.widget.EditText;
import android.widget.TextView;

import androidx.appcompat.app.AppCompatActivity;

public class MainActivity extends AppCompatActivity {

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);
    }
    public void onButton(View v)
    {
        TextView tx=findViewById(R.id.textFinal);
        EditText editText1=findViewById(R.id.editTextFirst);
        EditText editText2=findViewById(R.id.editTextLast);
        EditText editText3=findViewById(R.id.editTextEmail);
        tx.setText("First name: "+editText1.getText().toString()+"\nLast name: "+editText2.getText().toString()+"\nEmail: "+editText3.getText().toString());
    }
}