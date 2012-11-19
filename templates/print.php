
<?php
    
    require_once "db.php";
    
    class Wrestler {
        public $id = -1;
        public $firstname = "";
        public $lastname = "";
        public $pins = 0;
        public $pins_opp = 0;
        public $wins = 0;
        public $decisions = 0;
        public $decisions_opp = 0;
        public $majors = 0;
        public $majors_opp = 0;
        public $techfall4pt = 0;
        public $techfall4pt_opp = 0;
        public $techfall = 0;
        public $techfall_opp = 0;
        public $losses = 0;
        public $firsttakedowns = 0;
        public $firsttakedowns_opp = 0;
        public $takedowns = 0;
        public $takedowns_opp = 0;
        public $nearfall2pt = 0;
        public $nearfall3pt = 0;
        public $nearfall2pt_opp = 0;
        public $nearfall3pt_opp = 0;
        public $escapes = 0;
        public $escapes_opp = 0;
        public $reversals = 0;
        public $reversals_opp = 0;
        public $forfeit = 0;
        public $forfeit_opp = 0;
        public $injdef = 0;
        public $injdef_opp = 0;
        public $caution = 0;
        public $caution_opp = 0;
        public $cautionpts = 0;
        public $cautionpts_opp = 0;
        public $thirdpd_win = 0;
        public $thirdpd_loss = 0;
        public $thirdpd_tie = 0;
        public $stalls = 0;
        public $stalls_opp = 0;
        public $stallpts = 0;
        public $stallpts_opp = 0;
        public $ridingtimepts = 0;
        public $ridingtimepts_opp = 0;
        public $teampts_dual = 0;
        public $teampts_tour = 0;
        
        function set_id($wid) {
            $this->id = $wid;
        }
        function set_first($first) {
            $this->firstname = $first;
        }
        function set_last($last) {
            $this->lastname = $last;
        }
        
        function add_pin() {
            $this->pins += 1;
        }
        
        function add_win() {
            $this->wins += 1;
        }
        
        function add_takedowns($tds) {
            $this->takedowns += $tds;
        }
        
        function add_loss() {
            $this->losses += 1;
        }
        
        function get_win_pct() {
            return $this->wins/($this->wins+$this->losses);
        }
        
        function print_wrestler() {
            echo "<p>id: ";
            echo ($this->id);
            echo " name: ";
            echo ($this->firstname);
            echo " ";
            echo ($this->lastname);
            echo " pins: ";
            echo ($this->pins);
            echo " wins: ";
            echo ($this->wins);
            echo " losses: ";
            echo ($this->losses);
            echo "</p>";
        }
    }
    
    function rank($a, $b) {
        if ($a->get_win_pct() == $b->get_win_pct()) { 
            if ($a->wins == $b->wins) {
                if ($a->pins == $b->pins) {
                    if ($a->takedowns == $b->takedowns) {
                        if ($a->nearfall3pt == $b->nearfall3pt) {
                            if ($a->nearfall2pt == $b->nearfall2pt) {
                                if ($a->stalls_opp == $b->stalls_opp) {
                                    if ($a->stalls == $b->stalls) {
                                        return 0;
                                    } return ($a->stalls > $b->stalls) ? 1 : -1;
                                } return ($a->stalls_opp < $b->stalls_opp) ? 1 : -1;
                            } return ($a->nearfall2pt < $b->nearfall2pt) ? 1 : -1;
                        } return ($a->nearfall3pt < $b->nearfall3pt) ? 1 : -1;
                    } return ($a->takedowns < $b->takedowns) ? 1 : -1;
                } return ($a->pins < $b->pins) ? 1 : -1;
            } return ($a->wins < $b->wins) ? 1 : -1;
        } return ($a->get_win_pct() < $b->get_win_pct()) ? 1 : -1;
    }
    
    function cmp_takedowns($a, $b) {
        if ($a->takedowns == $b->takedowns) {
            if ($a->takedowns_opp == $b->takedowns_opp) {
                if ($a->firsttakedowns == $b->firsttakedowns) {
                    if ($a->firsttakedowns_opp == $b->firsttakedowns_opp) {
                        return 0;
                    } return ($a->firsttakedowns_opp > $b->firsttakedowns_opp) ? 1 : -1;
                } return ($a->firsttakedowns < $b->firsttakedowns) ? 1 : -1;
            } return ($a->takedowns_opp > $b->takedowns_opp) ? 1 : -1;
        } return ($a->takedowns < $b->takedowns) ? 1 : -1;
    }
    
    function cmp_top($a, $b) {
        if ($a->pins == $b->pins) {
            if ($a->nearfall3pt == $b->nearfall3pt) {
                if ($a->nearfall2pt == $b->nearfall2pt) {
                    if ($a->ridingtimepts == $b->ridingtimepts) {
                        if ($a->reversals_opp == $b->reversals_opp) {
                            if ($a->escapes_opp == $b->escapes_opp) {
                                return 0;
                            } return ($a->escapes_opp > $b->escapes_opp) ? 1 : -1;
                        } return ($a->reversals_opp > $b->reversals_opp) ? 1 : -1;
                    } return ($a->ridingtimepts < $b->ridingtimepts) ? 1 : -1;
                } return ($a->nearfall2pt < $b->nearfall2pt) ? 1 : -1;
            } return ($a->nearfall3pt < $b->nearfall3pt) ? 1 : -1;
        } return ($a->pins < $b->pins) ? 1 : -1;
    }
    
    function cmp_bottom($a, $b) {
        if ($a->reversals == $b->reversals) {
            if ($a->escapes == $b->escapes) {
                if ($a->nearfall3pt_opp == $b->nearfall3pt_opp) {
                    if ($a->nearfall2pt_opp == $b->nearfall2pt_opp) {
                        if ($a->ridingtimepts_opp == $b->ridingtimepts_opp) {
                            return 0;
                        } return ($a->ridingtimepts_opp > $b->ridingtimepts_opp) ? 1 : -1;
                    } return ($a->nearfall2pt_opp > $b->nearfall2pt_opp) ? 1 : -1;
                } return ($a->nearfall3pt_opp > $b->nearfall3pt_opp) ? 1 : -1;
            } return ($a->escapes < $b->escapes) ? 1 : -1;
        } return ($a->reversals < $b->reversals) ? 1 : -1;
    }
    
    function cmp_penalties($a, $b) {
        if ($a->stallpts_opp == $b->stallpts_opp) {
            if ($a->stalls_opp == $b->stalls_opp) {
                if ($a->cautionpts_opp == $b->cautionpts_opp) {
                    if ($a->caution_opp == $b->caution_opp) {
                        if ($a->stallpts == $b->stallpts) {
                            return 0;
                        } return ($a->stallpts > $b->stallpts) ? 1 : -1;
                    } return ($a->caution_opp > $b->caution_opp) ? 1 : -1;
                } return ($a->cautionpts_opp > $b->cautionpts_opp) ? 1 : -1;
            } return ($a->stalls_opp < $b->stalls_opp) ? 1 : -1;
        } return ($a->stallpts_opp < $b->stallpts_opp) ? 1 : -1;
    }
    
    function cmp_team($a, $b) {
        if ($a->pins == $b->pins) { 
            if ($a->techfall == $b->techfall) {
                if ($a->techfall4pt == $b->techfall4pt) {
                    if ($a->majors == $b->majors) {
                        if ($a->decisions == $b->decisions) {
                            if ($a->pins_opp == $b->pins_opp) {
                                if ($a->techfall_opp == $b->techfall_opp) {
                                    if ($a->techfall4pt_opp == $b->techfall4pt_opp) {
                                        if ($a->majors_opp == $b->majors_opp) {
                                            if ($a->decisions_opp == $b->decisions_opp) {
                                                return 0;
                                            } return ($a->decisions_opp > $b->decisions_opp) ? 1 : -1;
                                        } return ($a->majors_opp > $b->majors_opp) ? 1 : -1;
                                    } return ($a->techfall4pt_opp > $b->techfall4pt_opp) ? 1 : -1;
                                } return ($a->techfall_opp > $b->techfall_opp) ? 1 : -1;
                            } return ($a->pins_opp > $b->pins_opp) ? 1 : -1;
                        } return ($a->decisions < $b->decisions) ? 1 : -1;
                    } return ($a->majors < $b->majors) ? 1 : -1;
                } return ($a->techfall4pt < $b->techfall4pt) ? 1 : -1;
            } return ($a->techfall < $b->techfall) ? 1 : -1;
        } return ($a->pins < $b->pins) ? 1 : -1;
    }
    
    function print_header($arr) {
        $str = "<table class='sortable'><tr>";
        echo $str;
        foreach ($arr as $key => $value) {
            echo "<th>$value</th>";
        }
        echo "</tr>";
    }
    
    function print_table($arr, $wrest_arr) {
        $rank = 1;
        echo "<tr>";
        foreach ($wrest_arr as $j => $value) {
            echo "<td>$rank</td>";
            foreach ($arr as $i => $cat) {
                echo "<td>" . $value->$cat . "</td>";
            }
            echo "</tr>";
            $rank++;
        }
        echo "</table>";
    }
    
    //queries matches for wins, losses, takedowns
    $match_query = mysql_query("SELECT user.firstname, user.lastname, user.id, bout.win, bout.firsttakedown, bout.firsttakedownopp, bout.takedowns, bout.takedownsopp, bout.twopointnf, bout.twopointnfopp, bout.threepointnf, bout.threepointnfopp, bout.pin, bout.pinsopp, bout.escapes, bout.escapesopp, bout.reversals, bout.reversalsopp, bout.decision, bout.decisionopp, bout.majordecision, bout.majordecisionopp, bout.technicalfallnf, bout.technicalfallnonf, bout.technicalfallnfopp, bout.technicalfallnonfopp, bout.forfeit, bout.forfeitopp, bout.injurydefault, bout.injurydefaultopp, bout.stallwarning, bout.stallwarningopp, bout.stallpoints, bout.stallpointsopp, bout.caution, bout.cautionopp, bout.cautionpoints, bout.cautionpointsopp, bout.thirdperiodwin, bout.teampointsdual, bout.teampointstourn, bout.ridingtimept, bout.ridingtimeptopp FROM user, bout WHERE user.id = bout.user_id");
    
    //3rdpdwin is 38
    
    $wrestler_array = array();
    
    //Adding match data to wrestler array
    $wrestler = new Wrestler();
    while ($result = mysql_fetch_row($match_query)) {
        if (!array_key_exists($result[2], $wrestler_array)) {
            $wrestler->set_id($result[2]);
            $wrestler->set_first($result[0]);
            $wrestler->set_last($result[1]);
            $wrestler->firsttakedowns += $result[4];
            $wrestler->firsttakedowns_opp += $result[5];
            $wrestler->add_takedowns($result[6]);
            $wrestler->takedowns_opp += $result[7];
            $wrestler->nearfall2pt += $result[8];
            $wrestler->nearfall2pt_opp += $result[9];
            $wrestler->nearfall3pt += $result[10];
            $wrestler->nearfall3pt_opp += $result[11];
            $wrestler->pins += $result[12];
            $wrestler->pins_opp += $result[13];
            $wrestler->escapes += $result[14];
            $wrestler->escapes_opp += $result[15];
            $wrestler->reversals += $result[16];
            $wrestler->reversals_opp += $result[17];
            $wrestler->decisions += $result[18];
            $wrestler->decisions_opp += $result[19];
            $wrestler->majors += $result[20];
            $wrestler->majors_opp += $result[21];
            $wrestler->techfall += $result[22];
            $wrestler->techfall4pt += $result[23];
            $wrestler->techfall_opp += $result[24];
            $wrestler->techfall4pt_opp += $result[25];
            $wrestler->forfeit += $result[26];
            $wrestler->forfeit_opp += $result[27];
            $wrestler->injdef += $result[28];
            $wrestler->injdef_opp += $result[29];
            $wrestler->stalls += $result[30];
            $wrestler->stalls_opp += $result[31];
            $wrestler->stallpts += $result[32];
            $wrestler->stallpts_opp += $result[33];
            $wrestler->caution += $result[34];
            $wrestler->caution_opp += $result[35];
            $wrestler->cautionpts += $result[36];
            $wrestler->cautionpts_opp += $result[37];
            $wrestler->teampts_dual += $result[39];
            $wrestler->teampts_tour += $result[40];
            $wrestler->ridingtimepts += $result[41];
            $wrestler->ridingtimepts_opp += $result[42];
            
            if($result[3] == 1) {
                $wrestler->add_win();
                $wrestler_array[$result[2]] = $wrestler;
            }
            else {
                $wrestler->add_loss();
                $wrestler_array[$result[2]] = $wrestler;
            }
        } else {
            $wrestler_array[$result[2]]->firsttakedowns += $result[4];
            $wrestler_array[$result[2]]->firsttakedowns_opp += $result[5];
            $wrestler_array[$result[2]]->add_takedowns($result[6]);
            $wrestler_array[$result[2]]->takedowns_opp += $result[7];
            $wrestler_array[$result[2]]->nearfall2pt += $result[8];
            $wrestler_array[$result[2]]->nearfall2pt_opp += $result[9];
            $wrestler_array[$result[2]]->nearfall3pt += $result[10];
            $wrestler_array[$result[2]]->nearfall3pt_opp += $result[11];
            $wrestler_array[$result[2]]->pins += $result[12];
            $wrestler_array[$result[2]]->pins_opp += $result[13];
            $wrestler_array[$result[2]]->escapes += $result[14];
            $wrestler_array[$result[2]]->escapes_opp += $result[15];
            $wrestler_array[$result[2]]->reversals += $result[16];
            $wrestler_array[$result[2]]->reversals_opp += $result[17];
            $wrestler_array[$result[2]]->decisions += $result[18];
            $wrestler_array[$result[2]]->decisions_opp += $result[19];
            $wrestler_array[$result[2]]->majors += $result[20];
            $wrestler_array[$result[2]]->majors_opp += $result[21];
            $wrestler_array[$result[2]]->techfall += $result[22];
            $wrestler_array[$result[2]]->techfall4pt += $result[23];
            $wrestler_array[$result[2]]->techfall_opp += $result[24];
            $wrestler_array[$result[2]]->techfall4pt_opp += $result[25];
            $wrestler_array[$result[2]]->forfeit += $result[26];
            $wrestler_array[$result[2]]->forfeit_opp += $result[27];
            $wrestler_array[$result[2]]->injdef += $result[28];
            $wrestler_array[$result[2]]->injdef_opp += $result[29];
            $wrestler_array[$result[2]]->stalls += $result[30];
            $wrestler_array[$result[2]]->stalls_opp += $result[31];
            $wrestler_array[$result[2]]->stallpts += $result[32];
            $wrestler_array[$result[2]]->stallpts_opp += $result[33];
            $wrestler_array[$result[2]]->caution += $result[34];
            $wrestler_array[$result[2]]->caution_opp += $result[35];
            $wrestler_array[$result[2]]->cautionpts += $result[36];
            $wrestler_array[$result[2]]->cautionpts_opp += $result[37];
            $wrestler_array[$result[2]]->teampts_dual += $result[39];
            $wrestler_array[$result[2]]->teampts_tour += $result[40];
            $wrestler_array[$result[2]]->ridingtimepts += $result[41];
            $wrestler_array[$result[2]]->ridingtimepts_opp += $result[42];
            if($result[3] == 1) {
                $wrestler_array[$result[2]]->add_win();
            }
            else {
                $wrestler_array[$result[2]]->add_loss();
            }
        }
        $wrestler = new Wrestler();
    }
    
?>
