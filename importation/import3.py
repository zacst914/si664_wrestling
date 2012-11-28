###	File:		UMich Men's Wrestling Importation Script				###
###	Version:	v1.3													###
###	Author: 	Tony Chun (based on Chad Kijewski and David/Daniel Ross	###
###	Updated:	11/26/2012												###

import mysql.connector
import datetime
import string

# First, connect to the database.
# Note: user, password and port fields will need to be changed based on your MAMP/XAMPP setup.
cnx = mysql.connector.connect(user='root', password='root', host='127.0.0.1', port=8889, database='mwrestling', use_unicode=False, buffered=True, get_warnings=True)

# Then, set the cursor variable.
cur = cnx.cursor()

# Initialize dictionaries for each database field.
dict_names = ['lastname', 'firstname', 'uniqname', 'week', 'bout', 'opponent', 'opponentteam', 'weightclass', 'firsttakedown', 'firsttakedownopp', 'takedowns', 'takedownsopp', 'twopointnf', 'twopointnfopp', 'threepointnf', 'threepointnfopp', 'pin', 'pinsopp', 'escapes', 'escapesopp', 'reversals', 'reversalsopp', 'win', 'overtime', 'decision', 'decisionopp', 'majordecision', 'majordecisionopp', 'technicalfallnf', 'technicalfallnonf', 'technicalfallnfopp', 'technicalfallnonfopp', 'forfeit', 'forfeitopp', 'injurydefault', 'injurydefaultopp', 'stallwarning', 'stallwarningopp', 'stallpoints', 'stallpointsopp', 'caution', 'cautionopp', 'cautionpoints', 'cautionpointsopp', 'thirdperiodwin', 'neutralattacks', 'timesattacked', 'attacksstopped', 'stoppoints', 'firstbackcenter', 'legattack', 'legattackfinish', 'edgefinish', 'latetdrecovery', 'latetdheld', 'latetdrecoveryopp', 'latetdheldopp', 'teampointsdual', 'teampointstourn', 'ridingtime', 'ridingtimept', 'ridingtimeopp', 'ridingtimeptopp', 'dual', 'tournament']

dicts = {}
for d in dict_names:
	dicts[d] = {}
	
# Oh, and a couple of lists.
idlist = []
classlist = ['125 lbs', '133 lbs', '141 lbs', '149 lbs', '157 lbs', '165 lbs', '174 lbs', '184 lbs', '197 lbs', '285 lbs']

usercount = 0
classcount = 0
boutcount = 0

# Open the data source file.
fhand = open('wdata.csv', 'rb')

# Parse the source file and populate each dictionary with its appropriate information.
for line in fhand:

	# Split each line into fields.
	try:
#(LASTNAME,FIRSTNAME,UNIQNAME,WEEK,BOUT,OPPONENT,OPPONENTTEAM,WEIGHTCLASS,FIRSTTAKEDOWN,FIRSTTAKEDOWNOPP,TAKEDOWNS,TAKEDOWNSOPP,TWOPOINTNF,TWOPOINTNFOPP,THREEPOINTNF,THREEPOINTNFOPP,PIN,PINSOPP,ESCAPES,ESCAPESOPP,REVERSALS,REVERSALSOPP,WIN,DECISION,DECISIONOPP,MAJORDECISION,MAJORDECISIONOPP,TECHNICALFALLNF,TECHNICALFALLNONF,TECHNICALFALLNFOPP,TECHNICALFALLNONFOPP,FORFEIT,FORFEITOPP,INJURYDEFAULT,INJURYDEFAULTOPP,STALLWARNING,STALLWARNINGOPP,STALLPOINTS,STALLPOINTSOPP,CAUTION,CAUTIONOPP,CAUTIONPOINTS,CAUTIONPOINTSOPP,THIRDPERIODWIN,NEUTRALATTACKS,TIMESATTACKED,ATTACKSSTOPPED,STOPPOINTS,FIRSTBACKCENTER,LEGATTACK,LEGATTACKFINISH,EDGEFINISH,LATETDRECOVERY,LATETDHELD,LATETDRECOVERYOPP,LATETDHELDOPP,TEAMPOINTSDUAL,TEAMPOINTSTOURN,RIDINGTIME,RIDINGTIMEPT,RIDINGTIMEOPP,RIDINGTIMEPTOPP,DUAL,TOURNAMENT)
		stuff = line.split(',')
	
	# Skip the line if it doesn't contain all fields (i.e. blank lines).
	except:	continue
	
	# Skip the line if it is the header line
	if 'LastName' in stuff[0]: continue
	
	# Initialize the 'id' variable to keep track of dictionary entries.
	id = stuff[2] + " " + stuff[3] + "-" + stuff[4]

	# Add the 'id' variable to a list to iterate through later on
	idlist.append(id)

	# Check for blank or empty values; if found, set to null so SQL accepts it.
	for x in range(0,len(stuff)-1):
		if stuff[x] == ' ': stuff[x] = 'null'

	if stuff[-1] != '1' and stuff[-1] != '0': stuff[-1] = 'null'
	
	stuff[5] = string.replace(stuff[5], ' ', ', ')
	
	# Populate each dictionary with its respective field.
	i = 0
	for d in dict_names:
		dicts[d][id] = stuff[i]
		i+=1
		
