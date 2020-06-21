<?php

include "safemysql.class.php";

class set {

    /**
     * @var type property
     */
    public $bdset = array(
        'host' => 'localhost', // Host
        'user' => 'root', // Login
        'pass' => '', // Pass
        'db' => 'console', // Name db
        'port' => '3308', // Port
    );
    public $q = "hello";

}

class action {

    /**
     * @var type function
     */
    public function view() {
        $avgEmpls = [];
        $dayofweek = ['Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday', 'Saturday', 'Sunday'];

        $sets = new set();
        $db = new SafeMySQL($sets->bdset);

        $ids = $db->getAll("SELECT id FROM employees");
        $ids = $this->nesting($ids);

        foreach ($dayofweek as $day) {
            foreach ($ids as $id) {
                $avgEmpls = $db->getAll("SELECT AVG(hours) FROM time_reports WHERE employee_id=$id AND DAYNAME(date)='$day'");
                $avg[] = $avgEmpls;
            }            
            $keys = [];
            $values = [];
            
            $avg = $this->nesting($avg);
            $avg = $this->nesting($avg);    // ;D
            $sorts = array_combine($ids, $avg);
            arsort($sorts);
            foreach ($sorts as $key => $value) {
                $keys [] = $key;
                $values [] = $value;
            }

            $name = $this->getName($keys);            
            try {
                $this->viewOutput($name, $values, $day);
            } catch (Exception $e) {
                echo $e->getMessage();
            }
        }
    }

    /**
     * @param type $array
     * @return type array
     * remove array nesting
     */
    public function nesting($array) 
    {
        $outArray = [];
        foreach ($array as $item) {
            foreach ($item as $item2) {
                $outArray[] = $item2;
            }
        }
        return $outArray;
    }

    /**
     * @param type $keys array
     * @return type string
     */
    public function getName($keys) 
    {
        $name = [];
        $sets = new set();
        $db = new SafeMySQL($sets->bdset);
        
        for ($i = 0; $i <= 2; $i++) {
            $temp = $db->getAll("SELECT name FROM employees WHERE id=$keys[$i]");
            $temp = $this->nesting($temp);
            $name[] = $temp;
        }
        
        $name = $this->nesting($name);
        return $name;
    }

    /**
     * @param type $value array
     * @return type float
     */
    public function rounding($value) 
    {
        $rounded = round($value, 2);
        return $rounded;
    }

    /**
     * @param type $name array
     * @param type $values array
     * @param type $day array
     * @throws Exception
     */
    public function viewOutput($name, $values, $day) 
    {
        $start = "|   $day   | ";
        $partOne = $name[0] . " (" . $this->rounding($values[0]) . " hours)";
        $partTwo = ", " . $name[1] . " (" . $this->rounding($values[1]) . " hours)";
        $partThree = ", " . $name[2] . " (" . $this->rounding($values[2]) . " hours)";
        $end = "|" . "\n";
        
        if (!isset($values[0]) && !isset($values[1]) && !isset($values[2])) {
            throw new Exception("    Nobody worked on $day" . "\n");
        } elseif (isset($values[0]) && isset($values[1]) && isset($values[2])) {
            echo $start . $partOne . $partTwo . $partThree . $end;
        } elseif (!isset($values[2])) {
            echo $start . $partOne . $partTwo . $end;
        } elseif (!isset($values[2]) && !isset($values[1])) {
            echo $start . $partOne . $end;
        }
    }

}

$do = new action();
$do->view();
echo "\n";