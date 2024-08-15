#!/usr/bin/env perl
$latex            = 'uplatex -synctex=1 -halt-on-error　-interaction=nonstopmode';
$latex_silent     = 'uplatex -synctex=1 -halt-on-error -interaction=batchmode';
$bibtex           = 'upbibtex';
$dvipdf           = 'dvipdfmx -d 5 %O -o %D %S';
$makeindex        = 'mendex %O -o %D %S';
$max_repeat       = 5;
$pdf_mode	  = 3; # generates pdf via dvipdfmx

$out_dir = 'output';

# Prevent latexmk from removing PDF after typeset.
# This enables Skim to chase the update in PDF automatically.
# $pvc_view_file_via_temporary = 0;

# Use Skim as a previewer
# for Mac
#$pdf_previewer    = "open";

# for Win
#$pdf_previewer    = "start";

ensure_path('TEXINPUTS', './sty//');
ensure_path('BSTINPUTS', './sty//');

ensure_path('TEXINPUTS', './src//');
ensure_path('BIBINPUTS', './bib//');