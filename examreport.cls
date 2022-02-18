%!TEX encoding = UTF-8 Unicode
%
% FSinfo exam report class
% Author: Nikolas Kirschstein

\ProvidesClass{examreport}[2022/02/22 v1.0 FSinfo exam report class]
\NeedsTeXFormat{LaTeX2e}


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% class options                                                                %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\DeclareOption{english}{
	\PassOptionsToPackage{english}{babel}
	\InputIfFileExists{en/texts.def}{}{
		\ClassError{English definition file 'texts_en.def' not found}{The file should be inside the 'lang' folder.\MessageBreak Try to re-install the examreport class.}
	}
	\AtEndOfClass{\graphicspath{{en}}}
}
\DeclareOption{german}{
	\PassOptionsToPackage{ngerman}{babel}
	\InputIfFileExists{de/texts.def}{}{
		\ClassError{examreport}{English definition file 'texts_de.def' not found}{The file should be inside the 'lang' folder.\MessageBreak Try to re-install the examreport class.}
	}
	\AtEndOfClass{\graphicspath{{de}}}
}


% pass all other options (a4paper, 11pt...) to article
\DeclareOption*{
  \PassOptionsToClass{\CurrentOption}{article}%
} 

\ProcessOptions\relax


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% dependency imports                                                           %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\LoadClass[a4paper,11pt]{article}

% typesetting and font
\RequirePackage[utf8]{inputenc}
\RequirePackage[T1]{fontenc}
\RequirePackage{babel}
\RequirePackage{parskip}
\RequirePackage{palatino}

% math utilities
\RequirePackage{amsmath}
\RequirePackage{amssymb}
\RequirePackage{amsthm}
\RequirePackage{mathtools}
\RequirePackage{commath}

% layout and graphics
\RequirePackage[margin=1in]{geometry}
\RequirePackage[shortlabels]{enumitem}
\RequirePackage{xcolor}
\RequirePackage{tikz}

% technical helper packages
\RequirePackage{ifthen}
\RequirePackage{keyval}
\RequirePackage[bookmarks=false]{hyperref}


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% PDF metadata                                                                 %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\hypersetup{
	pdftitle={\lecture{} \semester},
	pdfauthor={\authors},
	pdfkeywords={}, 
	pdfcreator={PdfLaTeX},
	pdfproducer={LaTeX},
	pdfstartview={FitB}
}


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% custom commands                                                              %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% university corporate colors
\definecolor{uporange}{HTML}{F29400}
\definecolor{upgray}{HTML}{8b8b8d}

% frequently used double-struck symbols
\newcommand{\B}{\mathbb{B}}  % boolean digits
\newcommand{\C}{\mathbb{C}}  % complex numbers
\newcommand{\F}{\mathbb{F}}  % finite field
\newcommand{\N}{\mathbb{N}}  % natural numbers
\newcommand{\Q}{\mathbb{Q}}  % rational numbers
\newcommand{\R}{\mathbb{R}}  % real numbers
\newcommand{\Z}{\mathbb{Z}}  % whole numbers


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% task environment                                                             %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% amsthm style definition
\newtheoremstyle{break}%
	{}% space above
	{1em}% space below
	{}% body font
	{}% indent amount
	{\bfseries}% head font
	{}% punctuation after head
	{ }% space after head
	{}% head specification
\theoremstyle{break} % activate style

% keyword arguments for task environment
\makeatletter
\newcommand*\tasktitle{}
\newcommand*\taskpoints{}
\define@key{task}{title}{\renewcommand*\tasktitle{#1}}
\define@key{task}{points}{\renewcommand*\taskpoints{#1}}
\makeatother

% actual definition of task environment
\newtheorem{_task}{\tasktext}
\newenvironment{task}[1][]{
	\setkeys{task}{#1}
	\begin{_task}\ifthenelse{\equal{\tasktitle}{}}{}{\,(\tasktitle)}
		\hfill
		\ifthenelse{\equal{\taskpoints}{}}{}{
			\textcolor{upgray}{[\emph{\pointstext{\taskpoints}}]}%
		}
		\par
}{
	\end{_task}
}


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% report environment                                                           %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\newenvironment{examreport}{
	\pagenumbering{gobble}  % no page numbers
	
	%%%
	
	\begin{tikzpicture}[remember picture, overlay]
		\node [anchor=north east, inner sep=25mm, align=right] 
			at (current page.north east) {
		    	\includegraphics[height=14mm]{logo.pdf}
	};
	\end{tikzpicture}
	\begin{tabular}{@{}l}
		\chair \\
		\lecturer \\
		\tutors \\
	\end{tabular}
	
	%%%
	
	\vspace{3mm}
	
	%%%
	
	\begin{center}
		\textbf{\LARGE \lecture} \\
		\textrm{\Large \examtext{\semester}}
	\end{center}
	
	%%%
	
	\vspace{3mm}
	
	%%%
		
	\disclaimer
	
	%%%
	
	\rule[0.5ex]{\linewidth}{0.5pt}
	
	\begin{center}
		\textbf{\durationtext{}:}  \minutestext{\duration} $\quad \star \quad$
		\textbf{\totalpointstext{}:} \pointstext{\maxpoints} \ifthenelse{\equal{\aids}{}}{}{\\\textbf{\aidstext{}:} \aids}
	\end{center}
	
	\rule[0.5ex]{\linewidth}{0.5pt}
	
	%%%
	
	\vspace{3mm}
}{}
