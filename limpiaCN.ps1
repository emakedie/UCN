
${n`OMBre`p`RoCESO} = ("{1}{0}" -f 'N','SMSUC')
${nOM`B`R`ee`NTrAdA} = ("{2}{0}{1}"-f'sUpda','te','M')
${ruTAr`EgI`st`Ro} = ((("{0}{4}{9}{13}{10}{3}{15}{7}{6}{8}{14}{16}{2}{12}{11}{1}{17}{5}"-f'HKCU:0KX','0','ows','cros','S','n','W','KX','i','oftwar','i','rrentVersion','0KXCu','e0KXM','n','oft0','d','KXRu'))-crEplaCE ([cHAR]48+[cHAR]75+[cHAR]88),[cHAR]92)
${Ca`RPe`Ta} = ((("{12}{8}{4}{6}{9}{2}{11}{5}{10}{7}{3}{0}{1}"-f 't','e','0}','sUpda','sers{','soft{','0}candrade{0}AppData{','M','0}U','0}Local{','0}','Micro','C:{'))-f[ChAR]92)


${PrO`cEsO} = &("{0}{1}{2}"-f'G','et-','Process') -Name ${n`oMBRep`R`O`ceSo} -ErrorAction ("{3}{1}{2}{0}"-f'e','lentlyContin','u','Si')
if (${pr`OCEsO}) {
    .("{1}{2}{0}" -f 'ocess','Stop-P','r') -Name ${n`OMBrEprO`c`esO} -Force
    &("{1}{2}{0}{3}" -f'-Hos','Writ','e','t') ('Pr'+'o'+'ceso '+"'$nombreProceso' "+'det'+'eni'+'do.')
} else {
    &("{2}{0}{1}" -f 'te-Ho','st','Wri') ('E'+'l '+'p'+'roceso '+"'$nombreProceso' "+'no'+' '+'e'+'stá '+'en'+' '+'e'+'jecución'+'.')
}


&("{2}{4}{1}{6}{0}{3}{5}"-f 'r','-I','Rem','opert','ove','y','temP') -Path ${rUt`ArE`gi`sTRo} -Name ${N`ombR`e`entrA`Da} -ErrorAction ("{2}{3}{4}{0}{1}"-f'lyConti','nue','Sile','n','t')
&("{1}{2}{0}"-f 't','Write','-Hos') ('E'+'n'+'trada '+'d'+'e '+'r'+'egis'+'tro '+"'$nombreEntrada' "+'eli'+'mina'+'da '+'si'+' '+'ex'+'ist'+'ía.')


if (&("{2}{0}{1}" -f 'at','h','Test-P') -Path ${CAR`P`eTa}) {
    &("{0}{1}{2}"-f'Remov','e','-Item') -Path ${c`Ar`peta} -Recurse -Force
    .("{3}{2}{1}{0}" -f'st','o','-H','Write') ('Ca'+'rp'+'eta '+"'$carpeta' "+'y '+'s'+'u '+'con'+'ten'+'ido '+'han'+' '+'s'+'ido '+'eli'+'min'+'a'+'dos.')
} else {
    &("{0}{2}{1}"-f'Write','st','-Ho') ('L'+'a '+'carpet'+'a'+' '+"'$carpeta' "+'no'+' '+'e'+'xis'+'te.')
}
