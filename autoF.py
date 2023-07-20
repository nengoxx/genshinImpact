from random import randint
from time import sleep
import pyautogui
import keyboard
from pynput import mouse
import tkinter
from win32gui import GetWindowText, GetForegroundWindow
import time

#
pyautogui.PAUSE = 0
pyautogui.FAILSAFE = False
pyautogui.MINIMUM_SLEEP = 0
pyautogui.MINIMUM_DURATION = 0

pressed_f = False
BarSpam = False
LeftSpam = False
label = None
windowName = "Genshin Impact"


def toggleF(kb_event_info):
    global pressed_f
    pressed_f = not pressed_f
    showText()

def stopF(kb_event_info):
    global pressed_f
    pressed_f = False
    showText()
    
def toggleBarOn(kb_event_info):
    global BarSpam
    BarSpam = True
    
def toggleBarOff(kb_event_info):
    global BarSpam
    BarSpam = False

def toggleLeftClick(kb_event_info):
    global LeftSpam
    LeftSpam = not LeftSpam
    showText('autoC')

def on_click(x, y, button, pressed):
    if pressed:
        if (button == mouse.Button.x1):
            toggleF(None)
            return
        elif (button == mouse.Button.x2):
            toggleLeftClick(None)
            return
        else:
            return

def showText(itext = 'autoF'):
    global pressed_f
    global LeftSpam
    global label
    label = tkinter.Label(text=itext, font=(None, '12', 'bold'), fg='white', bg='black')
    if (get_active_window() & (pressed_f == True or LeftSpam == True)):
        label.master.overrideredirect(True)
        #label.master.geometry("+5+5")
        label.master.lift()
        label.master.wm_attributes("-topmost", True)
        label.master.wm_attributes("-disabled", True)
        label.master.wm_attributes("-transparentcolor", "black")
        label.pack()
        label.update()
    else:
        try:
            label.destroy()
            label.master.destroy()
            label.master = None
            label = None
        except:
            label = None
            return



def get_active_window():
    return (GetWindowText(GetForegroundWindow()) == windowName)


def main():
    global pressed_f
    global BarSpam
    if __name__== "__main__" :
        keyboard.on_press_key('º',toggleF)
        #keyboard.on_press_key('tab',toggleF)
        keyboard.on_press_key('enter',stopF)
        keyboard.on_press_key('l',stopF)
        keyboard.on_press_key('ctrl',toggleBarOn)
        keyboard.on_release_key('ctrl',toggleBarOff)
        listener = mouse.Listener(on_click=on_click)
        listener.start()
        while True:
            pyautogui.sleep(randint(150, 300)/1000)
            while (get_active_window()):
                if BarSpam:
                    pyautogui.press("Space")
                    pyautogui.sleep(randint(300, 600)/1000)
                    continue
                if LeftSpam:
                    pyautogui.click()
                    pyautogui.sleep(randint(150, 300)/1000)
                    continue
                if pressed_f:
                    pyautogui.press("f")
                pyautogui.sleep(randint(150, 250)/1000)
                    #time.sleep(randint(10, 400)/1000)


main()
#