select = "SELECT * FROM class WHERE `id` = 2"
cur.execute(select)
data = cur.fetchone()

try:

	# Again, try to iterate the returned value; if this succeeds it's a tuple and the weight-class table is populated.
	# If it fails, it's a NoneType.  Go to the below 'except'.
	for entry in data: continue

except:

	# Add an entry for the season to database.  This should only fire off once a year in the fall.
	for entry in classlist:
		addition = "INSERT INTO class (`class`) VALUES ('" + entry + "')"
		print addition
		cur.execute(addition)
		cnx.commit()
		print "New weight class added: " + entry	

# Check for each individual wrestler in the database and add or update his information.
for id, value in sorted(dicts['uniqname'].iteritems(), key=lambda (k,v): (v,k), reverse=True):

	# Identify his current weight class identification number.
	if int(dicts['weightclass'][id]) <= 125: wclass = 1
	elif int(dicts['weightclass'][id]) <= 133: wclass = 2
	elif int(dicts['weightclass'][id]) <= 141: wclass = 3
	elif int(dicts['weightclass'][id]) <= 149: wclass = 4
	elif int(dicts['weightclass'][id]) <= 157: wclass = 5
	elif int(dicts['weightclass'][id]) <= 165: wclass = 6
	elif int(dicts['weightclass'][id]) <= 174: wclass = 7
	elif int(dicts['weightclass'][id]) <= 184: wclass = 8
	elif int(dicts['weightclass'][id]) <= 197: wclass = 9
	else: wclass = 10
	
	# Try to select his information from the 'user' table.
	select = "SELECT * FROM user WHERE uniqname = '" + value + "'"
	cur.execute(select)
	
	# Fetch the result of this query and set it to a variable to be analyzed.
	data = cur.fetchone()
	
	try:
	
		# Try to iterate the returned value; if this succeeds it's a tuple and the wrestler already has an entry.
		# If it fails, it's a NoneType.  Go to the below 'except'.
		for entry in data: continue
		
		# The wrestler already has an entry; compare the wrestler's current weight class with his previously recorded one.
		if wclass == data[1]: continue
		
		# If the weight class is different, update it!
		else:
			update = "UPDATE user SET class_id = " + str(wclass) + " WHERE username = '" + value + "'"
			cur.execute(update)
			cnx.commit()
			#print "Weight class updated for user  '" + value + "'!"
			classcount+=1
			
	except:
	
		# Add the wrestler's information to the 'user' table and assign a default password.
		addition = "INSERT INTO user (firstname, lastname, uniqname, password, email, class_id) VALUES ('" + dicts['firstname'][id] + "', '" + dicts['lastname'][id] + "', '" + value + "', 'PASSw0rd123', '" + value + "@umich.edu', " + str(wclass) + ")"
		cur.execute(addition)
		cnx.commit()
		#print "User " + value + " added to database!"
		usercount+=1

# Set a variable for the current time and determine what season it is.
now = datetime.datetime.now()

# Identify what wrestling season this is based on when this data is being imported.
if int(now.month) >= 8 and int(now.month) <= 12: season = str(now.year) + "-" + str((int(now.year) + 1))
elif int(now.month) >= 1 and int(now.month) <= 7: season = str(int(now.year) - 1) + "-" + str(now.year)

# Try to select the season id number from the 'season' table.

select = "SELECT id FROM season WHERE `season` = '" + season + "'"
cur.execute(select)
data = cur.fetchone()

try:

	# Again, try to iterate the returned value; if this succeeds it's a tuple and a value exists for the season.
	# If it fails, it's a NoneType.  Go to the below 'except'.
	for entry in data: continue
	
	# If all goes well, store its identification number for later use.
	season_id = str(data[0])

except:

	# Add an entry for the season to database.  This should only fire off once a year in the fall.
	addition = "INSERT INTO season (`season`) VALUES ('" + season + "')"
	#print addition
	cur.execute(addition)
	cnx.commit()
	
	# Now store its identification number for later use.
	select = "SELECT id FROM season WHERE `season` = '" + season + "'"
	cur.execute(select)
	data = cur.fetchone()
	season_id = str(data[0])
	#print "New season added: " + season
	
