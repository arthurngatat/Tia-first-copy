# \n at the begining means skip the first line.
# \t\t\t\t means print the title at the right of the screen.

print("\n\t\t\t\tMutiplication Table\n")

'''
# this for loop will print 1-12  vertically.
for i in range(1,13):
    print(i)
'''

# this for loop will print 1-12  horizontally.
# the \t here is the space between characters.
for i in range(1,13):
    print(i, end = "\t")
print()
# this is to print line.
print("__________________________________________________________________________________________\n")
# the last print("\n") is to indet each line.
for j in range(1,13):
    for k in range(1,13):
        print(j*k, end = "\t")
    print("\n")   

call = input("")
