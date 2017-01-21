# wordcount python script
#
COUNT_SRC=wordcount.py


# Execute the script 
#
COUNT_EXE=python $(COUNT_SRC)


# Test Zipf's rule 
#
ZIPF_SRC=zipf_test.py

ZIPF_EXE=python $(ZIPF_SRC)

# Make png files
#
PNG_SRC=plotcount.py

PNG_EXE=python $(PNG_SRC) 
