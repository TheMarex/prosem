%% Encoding: ISO8859-1 %%

%% LaTeX2e class for seminars
%% Based on wissdoc.cls by Roland Bless, 1996-2001
%% bless@telematik.informatik.uni-karlsruhe.de
%%
%% Adapted by: Timo Rohrberg, 2009
%% timo.rohrberg@student.kit.edu
%%
%% Adapted by: Christian Henrich, 2010
%% henrich@kit.edu

\NeedsTeXFormat{LaTeX2e}			% We do need LaTeX2e
\ProvidesClass{iti-seminar}
\LoadClass[a4paper,11pt,titlepage]{scrbook}	% Class based on scrbook
%\RequirePackage{ngerman}			% New german orthography

%% -------------------------------
%% |          Packages           |
%% -------------------------------

\usepackage{ae}               % Almost european, virtual T1-Font
\usepackage{vmargin}          % Adjust margins in a simple way
\usepackage{fancyhdr}         % Define simple headings
\usepackage[absolute,overlay]{textpos}
\usepackage{tikz}
\usepackage[english]{babel}
\usetikzlibrary{snakes,arrows,shapes}

\usepackage{textcomp}
%\usepackage{bibgerm}
\usepackage{multibib}
\usepackage{amsthm}

\usepackage[raiselinks=true,
  a4paper,pdftex,colorlinks,bookmarks,
  bookmarks=true,
  bookmarksopenlevel=1,
  bookmarksopen=true,
  bookmarksnumbered=true,
  hyperindex=true,
  plainpages=false,
  pdfpagelabels=true,
  pdfborder={0 0 0.5}]{hyperref}
%% --- End of Packages ---



%% -------------------------------
%% |        Declarations         |
%% -------------------------------
\DeclareGraphicsExtensions{.svg}
%% --- End of Declarations ---



