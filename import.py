###	File:		UMich Men's Wrestling Importation Script	###
###	Version:	v1.0						###
###	Author: 	Chad Kijewski					###
###	Updated:	11/8/2012					###

import mysql.connector
import datetime

# First, connect to the database.
cnx = mysql.connector.connect(user='admin', password='admin', host='127.0.0.1', database='mwrestling', use_unicode=False, buffered=True, get_warnings=True)

# Then, set the cursor variable.
cur = cnx.cursor()

# Initialize dictionaries for each database field.
first_name = {}
last_name = {}
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
techincalfallnfopp = {}
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

# Oh, and a list.
idlist = []

# Open the data source file.
fhand = open('wdata.txt', 'rb')

# Parse the source file and populate each dictionary with its appropriate information.
for line in fhand:

	# Split each line into fields.
	try:
		(LASTNAME,FIRSTNAME,UNIQUENAME,WEEK,BOUT,OPPONENT,OPPONENTWEIGHTCLASS,WEIGHTCLASS,FIRSTTAKEDOWN,FIRSTTAKEDOWNOPP,TAKEDOWNS,TAKEDOWNSOPP,TWOPOINTNF,TWOPOINTNFOPP,THREEPOINTNF,THREEPOINTNFOPP,PIN,PINSOPP,ESCAPES,ESCAPESOPP,REVERSALS,REVERSALSOPP,WIN,DECISION,DECISIONOPP,MAJORDECISION,MAJORDECISIONOPP,TECHNICALFALLNF,TECHNICALFALLNONF,TECHINCALFALLNFOPP,TECHNICALFALLNONFOPP,FORFEIT,FORFEITOPP,INJURYDEFAULT,INJURYDEFAULTOPP,STALLWARNING,STALLWARNINGOPP,STALLPOINTS,STALLPOINTSOPP,CAUTION,CAUTIONOPP,CAUTIONPOINTS,CAUTIONPOINTSOPP,THIRDPERIODWIN,NEUTRALATTACKS,TIMESATTACKED,ATTACKSSTOPPED,STOPPOINTS,FIRSTBACKCENTER,LEGATTACK,LEGATTACKFINISH,EDGEFINISH,LATETDRECOVERY,LATETDHELD,LATETDRECOVERYOPP,LATETDHELDOPP,TEAMPOINTSDUAL,TEAMPOINTSTOURN,RIDINGTIME,RIDINGTIMEPT,RIDINGTIMEOPP,RIDINGTIMEPTOPP,DUAL,TOURNAMENT) = line.split('\t')
		
		# <-- NOTE: SPLITTING BY TABS DUE TO USE OF COMMAS IN NAME FIELDS, THIS MAY CHANGE --> #
	
	# Skip the line if it doesn't contain all fields (i.e. blank lines).
	except:	continue
	
	# Skip the line if it is the header line
	if 'TeamMember' in TEAMMEMBER: continue
	
	# Initialize the 'id' variable to keep track of dictionary entries.
	id = UNIQUENAME + " " + WEEK + "-" + BOUT
	
	# Add the 'id' variable to a list to iterate through later on
	idlist.append(id)
	
	# 10/8/12: Not needed as input has been re-formatted to separate fields for first name and last name.
	# Split the 'TEAMMEMBER' field into first and last names.
	# TEAMMEMBER = TEAMMEMBER.strip('"')
	# (LASTNAME, FIRSTNAME) = TEAMMEMBER.split(',')
	
	# Check for blank or empty values; if found, set to null so SQL accepts it.
	# 10/8/12: TEAMMEMBER has been changed to be separate FIRSTNAME and LASTNAME fields.
	# if TEAMMEMBER == ' ': TEAMMEMBER = 'null' 
	if LASTNAME == ' ': LASTNAME = 'null'
	if FIRSTNAME == ' ': FIRSTNAME = 'null'
	if UNIQUENAME == ' ': UNIQUENAME = 'null' 
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
	if TECHINCALFALLNFOPP == ' ': TECHINCALFALLNFOPP = 'null' 
	if TECHNICALFALLNONFOPP == ' ': TECHNICALFALLNONFOPP = 'null' 
	if FORFEIT == ' ': FORFEIT = 'null'
	if FORFEITOPP = ' ': FORFEITOPP = 'null'
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
	if NEUTRALATTACKS== ' ': NEUTRALATTACKS = 'null' 
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
	if TOURNAMENT == ' ': TOURNAMENT
	
	# Populate each dictionary with its respective field.
	first_name[id] = FIRSTNAME.strip(' ')
	last_name[id] = LASTNAME
	uniqname[id] = UNIQUENAME
	week[id] = WEEK
	bout[id] = BOUT
	opponent[id] = OPPONENT.strip('"')
	opponentteam[id] = OPPONENTTEAM('"')
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
	techincalfallnfopp[id] = TECHINCALFALLNFOPP
	technicalfallnonfopp[id] = TECHNICALFALLNONFOPP
	forfeit[id] = FORFEIT
	forfeitopp[id] = FORFEITOPP
	injurydefault[id] = INJURYDEFAULT
	injurydefaultopp[id] = INJURYDEFAULTOPP
	stallwarning[id] = STALLWARNING
	stallwarningopp[id] = STALLWARNINGOPP
	stallpoints[id] = STALLPOINTS
	stallpointsopp[id] = STALLPOINTSOPP
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
	
