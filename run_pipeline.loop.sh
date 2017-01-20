# USAGE: bash run_pipeline.sh
# to produce plots for isles and abyss
# and the summary table for the Zipf's law tests

for book in abyss isles; do
	python wordcount.py books/$book.txt $book.dat 
	python plotcount.py $book.dat $book.png
done 

# Generate summary table
python zipf_test.py *.dat > results.txt

