#!/bin/bash

WORKDIR=`pwd`

echo file, freeze, functional, grid, npoints, denconv, scfconv, homo, lumo, gap, converged?, charge,  basis info

for file in $@; do
    cd $file
    
    freeze=$(sdg freeze | awk '{print $3}') 
    
    funct=$(sdg dft | grep functional |awk '{print $2}') 
    
    grid=$(sdg dft | grep grid | awk '{print $2}')
    
    npoints=$(sdg rirpa | grep npoints | awk '{print $2}')
    
    denconv=$(sdg denconv | awk '{print $2}')
    
    scfconv=$(sdg scfconv | awk '{print $2}')
    
    eiger=( $(eiger | grep -E 'Gap|HOMO|LUMO') )
    
    homo=${eiger[9]}
    lumo=${eiger[18]}
    gap=${eiger[25]}
    converge=false
    while read -r line || [[ -n "$line" ]]; do
    	if [[ $(echo $line | grep 'convergence criteria satisfied') ]]; then
    		converge=true
    	fi
    
    	if [[ $(echo $line | grep -- '-> total') != '' ]]; then  
    		count=0
    		flag=true
    	elif [[ $flag == true && $count -eq 3 ]]; then
    		flag=false
    		charge=$(echo $line | awk '{print $3}')
    	elif [[ $flag == true ]]; then
    		count=$((count+1))
    	fi
    done < ridft*.out
    
    
    
    count=0
    superatoms=( )
    atoms=( $(sdg atoms | grep "^[a-z]" | awk '{print $1}') ) 
    for i in ${atoms[@]}; do
    	basis=$(sdg atoms | grep "^$i" -A3 | grep basis | awk '{print $2,"  ",$3}') 
    	cbasis=$(sdg atoms | grep "^$i" -A3 | grep cbas | awk '{print $2,"  ",$3}')
    	jbas=$(sdg atoms | grep "^$i" -A3 | grep jbas | awk '{print $2,"  ",$3}')
    
    superatoms[$((count + 0))]=$i,
    superatoms[$((count + 1))]=$basis,
    superatoms[$((count + 2))]=$cbasis,
    superatoms[$((count + 3))]=$jbas,
    count=$((count+4))
    done
    
    
    
    #eval outcount=( {1..$count} )
    #for i in ${outcount[@]}; do
    #	
    #	eval superatoms[${i}1]=${superatoms[${i}1]},	
    #	eval superatoms[${i}2]=${superatoms[${i}2]},
    #	eval superatoms[${i}3]=${superatoms[${i}3]},
    #	eval superatoms[${i}4]=${superatoms[${i}4]},
    #done
    
    echo $file, $freeze, $funct, $grid, $npoints, $denconv, $scfconv, $homo, $lumo, $gap, $converge, $charge,  ${superatoms[@]}
    
    cd $WORKDIR
done
