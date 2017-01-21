# Count words.
#
# TARGET      # DEPENDENCIES
# isles.dat : books/isles.txt
#	python wordcount.py books/isles.txt isles.dat   # ACTION
#

# Include config file

include config.mk


# Make function wildcard
#
TXT_FILES=$(wildcard books/*.txt)

# Make function patsubst
#
DAT_FILES=$(patsubst books/%.txt, %.dat, $(TXT_FILES))



PNG_FILES=$(patsubst books/%.txt, %.png, $(TXT_FILES))


# Generate summary table
#
# $@ Make variable meaning 'target of the current rule'
# $^ Make variable meaning 'all the dependencies of the current rule'
# bash wildcards allowed 

.PHONY : all 
all : results.txt $(PNG_FILES)


## results.txt : Generate Zipf summary table.
#
results.txt : $(DAT_FILES) $(ZIPF_SRC)
	$(ZIPF_EXE) *.dat >  $@


## dats        : Count words in text files.
#
.PHONY : dats
dats : $(DAT_FILES)

# $< Make variable meaning 'the first dependency of the current rule'
# % is Make wildcard Can't be used in actions hence $*.dat below

%.dat : books/%.txt $(COUNT_SRC)
	$(COUNT_EXE) $< $*.dat



.PHONY :pngs
pngs : $(PNG_FILES)

%.png : %.dat $(PNG_SRC)
	$(PNG_EXE) $*.dat  $*.png




## clean       : Remove auto-generated files.
#
.PHONY : clean 
clean : 
	rm -f $(DAT_FILES)
	rm -f results.txt
	rm -f *.png


## variables   : Print variables.
#
.PHONY : variables
variables:
        @echo TXT_FILES: $(TXT_FILES)
        @echo DAT_FILES: $(DAT_FILES)
	@echo PNGS: $(PNGS)
	@echo PNG_FILES: $(PNG_FILES)

.PHONY : help
help : Makefile
	@sed -n 's/^##//p' $<





