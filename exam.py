import pymongo
url="mongodb://localhost:27017/"
c=pymongo.MongoClient(url)
db=c["exam"]
coll=db["student"]
#coll.insert_many([{"_id":1,"Name":"Anjali","Place":"Kollam","Phone":8582639562,"Vaccination_status":"Both vaccinated","RTPCR":"negative","Lab_mark":{"Internal":30,"External":45},"Department":"MCA"},
#{"_id":2,"Name":"Anuradha","Place":"Varkala","Phone":9992639562,"Vaccination_status":"Both vaccinated","RTPCR":"negative","Lab_mark":{"Internal":40,"External":48},"Department":"Civil"},
#{"_id":3,"Name":"Bismiya","Place":"Kollam","Phone":9446639562,"Vaccination_status":"not vaccinated","RTPCR":"positive","Lab_mark":{"Internal":50,"External":39},"Department":"MCA"},
#{"_id":4,"Name":"Vimal","Place":"Ernakulam","Phone":8582639568,"Vaccination_status":"First dose only","RTPCR":"positive","Lab_mark":{"Internal":40,"External":42},"Department":"Civil"},
#{"_id":5,"Name":"Vivek","Place":"Kollam","Phone":8582639777,"Vaccination_status":"Both vaccinated","RTPCR":"negative","Lab_mark":{"Internal":50,"External":50},"Department":"MCA"}])
print("Q.03")
for i in coll.find({"Vaccination_status":"not vaccinated"},{"Name":1,"Phone":1,"_id":0}):
	print(i["Name"]+" "+str(i["Phone"]))
print("Q.04")
for i in coll.find({"Department":"MCA"}).sort("Lab_mark.External",-1).limit(2):
	print(i["Name"]+" "+str(i["Phone"]))
print("Q.05")
for i in coll.find({"Name":{"$regex":'^A'}},{"Name":1,"Department":1,"_id":1}):
	print(str(i["_id"])+" "+i["Name"]+" "+i["Department"])
print("Q.06")
coll.update_one({"_id":4},{"$set":{"Vaccination_status":"NOT vaccinated"}})
print("Updated!!!")

print("Q.07")
for i in coll.find({},{"Name":1}).sort("Lab_mark.External",-1):
	print(i["Name"])
