import mysql.connector
import datetime
import string
import re

# First, connect to the database.
cnx = mysql.connector.connect(user='admin', password='admin', host='localhost', database='mwrestling', use_unicode=False, buffered=True, get_warnings=True)

# Then, set the cursor variable.
cur = cnx.cursor()

# Initialize dictionaries for each database field.
lastname = {}
firstname = {}
uniqname = {}
week = {}
bout = {}
opponent = {}
opponentteam = {}
weightclass = {}
firsttakedown = {}
firsttakedownopp = {}
takedowns = {}
takedownsopp = {}
twopointnf = {}
twopointnfopp = {}
threepointnf = {}
threepointnfopp = {}
pin = {}
pinsopp = {}
escapes = {}
escapesopp = {}
reversals = {}
reversalsopp = {}
win = {}
decision = {}
decisionopp = {}
majordecision = {}
majordecisionopp = {}
technicalfallnf = {}
technicalfallnonf = {}
technicalfallnfopp = {}
technicalfallnonfopp = {}
forfeit = {}
forfeitopp = {}
injurydefault = {}
injurydefaultopp = {}
stallwarning = {}
stallwarningopp = {}
stallpoints = {}
stallpointsopp = {}
caution = {}
cautionopp = {}
cautionpoints = {}
cautionpointsopp = {}
thirdperiodwin = {}
neutralattacks = {}
timesattacked = {}
attacksstopped = {}
stoppoints = {}
firstbackcenter = {}
legattack = {}
legattackfinish = {}
edgefinish = {}
latetdrecovery = {}
latetdheld = {}
latetdrecoveryopp = {}
latetdheldopp = {}
teampointsdual = {}
teampointstourn = {}
ridingtime = {}
ridingtimept = {}
ridingtimeopp = {}
ridingtimeptopp = {}
dual = {}
tournament = {}

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
		(LASTNAME,FIRSTNAME,UNIQNAME,WEEK,BOUT,OPPONENT,OPPONENTTEAM,WEIGHTCLASS,FIRSTTAKEDOWN,FIRSTTAKEDOWNOPP,TAKEDOWNS,TAKEDOWNSOPP,TWOPOINTNF,TWOPOINTNFOPP,THREEPOINTNF,THREEPOINTNFOPP,PIN,PINSOPP,ESCAPES,ESCAPESOPP,REVERSALS,REVERSALSOPP,WIN,DECISION,DECISIONOPP,MAJORDECISION,MAJORDECISIONOPP,TECHNICALFALLNF,TECHNICALFALLNONF,TECHNICALFALLNFOPP,TECHNICALFALLNONFOPP,FORFEIT,FORFEITOPP,INJURYDEFAULT,INJURYDEFAULTOPP,STALLWARNING,STALLWARNINGOPP,STALLPOINTS,STALLPOINTSOPP,CAUTION,CAUTIONOPP,CAUTIONPOINTS,CAUTIONPOINTSOPP,THIRDPERIODWIN,NEUTRALATTACKS,TIMESATTACKED,ATTACKSSTOPPED,STOPPOINTS,FIRSTBACKCENTER,LEGATTACK,LEGATTACKFINISH,EDGEFINISH,LATETDRECOVERY,LATETDHELD,LATETDRECOVERYOPP,LATETDHELDOPP,TEAMPOINTSDUAL,TEAMPOINTSTOURN,RIDINGTIME,RIDINGTIMEPT,RIDINGTIMEOPP,RIDINGTIMEPTOPP,DUAL,TOURNAMENT) = line.split(',')
	
	# Skip the line if it doesn't contain all fields (i.e. blank lines).
	except:	continue
	
	# Skip the line if it is the header line
	if 'LastName' in LASTNAME: continue
	
	# Initialize the 'id' variable to keep track of dictionary entries.
	id = UNIQNAME + " " + WEEK + "-" + BOUT
	
	# Add the 'id' variable to a list to iterate through later on
	idlist.append(id)

	# Check for blank or empty values; if found, set to null so SQL accepts it.
	if LASTNAME == ' ': LASTNAME = 'null'
	if FIRSTNAME == ' ': FIRSTNAME = 'null'
	if UNIQNAME == ' ': UNIQNAME = 'null'
	if WEEK == ' ': WEEK = 'null'
	if BOUT == ' ': BOUT = 'null'
	if OPPONENT == ' ': OPPONENT = 'null'
	if OPPONENTTEAM == ' ': OPPONENTTEAM = 'null'
	if WEIGHTCLASS == ' ': WEIGHTCLASS = 'null'
	if FIRSTTAKEDOWN == ' ': FIRSTTAKEDOWN = 'null'
	if FIRSTTAKEDOWNOPP == ' ': FIRSTTAKEDOWNOPP = 'null'
	if TAKEDOWNS == ' ': TAKEDOWNS = 'null'
	if TAKEDOWNSOPP == ' ': TAKEDOWNSOPP = 'null'
	if TWOPOINTNF == ' ': TWOPOINTNF = 'null'
	if TWOPOINTNFOPP == ' ': TWOPOINTNFOPP = 'null'
	if THREEPOINTNF == ' ': THREEPOINTNF = 'null'
	if THREEPOINTNFOPP == ' ': THREEPOINTNFOPP = 'null'
	if PIN == ' ': PIN = 'null'
	if PINSOPP == ' ': PINSOPP = 'null'
	if ESCAPES == ' ': ESCAPES = 'null'
	if ESCAPESOPP == ' ': ESCAPESOPP = 'null'
	if REVERSALS == ' ': REVERSALS = 'null'
	if REVERSALSOPP == ' ': REVERSALSOPP = 'null'
	if WIN == ' ': WIN = 'null'
	if DECISION == ' ': DECISION = 'null'
	if DECISIONOPP == ' ': DECISIONOPP = 'null'
	if MAJORDECISION == ' ': MAJORDECISION = 'null'
	if MAJORDECISIONOPP == ' ': MAJORDECISIONOPP = 'null'
	if TECHNICALFALLNF == ' ': TECHNICALFALLNF = 'null'
	if TECHNICALFALLNONF == ' ': TECHNICALFALLNONF = 'null'
	if TECHNICALFALLNFOPP == ' ': TECHNICALFALLNFOPP = 'null'
	if TECHNICALFALLNONFOPP == ' ': TECHNICALFALLNONFOPP = 'null'
	if FORFEIT == ' ': FORFEIT = 'null'
	if FORFEITOPP == ' ': FORFEITOPP = 'null'
	if INJURYDEFAULT == ' ': INJURYDEFAULT = 'null'
	if INJURYDEFAULTOPP == ' ': INJURYDEFAULTOPP = 'null'
	if STALLWARNING == ' ': STALLWARNING = 'null'
	if STALLWARNINGOPP == ' ': STALLWARNINGOPP = 'null'
	if STALLPOINTS == ' ': STALLPOINTS = 'null'
	if STALLPOINTSOPP == ' ': STALLPOINTSOPP = 'null'
	if CAUTION == ' ': CAUTION = 'null'
	if CAUTIONOPP == ' ': CAUTIONOPP = 'null'
	if CAUTIONPOINTS == ' ': CAUTIONPOINTS = 'null'
	if CAUTIONPOINTSOPP == ' ': CAUTIONPOINTSOPP = 'null'
	if THIRDPERIODWIN == ' ': THIRDPERIODWIN = 'null'
	if NEUTRALATTACKS == ' ': NEUTRALATTACKS = 'null'
	if TIMESATTACKED == ' ': TIMESATTACKED = 'null'
	if ATTACKSSTOPPED == ' ': ATTACKSSTOPPED = 'null'
	if STOPPOINTS == ' ': STOPPOINTS = 'null'
	if FIRSTBACKCENTER == ' ': FIRSTBACKCENTER = 'null'
	if LEGATTACK == ' ': LEGATTACK = 'null'
	if LEGATTACKFINISH == ' ': LEGATTACKFINISH = 'null'
	if EDGEFINISH == ' ': EDGEFINISH = 'null'
	if LATETDRECOVERY == ' ': LATETDRECOVERY = 'null'
	if LATETDHELD == ' ': LATETDHELD = 'null'
	if LATETDRECOVERYOPP == ' ': LATETDRECOVERYOPP = 'null'
	if LATETDHELDOPP == ' ': LATETDHELDOPP = 'null'
	if TEAMPOINTSDUAL == ' ': TEAMPOINTSDUAL = 'null'
	if TEAMPOINTSTOURN == ' ': TEAMPOINTSTOURN = 'null'
	if RIDINGTIME == ' ': RIDINGTIME = 'null'
	if RIDINGTIMEPT == ' ': RIDINGTIMEPT = 'null'
	if RIDINGTIMEOPP == ' ': RIDINGTIMEOPP = 'null'
	if RIDINGTIMEPTOPP == ' ': RIDINGTIMEPTOPP = 'null'
	if DUAL == ' ': DUAL = 'null'
	TOURNAMENT = re.sub("\s+", "", TOURNAMENT)
	if TOURNAMENT != '1' and TOURNAMENT != '0': TOURNAMENT = 'null'
	
	OPPONENT = string.replace(OPPONENT, ' ', ', ')
	
	# Populate each dictionary with its respective field.
	lastname[id] = LASTNAME
	firstname[id] = FIRSTNAME
	uniqname[id] = UNIQNAME
	week[id] = WEEK
	bout[id] = BOUT
	opponent[id] = OPPONENT
	opponentteam[id] = OPPONENTTEAM
	weightclass[id] = WEIGHTCLASS
	firsttakedown[id] = FIRSTTAKEDOWN
	firsttakedownopp[id] = FIRSTTAKEDOWNOPP
	takedowns[id] = TAKEDOWNS
	takedownsopp[id] = TAKEDOWNSOPP
	twopointnf[id] = TWOPOINTNF
	twopointnfopp[id] = TWOPOINTNFOPP
	threepointnf[id] = THREEPOINTNF
	threepointnfopp[id] = THREEPOINTNFOPP
	pin[id] = PIN
	pinsopp[id] = PINSOPP 
	escapes[id] = ESCAPES
	escapesopp[id] = ESCAPESOPP
	reversals[id] = REVERSALS
	reversalsopp[id] = REVERSALSOPP
	win[id] = WIN
	decision[id] = DECISION
	decisionopp[id] = DECISIONOPP
	majordecision[id] = MAJORDECISION
	majordecisionopp[id] = MAJORDECISIONOPP
	technicalfallnf[id] = TECHNICALFALLNF
	technicalfallnonf[id] = TECHNICALFALLNONF
	technicalfallnfopp[id] = TECHNICALFALLNFOPP
	technicalfallnonfopp[id] = TECHNICALFALLNONFOPP
	forfeit[id] = FORFEIT
	forfeitopp[id] = FORFEITOPP
	injurydefault[id] = INJURYDEFAULT
	injurydefaultopp[id] = INJURYDEFAULTOPP
	stallwarning[id] = STALLWARNING
	stallwarningopp[id] = STALLWARNINGOPP
	stallpoints[id] = STALLPOINTS
	stallpointsopp[id] = STALLPOINTS
	caution[id] = CAUTION
	cautionopp[id] = CAUTIONOPP
	cautionpoints[id] = CAUTIONPOINTS
	cautionpointsopp[id] = CAUTIONPOINTSOPP
	thirdperiodwin[id] = THIRDPERIODWIN
	neutralattacks[id] = NEUTRALATTACKS
	timesattacked[id] = TIMESATTACKED
	attacksstopped[id] = ATTACKSSTOPPED
	stoppoints[id] = STOPPOINTS
	firstbackcenter[id] = FIRSTBACKCENTER
	legattack[id] = LEGATTACK
	legattackfinish[id] = LEGATTACKFINISH
	edgefinish[id] = EDGEFINISH
	latetdrecovery[id] = LATETDRECOVERY
	latetdheld[id] = LATETDHELD
	latetdrecoveryopp[id] = LATETDRECOVERYOPP
	latetdheldopp[id] = LATETDHELDOPP
	teampointsdual[id] = TEAMPOINTSDUAL
	teampointstourn[id] = TEAMPOINTSTOURN
	ridingtime[id] = RIDINGTIME
	ridingtimept[id] = RIDINGTIMEPT
	ridingtimeopp[id] = RIDINGTIMEOPP
	ridingtimeptopp[id] = RIDINGTIMEPTOPP
	dual[id] = DUAL
	tournament[id] = TOURNAMENT
	
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
		cur.execute(addition)
		cnx.commit()

