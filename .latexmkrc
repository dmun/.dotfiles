$pdflatex = 'pdflatex -synctex=1 -interaction=nonstopmode';
$cleanup_includes_cusdep_generated = 1;
@generated_exts = (@generated_exts, 'synctex.gz');
