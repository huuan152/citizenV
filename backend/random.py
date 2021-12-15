import json

file = open('data.json')
obj = json.loads(file.read())
print(obj)
file.close()
t = 0
for i in obj['surname']:
    t += i['rate']
print(t)

# print(obj)