# Check for each individual wrestler in the database and add or update his information.
for id, value in sorted(uniqname.iteritems(), key=lambda (k,v): (v,k), reverse=True):

	# Identify his current weight class identification number.
	if int(weightclass[id]) <= 125: wclass = 1
	elif int(weightclass[id]) <= 133: wclass = 2
	elif int(weightclass[id]) <= 141: wclass = 3
	elif int(weightclass[id]) <= 149: wclass = 4
	elif int(weightclass[id]) <= 157: wclass = 5
	elif int(weightclass[id]) <= 165: wclass = 6
	elif int(weightclass[id]) <= 174: wclass = 7
	elif int(weightclass[id]) <= 184: wclass = 8
	elif int(weightclass[id]) <= 197: wclass = 9
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
			classcount = classcount + 1
			
	except:
	
		# Add the wrestler's information to the 'user' table and assign a default password.
		addition = "INSERT INTO user (firstname, lastname, uniqname, password, email, class_id) VALUES ('" + firstname[id] + "', '" + lastname[id] + "', '" + value + "', 'PASSw0rd123', '" + value + "@umich.edu', " + str(wclass) + ")"
		cur.execute(addition)
		cnx.commit()
		usercount = usercount + 1

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
	print addition
	cur.execute(addition)
	cnx.commit()
	
	# Now store its identification number for later use.
	select = "SELECT id FROM season WHERE `season` = '" + season + "'"
	cur.execute(select)
	data = cur.fetchone()
	season_id = str(data[0])
	
