# -*- coding: utf-8 -*- 
import subprocess
from flask import Flask, render_template
from flask_ask import Ask, statement, question
app = Flask(__name__)
ask = Ask(app, '/')
cmd='./ssh.sh'
cmd2='./ssh2.sh'
cmd3='./ssh3.sh'


@ask.launch

def launch():
    welcome_text = "Cual es el contrato que requiere ejecutar las rutinas operativas."
    return question(welcome_text)

   

@ask.intent('arus')
def hello():
    results=subprocess.Popen(cmd)
    return statement('Enterado, procedo a realizar respaldos de pruebas')
    
@ask.intent('cerrejon')
def hello1():
    results=subprocess.Popen(cmd2)
    return statement('Esta bien, procedo a realizar llamadas de cerrejón')
    

@ask.intent('creacionsitioweb')
def hello3():
    results=subprocess.Popen(cmd3)
    return statement('Con todo el gusto, dame unos segundos mientras despliego el sitio')   


@ask.intent('salir')
def hello2():
    return statement('fue un placer hasta luego')



@ask.session_ended
def session_ended():
    return "{}", 200


if __name__ == '__main__':
    app.run(debug=True)





