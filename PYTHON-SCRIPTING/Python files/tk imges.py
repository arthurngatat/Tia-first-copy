from tkinter import *
from tkinter import ttk
root = Tk()
label1 = ttk.Label(root, text ='Hello, Tkinter!')
label1.pack()
label1.config(foreground = 'red', background = 'yellow', font = "courier, 16")
logo = PhotoImage(file = 'C:\\Users\\User\\Desktop\\Python\\tour_logo.gif')
label1.config(image = logo)
label1.config(image = logo)

# this to display the text
label1.config(compound = 'text')
# this will display the text in the center of the image
label1.config(compound = 'center')
# this will display the text at the right of the image
label1.config(compound = 'left')

# this cofiguration will store the image into tk.
label1.img = logo
label1.config(image = label1.img)
 