%% -------------------------------
%% |         New commands        |
%% -------------------------------
\newcommand{\changefont}[3]{\fontfamily{#1} \fontseries{#2} \fontshape{#3} \selectfont}
%\renewcommand*{\headfont}{\slshape}
%\newcommand{\captionfont}{}
\newcommand{\chapterheadfont}{}
\newcommand{\blankpage}{
 \clearpage{\pagestyle{empty}\cleardoublepage}
}
%% --- End of New Commands ---



%% -------------------------------
%% |      Globale Settings       |
%% -------------------------------
\setcounter{secnumdepth}{3} % Numbering also for \subsubsections
\setcounter{tocdepth}{3}    % Register \subsubsections in content directory

\setpapersize{A4}
\setmarginsrb{5.2cm}{1cm}{5.2cm}{1cm}{6mm}{7mm}{5mm}{15mm}

% \parindent 0cm	% indent beginning of paragraph
% \parskip 0cm		% no margin between paragraphs

\marginparwidth 0mm
\marginparsep 0mm
\marginparpush 0pt
\columnwidth\textwidth

\setlength{\topsep}{0pt}
\setlength{\partopsep}{5pt plus 4pt minus 2pt}
%% --- End of global Settings ---



%% -------------------------------
%% |          Headings           |
%% -------------------------------
\pagestyle{fancy}
\renewcommand{\chaptermark}[1]{\markboth{\thechapter.\ #1}{}}
\fancyhf{}
\fancyhead[LE,RO]{{\headfont\thepage}}			% Left/right header for even/odd pages
\fancyhead[LO]{\headfont\nouppercase{\rightmark}}	% Header for left page (odd)
\fancyhead[RE]{\headfont\nouppercase{\leftmark}}	% Header for right page (even)
% \fancyfoot[C]{\thepage}
\renewcommand{\headrulewidth}{0.5pt}
\renewcommand{\footrulewidth}{0pt}
\fancypagestyle{plain}{%
\fancyhf{}						% No Header and Footer fields
\renewcommand{\headrulewidth}{0pt}
\renewcommand{\footrulewidth}{0pt}
\fancyfoot[C]{\thepage}
}
%% --- End of Headings ---



%% -------------------------------
%% |      Style of captions      |
%% -------------------------------

%% Bibliography Environment
\def\thebibliography#1{\section*{\bibname\def\leftmark{{\sc \bibname}}}\list
 {[\arabic{enumi}]}{\settowidth\labelwidth{[#1]}\leftmargin\labelwidth
 \advance\leftmargin\labelsep
 \usecounter{enumi}}
 \def\newblock{\hskip .11em plus .33em minus .07em}
 \sloppy\clubpenalty4000\widowpenalty4000
 \sfcode`\.=1000\relax
 \addcontentsline{toc}{section}{\bibname}}
\let\endthebibliography=\endlist

%% Definitions for Sections...
% \renewcommand{\chaptername}{}
% 
% \renewcommand{\section}{%
% \@startsection{section}%
% {1}		% Structure level
% {0mm}	% Indention
% {1.5ex plus 1ex minus 1.2ex}		% Pre-Margin
% {0.5ex plus 0.5ex minus 0.5ex}		% Post-Margin
% {\chapterheadfont\Large\bfseries}	% Style
% }
% \renewcommand{\subsection}{%
% \@startsection{subsection}%
% {2}		% Structure level
% {0mm}	% Indention
% {1ex plus 1ex minus 1ex}		% Pre-Margin
% {0.3ex plus 0.3ex minus 0.3ex}		% Post-Margin
% {\chapterheadfont\large\bfseries}	% Style
% }
% \renewcommand{\subsubsection}{%
% \@startsection{subsubsection}%
% {3}		% Structure level
% {0mm}	% Indention
% {1ex plus 1ex minus 1ex}		% Pre-Margin
% {0.2ex plus 0.2ex minus 0.2ex}		% Post-Margin
% {\chapterheadfont\normalsize\bfseries}	% Style
% }
% \renewcommand{\paragraph}{%
% \@startsection{paragraph}%
% {4}		% Structure level
% {0mm}	% Indention
% {2ex plus 1ex minus 2ex}		% Pre-Margin
% {0.2ex plus 0.2ex minus 0.2ex}		% Post-Margin
% {\chapterheadfont\normalsize\bfseries}	% Style
% }
%% --- End of captions style ---



%% ---------------------------------
%% |   Style of chapter captions   |
%% ---------------------------------
\newlength{\chapnolen}
\newlength{\chapparlen}
\newsavebox{\chapno}
\renewcommand{\@makechapterhead}[1]{
  \vspace*{0.2\textheight}
  \vskip 15\p@
  {\parindent \z@ \raggedright \normalfont
    \ifnum \c@secnumdepth >\m@ne
      \if@mainmatter
        \savebox{\chapno}{\chapterheadfont\huge\bfseries \thechapter.}
        \settowidth{\chapnolen}{\usebox{\chapno}}
        \parbox[t]{\chapnolen}{\usebox{\chapno}}\nobreak\leavevmode
      \fi
    \fi
    \interlinepenalty\@MM
    \setlength{\chapparlen}{\textwidth}
    \addtolength{\chapparlen}{-1.0\chapnolen}
    \addtolength{\chapparlen}{-2ex}
    \leavevmode\nobreak
    \parbox[t]{\chapparlen}{\raggedright\chapterheadfont\huge \bfseries #1\par\nobreak}
    \vskip 40\p@
  }}

\renewcommand{\@makeschapterhead}[1]{
  \vspace*{50\p@}
  {\parindent \z@ \raggedright
    \normalfont
    \interlinepenalty\@M
    \chapterheadfont \huge \bfseries  #1\par\nobreak
    \vskip 40\p@
  }
}
%% --- End of chapter captions style ---


%% --- Taken from haupt.sty ---

% \def\topfraction{0.9}
% \def\bottomfraction{0.9}
% \def\textfraction{0.1}

\def\ps@headings{\let\@mkboth\markboth
\def\@oddfoot{}\def\@evenfoot{}\def\@evenhead{%
\rlap{\hbox to \hsize{\rm \thepage\hfil \sc
\leftmark}}\raise-3pt\hbox to \hsize{\hrulefill}}
\def\@oddhead{\rlap{\hbox to \hsize{\hbox{}\sc \rightmark \hfil
\rm\thepage}}\raise-3pt\hbox to \hsize{\hrulefill}}
\def\chaptermark##1{\markboth {{\ifnum \c@secnumdepth
>\m@ne
 \@chapapp\ \thechapter. \ \fi ##1}}{}}\def\sectionmark##1{\markright
{{\ifnum \c@secnumdepth >\z@
 \thesection. \ \fi ##1}}}}

% \pagestyle{headings}

% Aufruf \Paper[Title for headings]{Title}{Author}
\def\Paper{\@ifnextchar [{\@vortiii}{\@vortii}}

\def\@vortii#1#2{\@vortrag{#1}{#2}{#1}}
\def\@vortiii[#1]#2#3{\@vortrag{#2}{#3}{#1}}
\def\@vortrag#1#2#3{%
\chapter[#1]{{#1\\{\Large #2}}}%
\addtocontents{toc}{\string\leavevmode\hbox to \string\@tempdima {\hfil}{\bf (#2)}\par}%
\chaptermark{#3}}

\def\chaptername{Paper}

\def\@makechapterhead#1{ \vspace*{20pt} { \parindent 0pt \raggedright
 \ifnum \c@secnumdepth >\m@ne 
 \huge\bf \@chapapp{} \thechapter \par
 \vskip 10pt \fi 
 \huge\bf #1 \\
 \nobreak \vskip 20pt} }

% Abstract Environment?
% \def\abstract{\begin{quote}\begin{center}{\bf
% Zusammenfassung}\end{center}\small}
% \def\endabstract{\end{quote}}

\newread\TeXfilein    % file to \read
\newcommand{\includeTeX}[1]{
\openin\TeXfilein#1.tex
\ifeof\TeXfilein
\typeout{============================================================}
\typeout{Warnung: Datei #1.tex nicht gefunden}
\typeout{============================================================}
\else{\include{#1}}\fi
\closein\TeXfilein}
%%% --- End of haupt.sty ---



%% -------------------------------
%% |  Style of content directory |
%% -------------------------------
\let\oldtableofcontents\tableofcontents
\renewcommand{\tableofcontents}{{\pdfbookmark{\contentsname}{\contentsname}\chapterheadfont\oldtableofcontents}}
\let\@olddottedtocline\@dottedtocline
\renewcommand{\@dottedtocline}[5]{\@olddottedtocline{#1}{#2}{#3}{#4}{\chapterheadfont #5}}
%% --- End of content directory style ---

%% **** END OF CLASS ****
