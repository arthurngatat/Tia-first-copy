
# coding: utf-8

# # Copmarisons
# - Equal: 3 == 2
# - Not equal: 3 != 2
# - Greater than: 3 > 2
# - Less than: 3 < 2
# - Greater or equal: 3 >= 2
# - Less than or equal: 3 <= 2

# In[76]:


a = 3
b = 2


# In[77]:


a == b


# In[78]:


a < b


# In[79]:


a > b


# In[80]:


a <= b


# In[81]:


a >= b


# In[82]:


a != b


# # Copmarisons with if statement

# In[71]:


x = 8
y = 6
if x < y:
    print("True")
    print('x is less than y')
else:
    print("False")


# In[72]:


if x > y:
    print("True")
    print('x is greater than y')
else:
    print("False")


# In[73]:


if x <= y:
    print("True")
    print('x is less or equal y')
else:
    print("False")


# In[74]:


if x != y:
    print("True")
    print('x is not equal to y')
else:
    print("False")


# In[75]:


if x == y:
    print("True")
    print('x is equal to y')
else:
    print("False")


# # Arithmetic operation
# 1. Addition:       3 + 2
# 2. soustraction:   3 - 2
# 3. mutliplcation:  3 * 2
# 4. Division:       3 / 2       
# 5. Floor division: 3 // 2 :(if you do not want the remainder of the division)
# 6. Exponent:       3 ** 2
# 7. Modulor:        3 % 2 :(if you want to know the remainder of 18/4, type 3 % 2)
#     

# In[40]:


print(3+2)
print(3-2)
print(3*2)
print(3/2)
print(3//2)
print(3**2)
print(3%2)


# In[41]:


print(2 % 2)
print(3 % 2)
print(4 % 2)
print(5 % 2)


# In[87]:


print(3 * 2 + 1)
print(3 * (2 + 1))


# In[88]:


# if you do not want the remainder of the division
18//4


# In[89]:


# if you want to know the remainder of 18/4, type 18%4
18 % 4
18%4


# In[90]:


# power calculation, we use double **
5**3


# In[91]:


# python does not really need this
2+(5*5)


# # Variables incrementation
# we can use 2 methots to increment a variable

# In[83]:


num = 1
a = 5
a = a + 1
num += 1
print(a)
print(num)


# In[84]:


b = 8
c = 9
d = 12
b += 3
c -= 3
d /= 2
print(b)
print(c)
print(d)


# # Absolute value and round

# In[85]:


print(abs(-3))
# this means no decimal.
print(round(3.75))
print(round(3.45))
# this means round to the firs digit after the decimal.
print(round(3.75, 1))
print(round(3.75, 10))


# # Casting values from strings to integer

# In[86]:


# this will give us an uninspectif result.
# the second one will give us the right result.
w = '100'
z = '200'
print(w + z)
print(int(w)+int(z))


# ### How to import math elements and use them
# Import math as something that you want to use first

# In[43]:


import math as p


# In[44]:


p.pi


# In[45]:


p.e


# In[46]:


p.factorial(3)


# In[47]:


p.exp(4)


# In[48]:


p.exp(1)


# In[49]:


p.pi*2


# In[50]:


p.log(p.e)


# In[93]:


p.log(1000, 10)


# In[52]:


p.log(10)


# In[53]:


p.log10(100)


# In[54]:


p.log10(1000)


# This 3 to the power of 4 and 3 to the power of 2

# In[55]:


p.pow(3, 4)


# In[56]:


p.pow(3, 2)


# In[57]:


3**4


# In[58]:


3**2


# ### Square root in python

# In[59]:


p.sqrt(81)


# In[60]:


p.sqrt(144)


# ### Trigonometric in Python

# In[61]:


p.sin(p.pi)


# In[62]:


p.degrees(p.pi)


# In[63]:


p.radians(180)

