#!/bin/bash -x

echo "Welcome to Flip Coin Combination Problem"

Limit=100;

###Triplet Coin Flip

hhh=0;
hht=0;
hth=0;
ttt=0;
tth=0;
tht=0;
tp=0;

declare -A triplet

while [ $tp -lt $Limit ]
 do
         flip1=$(( RANDOM%2 ));
         flip2=$(( RANDOM%2 ));
         flip3=$(( RANDOM%2 ));

        if [ $flip1 -eq 1 ] && [ $flip2 -eq 1 ] && [ $flip3 -eq 1 ]
           then
                   let hhh++

           elif [ $flip1 -eq 1 ] && [ $flip2 -eq 1 ] && [ $flip3 -eq 0 ]
           then
                  let hht++

           elif [ $flip1 -eq 1 ] && [ $flip2 -eq 0 ] && [ $flip3 -eq 1 ]
           then
                  let hth++

             elif [ $flip1 -eq 0 ] && [ $flip2 -eq 0 ] && [ $flip3 -eq 0 ]
           then
                  let ttt++

           elif [ $flip1 -eq 0 ] && [ $flip2 -eq 0 ] && [ $flip3 -eq 1 ]
           then
                  let tth++

           else 
                  let tht++
       fi
       let tp++
 done

   hhhPercentage=`echo $hhh $Limit | awk '{hhh=$1/$2*100} {print hhh}'`
   hhtPercentage=`echo $hht $Limit | awk '{hht=$1/$2*100} {print hht}'`
   hthPercentage=`echo $hth $Limit | awk '{hth=$1/$2*100} {print hth}'`
   tttPercentage=`echo $ttt $Limit | awk '{ttt=$1/$2*100} {print ttt}'`
   tthPercentage=`echo $tth $Limit | awk '{tth=$1/$2*100} {print tth}'`
   thtPercentage=`echo $tht $Limit | awk '{tht=$1/$2*100} {print tht}'`

  triplet[hhh]=$hhhPercentage
  triplet[hht]=$hhtPercentage
  triplet[hth]=$hthPercentage
  triplet[ttt]=$tttPercentage
  triplet[tth]=$tthPercentage
  triplet[tht]=$thtPercentage

   echo ${triplet[@]}

###Doublet Coin Flip

hh=0;
ht=0;
th=0;
tt=0;
db=0;

declare -a doublet

while [ $db -lt $Limit ]
 do
         flip1=$(( RANDOM%2 ));
         flip2=$(( RANDOM%2 ));

      if [ $flip1 -eq 1 ] && [ $flip2 -eq 1 ]
         then
               let hh++
         elif [ $flip1 -eq 1 ] && [ $flip2 -eq 0 ]
         then
               let ht++
         elif [ $flip1 -eq 0 ] && [ $flip2 -eq 1 ]
         then
               let th++
        else 
              let tt++
      fi
     let db++
done

   hhPercentage=`echo $hh $Limit | awk '{hh=$1/$2*100} {print hh}'`
   htPercentage=`echo $ht $Limit | awk '{ht=$1/$2*100} {print ht}'`
   thPercentage=`echo $th $Limit | awk '{th=$1/$2*100} {print th}'`
   ttPercentage=`echo $tt $Limit | awk '{tt=$1/$2*100} {print tt}'`

  doublet[hh]=$hhPercentage
  doublet[ht]=$htPercentage
  doublet[th]=$thPercentage
  doublet[tt]=$ttPercentage

   echo ${doublet[@]}

### Singlet Coin Flip

head=1;
tail=0;

hCount=0;
tCount=0;
sg=0;

declare -A singlet

while [ $sg -lt $Limit ]
  do
         flip1=$(( RANDOM%2 ));

        if [ $flip1 -eq $head ]
           then
              let  hCount++
           else
              let tCount++
        fi
         let sg++
 done

   headPercentage=`echo $hCount $Limit | awk '{h=$1/$2*100} {print h}'`
   tailPercentage=`echo $tCount $Limit | awk '{t=$1/$2*100} {print t}'`

  singlet[h]=$headPercentage
  singlet[t]=$tailPercentage

   echo ${singlet[@]}
