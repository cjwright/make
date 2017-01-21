# Count words.
#
# TARGET      # DEPENDENCIES
# isles.dat : books/isles.txt
#	python wordcount.py books/isles.txt isles.dat   # ACTION
#

# Include config file

include config.mk

# Generate summary table
#
# $@ Make variable meaning 'target of the current rule'
# $^ Make variable meaning 'all the dependencies of the current rule'
# bash wildcards allowed 

results.txt : *.dat $(ZIPF_SRC)
	$(ZIPF_EXE) *.dat >  $@

# Count words
#
.PHONY : dats
dats : isles.dat abyss.dat last.dat

# $< Make variable meaning 'the first dependency of the current rule'
# % is Make wildcard Can't be used in actions hence $*.dat below

%.dat : books/%.txt $(COUNT_SRC)
	$(COUNT_EXE) $< $*.dat


# Added clean option
#
.PHONY : clean 
clean : 
	rm -f *.dat 
	rm -f results.txt

