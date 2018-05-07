BPATH=$1
OPATH=$2
LANG=$3
MIN_WORDS=5     

if [ $(echo "$LANG" | wc -c ) -lt 1 ]
    then
        LANG='eng'
fi

if [ ! -d "$OPATH" ]; then
    mkdir -p "$OPATH"
fi

for FILEPATH in $BPATH*.pdf; do
    
    OUTFILE=$OPATH$(basename $FILEPATH).txt
    touch "$OUTFILE"

    echo -n "Attempting pdftotext extraction..."
    pdftotext "$FILEPATH" "$OUTFILE"
    FILESIZE=$(wc -w < "$OUTFILE")
    echo "extracted $FILESIZE words."
    
    
    if [[ $FILESIZE -lt $MIN_WORDS ]]
        then
            echo -n "Attempting OCR extraction..."
            
            convert -density 300 "$FILEPATH" -depth 8 -strip -background white \
                    -alpha off ./temp.tiff > /dev/null 2>&1
            
            tesseract ./temp.tiff "$OUTFILE" -l $LANG > /dev/null 2>&1
            
            rm ./temp.tiff
            FILESIZE=$(wc -w < "$OUTFILE")
            echo "extracted $FILESIZE words."
    fi
done