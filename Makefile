# Count words.
#
# TARGET      # DEPENDENCIES
# isles.dat : books/isles.txt
#	python wordcount.py books/isles.txt isles.dat   # ACTION
#

# Added .PHONY default
#
.PHONY : dats
dats : isles.dat abyss.dat last.dat


isles.dat : books/isles.txt
	python wordcount.py books/isles.txt isles.dat

abyss.dat : books/abyss.txt 
	python wordcount.py books/abyss.txt abyss.dat 

last.dat : books/last.txt 
	python wordcount.py books/last.txt lst.dat 


# Added .PHONY default
#
.PHONY : results
results : dats
	python zipf_test.py abyss.dat isles.dat > results.txt
	

# Added clean option
#
.PHONY : clean 
clean : 
	rm -f *.dat 
