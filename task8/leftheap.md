## Implementierungsunterschiede
Im oberen Branch der Implementierung entspricht lleft dem old aus der anderen Implementierung. 
Im unteren Branch der Implementierung entspricht rleft dem old aus der anderen Implementierung. 
new_right entspricht quasi new, daher ist auch der Vergleich der Ranks identisch. 
Der Unterschied zwischen new und new_right ist die Reihenfolge des merge lright right in des oberen Branches. 
Die beiden Bäume werden in umgekehrter Reihenfolge gemerged, was allerdings irrelevant ist, da die Implementierung von merge unabhängig von der Reihenfolge der Bäume ist.


## Komplexitaet
`O( max(log2(⎡b1_n/2⎤), log2(⎡b2_n/2⎤)))` 
wobei ⎡n/2⎤ die Anzahl an Blättern in einem perfekt balanciertem Baum mit n Knoten ist und log2(...) die Höhe des Baums
