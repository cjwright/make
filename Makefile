# Count words.
#
# TARGET      # DEPENDENCIES
# isles.dat : books/isles.txt
#	python wordcount.py books/isles.txt isles.dat   # ACTION
#


# Generate summary table
#
# $@ Make variable meaning 'target of the current rule'
# $^ Make variable meaning 'all the dependencies of the current rule'
# bash wildcards allowed 

results.txt : *.dat zipf_test.py
	python zipf_test.py $< >  $@

# Count words
#
.PHONY : dats
dats : isles.dat abyss.dat last.dat

# $< Make variable meaning 'the first dependency of the current rule'

isles.dat : books/isles.txt
	python wordcount.py $< $@

abyss.dat : books/abyss.txt 
	python wordcount.py $< $@ 

last.dat : books/last.txt 
	python wordcount.py $< $@ 


# Added clean option
#
.PHONY : clean 
clean : 
	rm -f *.dat 
	rm -f results.txt

