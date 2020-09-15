%******************************************************************************%
%*                                Header Info                                 *%
%******************************************************************************%
% Define Class
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{modern-homework}[2020/09/12 Homework Template Class, 
                                made by Sayan Chaudhry and Deepayan Patra]

% Inherit `article' document type and set font to 10pt
\LoadClass[10pt]{article}
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{article}}
\ProcessOptions\relax


%******************************************************************************%
%*                                  Packages                                  *%
%******************************************************************************%
% Package for font encoding
\RequirePackage[utf8]{inputenc} 
% Package for special symbols
\RequirePackage{textcomp} 
% Package to add more colors
\RequirePackage[usenames,svgnames]{xcolor}


% Packages to make math and symbols easy by the American Mathematical Society
\RequirePackage{amsmath, amssymb, amsfonts, amsthm}  
% Package for math and programming tools for typesetting
\RequirePackage{mathtools, etoolbox}
% Package to horizontally center the \not command
\RequirePackage{centernot}
% Package for math formatting (differentials)
\RequirePackage{commath} 
% Package for higher order integrals
\RequirePackage{esint}

% Package to easily display code
\RequirePackage{listings}
% SML Programming Delcarations ( you'll see soon :) )
\lstdefinelanguage{sml}{
basicstyle=\small\ttfamily,
  captionpos=b,
  tabsize=2,
  columns=fixed,
  breaklines=true,
  numbers=none,
  numberstyle=\small\ttfamily,
  morekeywords= {
    unit, int, bool, real, char, string,
    fn, fun,
    if, then, else,
    case, of,
    EQUAL, GREATER, LESS,
    SOME, NONE, let, in, end, val
  },
  morestring=[b]",
  morecomment=[s]{(*}{*)},
}
% Define code typsetting settings
\lstset{
  language=C++,                      % the language of the code
  basicstyle=\small\ttfamily,        % code font and style
  % numbers=left,                    % line number location
  % numberstyle=\tiny\color{Blue},   % line-number font style
  % stepnumber=1,                    % the step between two line-numbers 
                                     % above, 1 = print numbers on each line
  numbersep=5pt,                     % space from line-numbers to code
  backgroundcolor=\color{white},     % choose background color
  showspaces=false,                  % do not show underline spaces in code
  showstringspaces=false,            % do not underline spaces within strings
  showtabs=false,                    % do not underline tabs within strings
  % frame=single,                    % adds a frame around the code
  % rulecolor=\color{black},         % if not set, the frame-color may change
                                     % on line-breaks within not-uniform text 
                                     % coloring
  tabsize=2,                         % sets default tabsize to 2 spaces
  captionpos=b,                      % sets the caption-position to bottom
  breaklines=true,                   % sets automatic line breaking
  breakatwhitespace=false,           % sets auto breaks only at whitespace
  keywordstyle=\color{DarkMagenta},  % keyword coloring
  commentstyle=\color{ForestGreen},  % comment coloring
  stringstyle=\color{Maroon},        % string literal 
  morecomment=[l][\color{RoyalBlue}]{\#} % more coloring for special strings
}


% Package to make pretty headers
\RequirePackage{fancyhdr}
% Package to make verbatim environments fancy
\RequirePackage{fancyvrb}
% Package to customize footnotes
\RequirePackage[hang,flushmargin]{footmisc}


% Package for image support
\RequirePackage{graphicx} % Package to add image support
% Default path to graphics: upload all images to assets/
\graphicspath{        
    {assets/}         
}  
% Package to create your own vector graphics
\RequirePackage{tikz}
% Package to create your own plots
\RequirePackage{pgfplots}
% Backwards compatability level for plots
\pgfplotsset{compat=1.7}
% Library for patterned output (e.g. in plots)
\usetikzlibrary{patterns} 
% Package to create figures and subfigures
\RequirePackage{caption}
\RequirePackage{subcaption}
% Package to position figures
\RequirePackage{float}

% Package for stronger enumeration control
\RequirePackage{enumitem}
% Reduce spacing between items by 1 times x-height of font
\setlength{\itemsep}{-1ex}


% Package for hyperlink control
\RequirePackage{hyperref} 
% Alter default link colors
\hypersetup{          
    colorlinks=true,  
    linkcolor=red,    
    filecolor=magenta,      
    urlcolor=cyan,
}


% Package for multi-line comments
\RequirePackage{comment} 
% Package for latex conditionals
\RequirePackage{ifthen}
% Package for easy lorem-ipsum generation
\RequirePackage{lipsum} 


% Package to define page setup
\RequirePackage[textwidth=16.5cm, textheight=23.5cm]{geometry}
% Define side-margin size for odd pages
\oddsidemargin0cm

%******************************************************************************%
%*                                 Formatting                                 *%
%******************************************************************************%
% Paragraph spacing options
\setlength{\parindent}{0pt}
\setlength{\parskip}{5pt plus 1pt}


% Header spacing options
\setlength{\headsep}{1.7em}
\setlength{\headheight}{30pt}


% Line spacing options
\renewcommand{\baselinestretch}{1.25}

% Header setup from flags passed in at file
\pagestyle{fancy}
\lhead{\fancyplain{}{\textbf{Homework~\homework}}} 
\rhead{\fancyplain{}{\name\linebreak\andrewid}}
\chead{\fancyplain{}{\texttt{\course}}}



%******************************************************************************%
%*                                   Macros                                   *%
%******************************************************************************%

% --------------------------- Formatting Commands ---------------------------- %
% Problem setup
% style: \problem{number}{question}
\newcommand{\problem}[2]{
    \noindent{\bf Problem #1}
    \noindent{#2}
    \vspace{0.75em}
    \hrule
    \vspace{.5em}
}

% Vertical space command
\newcommand{\spacepart}{
    \vspace{5em}
}

% Vertical star command
\newcommand{\starpart}{
    \begin{center} 
    \texttt{*}
    \end{center}
}

% ------------------------------ Math Commands ------------------------------- %
% Math Commands :: Symbols
\newcommand{\blanksymbol}{\text{\textvisiblespace}} % blank space
\renewcommand{\epsilon}{\varepsilon} % better epsilon
\newcommand{\im}{\item[$\implies$]} % implies


% Math Commands :: Operations 
\newcommand{\enc}[1]{\langle #1 \rangle}      % encoding
\renewcommand{\abs}[1]{\lvert #1 \rvert}      % absolute value
\newcommand{\logn}{\log n}                    % log n
\newcommand{\logp}[1]{\log{\left({#1}\right}} % parenthesized log


% Math Commands :: Sets
\newcommand{\Z}{\mathbb{Z}}           % integers
\newcommand{\R}{\mathbb{R}}           % reals
\newcommand{\N}{\mathbb{N}}           % naturals
\newcommand{\Q}{\mathbb{Q}}           % rationals
\renewcommand{\emptyset}{\varnothing} % empty set
\newcommand{\U}{\mathcal{U}}          % Universe
% Asymptotic analysis
\renewcommand{\O}{O}     % big-O
\renewcommand{\o}{o}     % little-o
\newcommand{\Om}{\Omega} % big-Omega
\newcommand{\om}{\omega} % little-omega
\newcommand{\Th}{\Theta} % big-Theta
% Set operations
\newcommand{\union}{\cup}        % union
\newcommand{\intersection}{\cap} % intersection
% Binary set
\DeclareMathOperator{\di}{d\!} %d_ differential
\newcommand{\binary}{\{0 , 1\}}


% Math Commands :: Calculus
% Simple derivative
% Style: \deriv {dependent var} {independent var}
\newcommand{\deriv}[2]{\frac{d #1}{d #2}}
% Partial derivative
% Style: \partderiv {dependent var} {independent var}
\newcommand{\partderiv}[2]{\frac{\partial #1}{\partial #2}} 
% Evaluate at
% Style: \eval {function} {var=lower bound} {upper bound}
\renewcommand{\eval}[3]{\left.#1\right\rvert_{#2}^{#3}} % evaluate at


% Math Commands :: Probability
\renewcommand{\Pr}{\mathbb{P}}      % Probability
\newcommand{\E}{\mathbb{E}}         % Expectation 
\newcommand{\V}{\mathbb{V}}         % Variance
\newcommand*{\Comb}[2]{C^{#1}_{#2}} % Combinations
% Distributed as
% Style: A \distas {distribution} B
\newcommand{\distas}[1]{\overset{#1}{\sim}} 


% Math Commands :: Proofs 
\newcommand{\micdrop}{\hfill \qedsymbol} % QED box
\newcommand{\QED}{\hfill \textsc{qed}} % QED text


% Math Commands :: Induction
\newcommand{\pn}{{Let P\left($n$\right) be the statement: }}
\newcommand{\st}{\text{ s.t. }}                             
\newcommand{\RHS}{\underline{\texttt{RHS:}}}
\newcommand{\LHS}{\underline{\texttt{LHS:}}}
\newcommand{\BC}{\underline{\texttt{Base Case:}}}
\newcommand{\BCS}{\underline{\texttt{Base Cases:}}}
\newcommand{\IH}{\underline{\texttt{Induction Hypothesis:}}}
\newcommand{\IS}{\underline{\texttt{Induction Step:}}}


% -------------------------------- Complexity -------------------------------- %
% Complexity Classes
\newcommand{\ccp}{{\sf P}}
\newcommand{\ccnp}{{\sf NP}}
\newcommand{\ccconp}{{\sf coNP}}
\newcommand{\ccrp}{{\sf RP}}
\newcommand{\cccorp}{{\sf coRP}}
\newcommand{\cczpp}{{\sf ZPP}}
\newcommand{\cce}{{\sf E}}
\newcommand{\ccexp}{{\sf EXP}}
\newcommand{\ccnexp}{{\sf NEXP}}
\newcommand{\cctime}{{\sf TIME}}
\newcommand{\ccl}{{\sf L}}
\newcommand{\ccnl}{{\sf NL}}
\newcommand{\ccnc}{{\sf NC}}
\newcommand{\ccconl}{{\sf coNL}}
\newcommand{\pspace}{{\sf PSPACE}}
\newcommand{\poly}{\text{poly}}
\newcommand{\karp}{\leq^P_m}
\newcommand{\lsr}{\leq^L_m}


% Problems
\newcommand{\tcol}{\textsf{3-COL}}
\newcommand{\tsat}{\textsf{3-SAT}}
\newcommand{\is}{\textsf{INDEPENDENT-SET}}
\newcommand{\clique}{\textsf{CLIQUE}}
\newcommand{\vc}{\textsf{VERTEX-COVER}}
\newcommand{\nae}{\textsf{NAE-3SAT}}
\newcommand{\csat}{\textsf{CIRCUIT-SAT}}


%******************************************************************************%
%*                                Information                                 *%
%******************************************************************************%
% Document header
\newcommand{\passport}[1]{%
    \thispagestyle{plain}
    \begin{flushright}
    \textbf{\name} \\
    \course:~Section~\recitation \\
    Professor:~\professor \\
    \ifthenelse{\equal{#1}{}}{\today}{#1}
    \end{flushright}
}

% Document title
\renewcommand{\title}{%
    \begin{center}
        {\Large\textbf{\course~Homework~\homework}}
    \end{center}
    \vspace{0.25em}
    \hrule
    \vspace{1em}
} 
