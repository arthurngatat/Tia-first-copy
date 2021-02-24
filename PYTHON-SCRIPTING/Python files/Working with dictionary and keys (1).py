
# coding: utf-8

# In[48]:


# key equal student
student = {'name': 'Jhon',  'age': 25, 'courses': ['Math', 'CompSci']}


# In[49]:


print(student)


# In[50]:


print(student['courses'])


# In[51]:


# this means print the student age if it exist otherwise print not found
print(student.get('courses', 'Not found'))


# In[52]:


print(student['age'])


# In[53]:


# this means print the student age if it exist otherwise print not found
print(student.get('age', 'Not found'))


# In[54]:


print(student.get('name'))


# In[55]:


# this means print the student age if it exist otherwise print not found
print(student.get('name', 'Not found'))


# In[56]:


# if we use this, it will return none  instead of a nd error
print(student.get('phone')) 


# In[57]:


# we change it to wath we want sa such as not found or no exist
print(student.get('phone', 'Not found'))


# In[58]:


print(student.get('phone', 'Student phone number do not exist'))


# In[59]:


student['phone'] = '832 897 8633'


# In[60]:


print(student['phone'])


# In[61]:


print(student)


# In[62]:


print(student.get('address', 'Not found'))


# In[63]:


student['address'] = '10645 Beechnut St Apt 1017, Houston Tx 77072'


# In[64]:


print(student.get('address', 'Not found'))


# In[65]:


print(student)


# In[66]:


print(student.get('email', 'Not found'))


# In[67]:


student['email'] = 'leonardtia@gemail.com'


# In[68]:


print(student['email'])


# In[69]:


print(student)


# In[70]:


# we can update a student name if the name exist already
student['name'] = 'Leonard Lucas'


# In[71]:


print(student['name'])


# In[72]:


print(student)


# In[73]:


# how can we update multiple things at the same time? we use update
student.update({'name': 'Lucas Djo', 'age': 26, 'courses': 'EDUC 1300, ENGL 1301, Mathematics, Histry', 'ID': '208714557'})


# In[74]:


print(student)


# In[75]:


print(student['courses'])


# In[76]:


# How to deltte a key
del student['courses']


# In[77]:


print(student)


# In[78]:


# How to print the number of keys in the dictionary?
print(len(student))


# In[79]:


# How po all the keys in the dictionary?
print(student.keys())


# In[80]:


# how to print only the values of the keys?
print(student.values())


# In[81]:


print(student.items())


# In[82]:


# Another method to print student keys is:
for key in student:
    print(key)


# In[83]:


# we want keys plus values
for key, value in student.items():
    print(key, value)

