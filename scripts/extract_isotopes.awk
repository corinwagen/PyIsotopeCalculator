BEGIN {
    number = 1
}

/Atomic Number/ {
    number = $4
    num_isotopes[$4] += 1
    getline
    symbol[number] = $4 
    getline
    getline
    mass[number,num_isotopes[number]] = $5 
    getline
    weight[number,num_isotopes[number]] = $4
}

END {
    symbol[1] = "H"
    printf "Element,Symbol,Mass,Weight\n"
    for (i=1; i <= number; i++) {
        for (j=1; j <= num_isotopes[i]; j++) {
#            gsub("(.*)","",mass[i,j])
#            gsub("(.*)","",weight[i,j])
            printf "%s,%d,%f,%f\n", symbol[i], i, mass[i,j], weight[i,j]
        }
    }
}