# Import the bout information into the 'bout' table and assign it to the appropriate wrestler
for id in idlist:
	
	# First, find out if this data has already been entered.
	cur.execute("SELECT id FROM bout WHERE bout_id = '" + id + " " + season  + "'")
	data = cur.fetchone()
	
	try:

		# Again, try to iterate the returned value; if this succeeds it's a tuple and this bout has already been recorded.
		# If it fails, it's a NoneType.  Go to the below 'except'.
		for entry in data: continue
	
	except:
	
		# Select the user identification number from the user table.
		cur.execute("SELECT id FROM user WHERE uniqname = '" + uniqname[id] + "'")
		data = cur.fetchone()
		
		# Set it to a variable for later importation.
		user_id = str(data[0])
		
		# And here's the SQL insert line from hell.  I hope I never have to write this again.
		bout_add = 'INSERT INTO bout (user_id, season_id, week, bout, bout_id, opponent, opponentteam, weightclass, firsttakedown, firsttakedownopp, takedowns, takedownsopp, twopointnf, twopointnfopp, threepointnf, threepointnfopp, pin, pinsopp, escapes, escapesopp, reversals, reversalsopp, win, decision, decisionopp, majordecision, majordecisionopp, technicalfallnf, technicalfallnonf, technicalfallnfopp, technicalfallnonfopp, forfeit, forfeitopp, injurydefault, injurydefaultopp, stallwarning, stallwarningopp, stallpoints, stallpointsopp, caution, cautionopp, cautionpoints, cautionpointsopp, thirdperiodwin, neutralattacks, timesattacked, attacksstopped, stoppoints, firstbackcenter, legattack, legattackfinish, edgefinish, latetdrecovery, latetdheld, latetdrecoveryopp, latetdheldopp, teampointsdual, teampointstourn, ridingtime, ridingtimept, ridingtimeopp, ridingtimeptopp, `dual`, tournament) VALUES (%s, %s, %s, %s, "%s", "%s", "%s", %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s)' % (user_id, season_id, week[id], bout[id], id + " " + season, opponent[id], opponentteam[id], weightclass[id], firsttakedown[id], firsttakedownopp[id], takedowns[id], takedownsopp[id], twopointnf[id], twopointnfopp[id], threepointnf[id], threepointnfopp[id], pin[id], pinsopp[id], escapes[id], escapesopp[id], reversals[id], reversalsopp[id], win[id], decision[id], decisionopp[id], majordecision[id], majordecisionopp[id], technicalfallnf[id], technicalfallnonf[id], technicalfallnfopp[id], technicalfallnonfopp[id], forfeit[id], forfeitopp[id], injurydefault[id], injurydefaultopp[id], stallwarning[id], stallwarningopp[id], stallpoints[id], stallpointsopp[id], caution[id], cautionopp[id], cautionpoints[id], cautionpointsopp[id], thirdperiodwin[id], neutralattacks[id], timesattacked[id], attacksstopped[id], stoppoints[id], firstbackcenter[id], legattack[id], legattackfinish[id], edgefinish[id], latetdrecovery[id], latetdheld[id], latetdrecoveryopp[id], latetdheldopp[id], teampointsdual[id], teampointstourn[id], ridingtime[id], ridingtimept[id], ridingtimeopp[id], ridingtimeptopp[id], dual[id], tournament[id])
		cur.execute(bout_add)
		cnx.commit()
		boutcount = boutcount + 1
		
	# Close both the cursor and database connection.
cur.close()
cnx.close()

print '<b><font size="6">Upload Successful!</font></b><p>'
print '<table>'
print '<tr><td><b>New Users:</b></td><td>'+ str(usercount) + '</td></tr>'
print '<tr><td><b>Users Updated:</b></td><td>' + str(classcount) + '</td></tr>'
print '<tr><td><b>Bouts Added:</b></td><td>' + str(boutcount) + '</td></tr></table><br>'