# Check for each individual wrestler in the database and add or update his information.
for id, value in sorted(uniqname.iteritems(), key=lambda (k,v): (v,k), reverse=True):

	# Identify his current weight class identification number.
	if int(weightclass[id]) <= 125: wclass = 0
	elif int(weightclass[id]) <= 133: wclass = 1
	elif int(weightclass[id]) <= 141: wclass = 2
	elif int(weightclass[id]) <= 149: wclass = 3
	elif int(weightclass[id]) <= 157: wclass = 4
	elif int(weightclass[id]) <= 165: wclass = 5
	elif int(weightclass[id]) <= 174: wclass = 6
	elif int(weightclass[id]) <= 184: wclass = 7
	elif int(weightclass[id]) <= 197: wclass = 8
	elif int(weightclass[id]) <= 285: wclass = 9
	else: wclass = 10
	
	# Try to select his information from the 'user' table.
	select = "SELECT * FROM user WHERE username = '" + value + "'"
	cur.execute(select)
	
	# Fetch the result of this query and set it to a variable to be analyzed.
	data = cur.fetchone()
	
	try:
	
		# Try to iterate the returned value; if this succeeds it's a tuple and the wrestler already has an entry.
		# If it fails, it's a NoneType.  Go to the below 'except'.
		for entry in data: continue
		
		# The wrestler already has an entry; compare the wrestler's current weight class with his previously recorded one.
		if wclass == data[6]: continue
		
		# If the weight class is different, update it!
		else:
			update = "UPDATE user SET id_wclass = " + str(wclass) + " WHERE username = '" + value + "'"
			cur.execute(update)
			cnx.commit()
			print "Weight class updated for user  '" + value + "'!"
			
	except:
	
		# Add the wrestler's information to the 'user' table and assign a default password.
		addition = "INSERT INTO user (first_name, last_name, username, password, email, id_wclass) VALUES ('" + first_name[id] + "', '" + last_name[id] + "', '" + value + "', 'PASSw0rd123', '" + value + "@umich.edu', " + str(wclass) + ")"
		cur.execute(addition)
		cnx.commit()
		print "User " + value + " added to database!"

# Set a variable for the current time and determine what season it is.
now = datetime.datetime.now()

# Identify what wrestling season this is based on when this data is being imported.
if int(now.month) >= 8 and int(now.month) <= 12: season = str(now.year) + "-" + str((int(now.year) + 1))
elif int(now.month) >= 1 and int(now.month) <= 7: season = str(int(now.year) - 1) + "-" + str(now.year)

# Try to select the season id number from the 'season' table.

select = "SELECT id FROM seasons WHERE season = '" + season + "'"
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
	addition = "INSERT INTO seasons (season) VALUES ('" + season + "')"
	print addition
	cur.execute(addition)
	cnx.commit()
	
	# Now store its identification number for later use.
	select = "SELECT id FROM seasons WHERE season = '" + season + "'"
	cur.execute(select)
	data = cur.fetchone()
	season_id = str(data[0])
	print "New season added: " + season
	
