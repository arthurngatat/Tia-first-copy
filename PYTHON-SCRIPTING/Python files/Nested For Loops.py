# https://www.youtube.com/watch?v=cET7zffKm3s&t=68s&list=PLrafTkhP5sZza
#-dNA8ZmLTZO3GzsKNUrA&index=23
print("\n\t\t\t\tMutiplication Table\n")
# this is endetation
# empty string at the end means we do not want to go to the new line
# %5d means 4 spaces
print("     ", end = "")
for i in range(16):
    print("%4d|"%i, end="")
    
# the horizontal line is underscore.    
print()
print('_____'*17)

for k in range(16):
    print("%4d|"%k, end="")
    
    for j in range(16):
        print("%4d|"%(k*j), end="")
    print()

    
call = input("")
