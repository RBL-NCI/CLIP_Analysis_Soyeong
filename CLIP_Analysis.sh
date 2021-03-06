#!/bin/sh
    
set -e # exit on first error (if any)

# Find the parent folder of this script,
# resolving (possibly nested) symlinks
SOURCE="${BASH_SOURCE[0]}"
while [ -h "$SOURCE" ]; do
    BASE_DIR="$( cd -P "$( dirname "$SOURCE" )" && pwd )"
    SOURCE="$(readlink "$SOURCE")"
    [[ $SOURCE != /* ]] && SOURCE="$BASE_DIR/$SOURCE"
done
BASE_DIR="$( cd -P "$( dirname "$SOURCE" )" && pwd )"

export PATH=${BASE_DIR}:${PATH}

cd ${BASE_DIR}


##### Set Analysis mode

CLIPtype='Exons'       #Introns or #Exons #Introns_LINESINETLR
RunMode='Transcriptomic'      #Genomic or Transcriptomic
TrasncLoc='all'        # all, 3UTR, exons_CDS, introns
spceicies= 'mm10' #mm10 or hg38

outdir: /data/RBL_NCI/Wolin/Phil/mESC_CLIP2/structure/
SampleName: Ro
        

##### Nucleotide window Upstream + and downstream of 5’ CLIP peak
window=100


##### Generate Fasta files for sequence Motif Anslysis
MotifAnalysis=T


### Nucleotide Content Window - Select sliding window size to display heatmap
NCwindow=20  #10,20,30,40
NCcluster= 3 #number of clusters for Heatmap


## Local Structure Settings
meanBPP=.2     # minimum Chunk BasePairing Probability per row to be considered for potential structure
LScluster=4 #number of clusters for Heatmap


## Run LINE/SINE Distance
runLINESINEdist=T
PTntimes= 100 #Number of permutations for

