import keyboard
import time

isOnOrNot = False

def manageKeyboard():
    global isOnOrNot
    print("isOnOrNot",isOnOrNot)
    isOnOrNot = not isOnOrNot
    print("isOnOrNot",isOnOrNot)

keyboard.add_hotkey('ctrl+a', manageKeyboard, args=())

while(True):
    time.sleep(1)
    if(isOnOrNot==True):
        keyboard.write('The quick brown fox jumps over the lazy dog.\n')