# Import the bout information into the 'bout' table and assign it to the appropriate wrestler
for id in idlist:
	
	# First, find out if this data has already been entered.
	cur.execute("SELECT id FROM bout WHERE bout_id = '" + id + " " + season  + "'")
	data = cur.fetchone()
	
	try:

		# Again, try to iterate the returned value; if this succeeds it's a tuple and this bout has already been recorded.
		# If it fails, it's a NoneType.  Go to the below 'except'.
		for entry in data: continue
		print "Entry already exists!"
	
	except:
	
		# Select the user identification number from the user table.
		cur.execute("SELECT id FROM user WHERE username = '" + uniqname[id] + "'")
		data = cur.fetchone()
		
		# Set it to a variable for later importation.
		user_id = str(data[0])
		
		# And here's the SQL insert line from hell.  I hope I never have to write this again.
		bout_add = "INSERT INTO bout (season_id, user_id, week, bout_num, bout_id, opponent, opponent_team, first_takedown, opp_first_takedown, takedowns, opp_takedowns, 2pt_nearfall, opp_2pt_nearfall, 3pt_nearfall, opp_3pt_nearfall, pins, opp_pins, escapes, opp_escapes, reversals, opp_reversals, win, decision, opp_decision, major_decision, opp_major_decision, tech_fall, opp_tech_fall, tech_fall_no, opp_tech_fall_no, forfeit, forfeit_opp, injury_default, opp_injury_default, stall_warning, opp_stall_warning, stall_points, opp_stall_points, cautions, opp_cautions, caution_points, opp_caution_points, third_period_win, neutral_attacks, times_attacked, attacks_stopped, stop_points, first_back_center, leg_attack, leg_attack_finish, edge_finish, late_td_recovery, opp_late_td_recovery, late_td_held, opp_late_td_held, team_points_dual, team_points_tourn, riding_time, opp_riding_time, riding_time_pt, opp_riding_time_pt, `dual`, tournament) VALUES (" + season_id + ", " + user_id + ", " + week[id] + ", " + bout[id] + ", '" + id + " " + season + "', '" + opponent[id] + "', " + opponentteam[id] + "', " + firsttakedown[id] + ", " + firsttakedownopp[id] + ", " + takedowns[id] + ", " + takedownsopp[id] + ", " + twopointnf[id] + ", " + twopointnfopp[id] + ", " + threepointnf[id] + ", " + threepointnfopp[id] + ", " + pin[id] + ", " + pinsopp[id] + ", " + escapes[id] + ", " + escapesopp[id] + ", " + reversals[id] + ", " + reversalsopp[id] + ", " + win[id] + ", " + decision[id] + ", " + decisionopp[id] + ", " + majordecision[id] + ", " + majordecisionopp[id] + ", " + technicalfallnf[id] + ", " + techincalfallnfopp[id] + ", " + technicalfallnonf[id] + ", " + technicalfallnonfopp[id] + ", " + forfeit[id] + ", " + forfeitopp[id] + ", " + injurydefault[id] + ", " + injurydefaultopp[id] + ", " + stallwarning[id] + ", " + stallwarningopp[id] + ", " + stallpoints[id] + ", " + stallpointsopp[id] + ", " + caution[id] + ", " + cautionopp[id] + ", " + cautionpoints[id] + ", " + cautionpointsopp[id] + ", " + thirdperiodwin[id] + ", " + neutralattacks[id] + ", " + timesattacked[id] + ", " + attacksstopped[id] + ", " + stoppoints[id] + ", " + firstbackcenter[id] + ", " + legattack[id] + ", " + legattackfinish[id] + ", " + edgefinish[id] + ", " + latetdrecovery[id] + ", " + latetdrecoveryopp[id] + ", " + latetdheld[id] + ", " + latetdheldopp[id] + ", " + teampointsdual[id] + ", " + teampointstourn[id] + ", " + ridingtime[id] + ", " + ridingtimeopp[id] + ", " + ridingtimept[id] + ", " + ridingtimeptopp[id] + ", " + dual[id] + ", " + tournament[id] + ")"
		cur.execute(bout_add)
		cnx.commit()
		print "Entry added!"
		
	# Close both the cursor and database connection.
cur.close()
cnx.close()
