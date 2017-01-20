# Count words.
#
# TARGET      # DEPENDENCIES
# isles.dat : books/isles.txt
#	python wordcount.py books/isles.txt isles.dat   # ACTION
#


isles.dat : books/isles.txt
	python wordcount.py books/isles.txt isles.dat

abyss.dat : books/abyss.txt 
	python wordcount.py books/abyss.txt abyss.dat 



# Added clean option
#
clean : 
	rm -f *.dat 
