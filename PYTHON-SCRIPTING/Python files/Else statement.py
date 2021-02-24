name = input("Enter your name: ")
print("Hello " + name +"!" )
print("Hope all is well. ")

# Ask for temperature outside and use if statement.
# We are going to use float here because the temperation might a float number
# if we do not use floot and the temperature is a floot number, we might have unexpected result.

temperature = float(input("What is the temperature outside " + name + "?:"))
if temperature > 70:
    print("Wear shorts ")
    print("Enjoy your day " + name + "!")
else:
    print("Wear long pants " + name + "!")
    print("Get some exercises outside.")
bye = input("Bye bye " + name + "!")
# this program will not fail if we put float numbers such as 7.3 or 65.8