# Import the bout information into the 'bout' table and assign it to the appropriate wrestler
for id in idlist:
	
	# First, find out if this data has already been entered.
	cur.execute("SELECT id FROM bout WHERE bout_id = '" + id + " " + season  + "'")
	data = cur.fetchone()
	
	try:

		# Again, try to iterate the returned value; if this succeeds it's a tuple and this bout has already been recorded.
		# If it fails, it's a NoneType.  Go to the below 'except'.
		for entry in data: continue
		#print "Entry exists!"
	

	except:
	
		# Select the user identification number from the user table.
		cur.execute("SELECT id FROM user WHERE uniqname = '" + dicts['uniqname'][id] + "'")
		data = cur.fetchone()
		
		# Set it to a variable for later importation.
		user_id = str(data[0])
		
		# And here's the SQL insert line NOT from hell.
		#bout_add = 'INSERT INTO bout (user_id, season_id, week, bout, bout_id, %s) VALUES (%s)' % (', '.join(map(str,dict_names[5:])), ', '.join([user_id, season_id, dicts['week'][id], dicts['bout'][id], id + " " + season]+[dicts[x][id] for x in dict_names[5:]]))
		bout_add = 'INSERT INTO bout (user_id, season_id, week, bout, bout_id, opponent, opponentteam, weightclass, firsttakedown, firsttakedownopp, takedowns, takedownsopp, twopointnf, twopointnfopp, threepointnf, threepointnfopp, pin, pinsopp, escapes, escapesopp, reversals, reversalsopp, win, overtime, decision, decisionopp, majordecision, majordecisionopp, technicalfallnf, technicalfallnonf, technicalfallnfopp, technicalfallnonfopp, forfeit, forfeitopp, injurydefault, injurydefaultopp, stallwarning, stallwarningopp, stallpoints, stallpointsopp, caution, cautionopp, cautionpoints, cautionpointsopp, thirdperiodwin, neutralattacks, timesattacked, attacksstopped, stoppoints, firstbackcenter, legattack, legattackfinish, edgefinish, latetdrecovery, latetdheld, latetdrecoveryopp, latetdheldopp, teampointsdual, teampointstourn, ridingtime, ridingtimept, ridingtimeopp, ridingtimeptopp, `dual`, tournament) VALUES (%s, %s, %s, %s, "%s", "%s", "%s", %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s)' % (user_id, season_id, dicts['week'][id], dicts['bout'][id], id + " " + season, dicts['opponent'][id], dicts['opponentteam'][id], dicts['weightclass'][id], dicts['firsttakedown'][id], dicts['firsttakedownopp'][id], dicts['takedowns'][id], dicts['takedownsopp'][id], dicts['twopointnf'][id], dicts['twopointnfopp'][id], dicts['threepointnf'][id], dicts['threepointnfopp'][id], dicts['pin'][id], dicts['pinsopp'][id], dicts['escapes'][id], dicts['escapesopp'][id], dicts['reversals'][id], dicts['reversalsopp'][id], dicts['win'][id], dicts['overtime'][id], dicts['decision'][id], dicts['decisionopp'][id], dicts['majordecision'][id], dicts['majordecisionopp'][id], dicts['technicalfallnf'][id], dicts['technicalfallnonf'][id], dicts['technicalfallnfopp'][id], dicts['technicalfallnonfopp'][id], dicts['forfeit'][id], dicts['forfeitopp'][id], dicts['injurydefault'][id], dicts['injurydefaultopp'][id], dicts['stallwarning'][id], dicts['stallwarningopp'][id], dicts['stallpoints'][id], dicts['stallpointsopp'][id], dicts['caution'][id], dicts['cautionopp'][id], dicts['cautionpoints'][id], dicts['cautionpointsopp'][id], dicts['thirdperiodwin'][id], dicts['neutralattacks'][id], dicts['timesattacked'][id], dicts['attacksstopped'][id], dicts['stoppoints'][id], dicts['firstbackcenter'][id], dicts['legattack'][id], dicts['legattackfinish'][id], dicts['edgefinish'][id], dicts['latetdrecovery'][id], dicts['latetdheld'][id], dicts['latetdrecoveryopp'][id], dicts['latetdheldopp'][id], dicts['teampointsdual'][id], dicts['teampointstourn'][id], dicts['ridingtime'][id], dicts['ridingtimept'][id], dicts['ridingtimeopp'][id], dicts['ridingtimeptopp'][id], dicts['dual'][id], dicts['tournament'][id])
		cur.execute(bout_add)
		cnx.commit()
		#print "Entry added!"
		boutcount+=1
		
	# Close both the cursor and database connection.
cur.close()
cnx.close()

print '<b><font size="6">Upload Successful!</font></b><p>'
print '<table>'
print '<tr><td><b>New Users:</b></td><td>'+ str(usercount) + '</td></tr>'
print '<tr><td><b>Users Updated:</b></td><td>' + str(classcount) + '</td></tr>'
print '<tr><td><b>Bouts Added:</b></td><td>' + str(boutcount) + '</td></tr></table><br>'
