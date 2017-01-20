# Count words.
#
# TARGET      # DEPENDENCIES
# isles.dat : books/isles.txt
#	python wordcount.py books/isles.txt isles.dat   # ACTION
#


isles.dat : books/isles.txt
	python wordcount.py books/isles.txt isles.dat
