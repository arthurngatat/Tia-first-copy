a = '''                Some examples:                      
       h = 2, w = 70, bmi = 17.5: thin (Less 18.5)
       h = 2, w = 90, bmi = 22.5: healthy (18.6 to 24.9) 
       h = 2.5, w = 160, bmi = 25.6: overweight (25 to 29.9)
       h = 2, w = 160, bmi = 40: obese (more than 30)'''
print(a)

print("Health conditions:")
print("Let check your BMI to find out if you are overweight or not.")
print("first of all, this is the health condition base of BMI result:")
print("If you BMI is less that 18.5, this means you are thin.")
print("If you BMI is beetwen 18.6 and 24.9, this means you are healthy.")
print("If you BMI is beetwen 18.6 and 24.9, this means you are healthy.")
print("If you BMI is beetwen 25 and 29.9, this means you are overweight.")
print("If you BMI is less greater than 30, this means you are obese. \nOk let start.")

name = input("Enter your name: ")
print("Hello " + name +"!" )
hieght = float(input("Enter your height in meter: "))
weight = float(input("Enter your weight in kg: "))
bmi = weight/hieght**2

print("You BMI is: ")
print(bmi)
if bmi < 18.5:
    print("Great " + name + "!" +  " you are thin.")
elif bmi == 18.6 or bmi <= 24.9:
    print("Great " + name + "!" +  " you are healthy.")
elif bmi == 25 or bmi <= 29.9:
    print("We are sorry " + name + "!" +  " you are overweight.")   
else:
    print("We are sorry " + name + ", you are obese.")
raw = input('')
                                           
                                            # Health condition
# h = 2, w = 70, bmi = 17.5: thin           Less 18.5
# h = 2, w = 90, bmi = 22.5: healthy        18.6 to 24.9
# h = 2.5, w = 160, bmi = 25.6: overweight  25 to 29.9
# h = 2, w = 160, bmi = 40: obese            more than 30