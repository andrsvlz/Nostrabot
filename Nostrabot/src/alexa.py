# -*- coding: utf-8 -*- 
import subprocess
from flask import Flask, render_template
from flask_ask import Ask, statement, question
app = Flask(__name__)
ask = Ask(app, '/')
cmd='./opt/alexa/ssh.sh'
cmd2='./opt/alexa/ssh2.sh'
cmd3='./opt/alexa/ssh3.sh'
cmd4='./opt/alexa/ssh4.sh'
cmd5='./opt/alexa/ssh5.sh'
cmd6='./opt/alexa/ssh6.sh'
cmd7='./opt/alexa/ssh7.sh'


@ask.launch

def launch():
     return question('Claro, estoy para servirte')

   
@ask.intent('tareas')
def tareas():
    welcome_text = "gracias, estoy Muy bien, y mucho mas con este publico que nos acompaña"
    return statement(welcome_text)


@ask.intent('linux')
def linux():
    #results=subprocess.Popen(cmd)
    return statement('Enterado, procedo con la lista de verificacion de linux, por favor comprobar la evidencia, la enviare a tu correo electrónico')


@ask.intent('arus')
def arus():
    results=subprocess.Popen(cmd)
    return statement('Enterado, procedo a realizar tareas diarias, por favor comprobar la evidencia en unos minutos, la enviare a tu correo electrónico, e informare al analista via celular.')


@ask.intent('cerrejon')
def hello1():
    results=subprocess.Popen(cmd2)
    return statement('Esta bien, procedo a realizar llamadas de cerrejón')
    

@ask.intent('creacionsitioweb')
def sitioweb():
    results=subprocess.Popen(cmd3)
    return statement('Con todo el gusto, dame unos segundos mientras despliego el sitio, la evidencia te la enviare a tu correo electrónico.')   


@ask.intent('llamar')
def llamar():
    results=subprocess.Popen(cmd6)
    return statement('enterado, procedo a realizar proceso de inventario, dentro de unos minutos le enviare un correo electronico informando el resultado de la solicitud, gracias')



@ask.intent('intranet')
def intranet():
    results=subprocess.Popen(cmd5)
    return statement('enterado, procedo a realizar prueba de acceso a Kiosko,  la evidencia en video la puede encontrar dentro de unos minutos en el repositorio de nostradatos')

@ask.intent('tequiero')
def tequiero():
    return statement('no, tu no me quieres, tu quieres a alexa... hmm...   de sponsor')

@ask.intent('inventario')
def inventario():
    results=subprocess.Popen(cmd6)
    return statement('enterado, procedo a realizar proceso, En unos segundos puedes actualizar la pagina de mosaico donde veras reflejado el inventario del proyecto comfenalco actualizado')



@ask.intent('accioncritica')
def accioncritica():
    results=subprocess.Popen(cmd7)
    return statement('Claro, con gusto procedo a realizar los mantenimientos preventivos')








@ask.session_ended
def session_ended():
    return "{}", 200


if __name__ == '__main__':
    app.run(debug=True)
