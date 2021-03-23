0) Dependencies:

I recommend installing conda to sherlock. Then can create an environment with the correct dependencies using

conda env create -f array_py2.yml

1) first unzip fastqs: [hannah: I don't have examples for this]

gunzip *.fastq.gz &

2) Merge fastqs into CPseq [nor for this]

python mergeFastqReadsToCPseq.py -rd fastqs/

3) Split CPseq into tiles:

#hannah: example.CPseq is the merged reads used in NNN experiments, every 1000th line for a small example file.
python splitCPseqIntoTiles.py -o tiles/ -s bottom example.CPseq

4) Apply ‘filter’ to CPseqs

First make a ‘<file>.CPfilter’ file.

Fields in filter():
which read should the filter be aligned to (R1 or R2)
Sequence
0 or 1 -- should sequence be exact match:1, else, 0
start point in sequence for aligning
end point for aligning
```
FID:filter(1,'GGCGACGCATCTAACGGCTCTTAGTCAACCCTACG','0000000000000000000000000000000000000',1,36)
```

Then run ‘alignmentFilterMultiple.py’ script:

python alignmentFilterMultiple.py -rd tiles/ -f FID.CPfilter -od filtered_tiles/ -gv ~/ -n 18

Then run getRegistrationOffsets:
#example images were from RNA 02222021 experiment. RNA_09_preRNAPRed2

getRegistrationOffsets.py -id example_registration_images/ -sd filtered_tiles/ -gv . -f FID`

see an example job submission in sub_register.sh
