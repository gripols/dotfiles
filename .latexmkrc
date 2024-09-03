# .latexmkrc file

# Specify the output directory for auxiliary files
$latex = 'pdflatex -interaction=nonstopmode -output-directory=build %O %S';
$bibtex = 'bibtex %O %S';
$makeindex = 'makeindex %O %S';
$dvipdf = 'dvipdf %O %S';

# Ensure .pdf file is placed in the current directory
$pdf_mode = 1;
$out_dir = 'build';

# Clean auxiliary files but not the .pdf
$clean_ext = "aux bbl blg brf idx ilg ind lof log lot out run.xml toc; *.gz *.fls *.fdb_latexmk *.synctex.gz";
