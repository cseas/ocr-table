# ocr-table
This project aims to extract tables from scanned image PDFs using Optical Character Recognition.

# Usage

1. Clear the [pdf/](pdf) folder and copy all your pdf files to be scanned in it.

2. Run the OCR:
	```sh
	python3 shellocr.py
	```

3. The scanned text files shall be available in the [txt/](txt) folder once the process completes.

# Alternate

1. If the above doesn't work for you, try the alternate method.

2. Save your file as input.pdf in the root directory.

3. Run
	```sh
	python3 pdf_miner.py 
	```