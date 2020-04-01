\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{math135}[2020/01/21 Physics 84: Quantum Information]

\LoadClass{article}
\PassOptionsToClass{article}{10pt}

\RequirePackage{geometry}
\geometry{
  left=1in,
  right=1in,
  top=.25in,
  bottom=.5in,
  includeheadfoot,
}

\RequirePackage{titling}
\RequirePackage{lastpage}
\RequirePackage{fancyhdr}
\renewcommand{\title}[1]{\newcommand{\mytitle}{#1}} % titlesec conflict
\newcommand{\pset}[1]{\newcommand{\thepset}{#1}\title{Problem Set \thepset}}
\fancypagestyle{homework}{
  \fancyhf{}
  \renewcommand{\headrulewidth}{0pt}
  \chead{\textbf{\mytitle}\\Physics 84: Quantum Information --- Spring 2020}
  \lhead{\leavevmode{\footnotesize\thedate}\\}
  \rhead{\leavevmode{\footnotesize\theauthor}\\}
  \cfoot{\footnotesize\thepage{} OF \pageref{LastPage}}
}
\pagestyle{homework}

\RequirePackage{titlesec}
\titleformat{\section}[hang]{\large\bfseries}{\thepset.\thesection}{1em/2}{}

\RequirePackage{microtype}
\RequirePackage[T1]{fontenc}
\RequirePackage[ascii]{inputenc}

\RequirePackage{lmodern}
\renewcommand{\familydefault}{\sfdefault}

\RequirePackage{amsmath}
\RequirePackage{amsthm}
\RequirePackage{amssymb}
\RequirePackage{mathtools}
\RequirePackage{thmtools}
%\RequirePackage{mathrsfs}
\RequirePackage{wasysym}
\RequirePackage{esint}
\RequirePackage{textcomp}

\RequirePackage{isomath}
\RequirePackage{centernot}
\RequirePackage{cancel}

\RequirePackage{qcircuit}

\RequirePackage{tikz}
\RequirePackage{pgfplots}

\usetikzlibrary{arrows.meta}
\usetikzlibrary{matrix}
\usetikzlibrary{calc}
\usetikzlibrary{positioning}

\tikzset{
  gate/.style={
    draw,
  },
  ghost/.style={
    draw=none,
    fill=none,
    text=none,
    %opacity=0,
  },
  ctrl/.style={
    circle,
    fill,
    inner sep=0pt,
    minimum size=4pt,
  },
  targ/.style={
    circle,
    draw,
    inner sep=0pt,
    minimum size=8pt,
    path picture={
      \draw
      (current bounding box.south) -- (current bounding box.north)
      (current bounding box.west) -- (current bounding box.east);
    },
  },
  annotation/.style={
    opacity=1/2,
  },
  guide/.style={
    annotation,
    densely dotted,
  },
  quantum circuit/.style={
    matrix of math nodes,
    cells={anchor=center},
    column sep=1em,
  },
  compact/.style={column sep=1em/2},
  box/.style={
    rounded corners=1em/8,
    to path={
      ($ (\tikztostart) + 1/4*(1em,-1em) $) rectangle
      ($ (\tikztotarget) + 1/4*(-1em,1em) $)
    },
  },
}

\pgfplotsset{compat=1.16}
\usepgfplotslibrary{patchplots}

\RequirePackage{parskip}

\RequirePackage{hyperref}

\RequirePackage{mdframed}

\mdfdefinestyle{exercise}{
  linecolor=gray,
  topline=false,
  leftline=false,
  rightline=false,
  innerleftmargin=0pt,
  innerrightmargin=0pt,
  innertopmargin=0pt,
  innerbottommargin=\parskip,
}

\newmdenv[style=exercise]{exercise}

\mdfdefinestyle{solution}{
  skipabove=\parskip,
  hidealllines=true,
  innerleftmargin=0pt,
  innerrightmargin=0pt,
  endcode=\newpage,
}
\newmdenv[style=solution]{solution}

\mdfdefinestyle{book}{
  skipabove=\parskip,
  linecolor=gray,
  hidealllines=true,
  leftline=true,
  linewidth=.25em,
  backgroundcolor=lightgray!25,
}
\newmdenv[style=book]{book}

\mdfdefinestyle{aside}{
  skipabove=\parskip,
  linecolor=gray,
  hidealllines=true,
  leftline=true,
  linewidth=.25em,
}
\renewmdenv[style=aside]{aside}

\RequirePackage[inline]{enumitem}
\newlist{problems}{enumerate}{3}
\setlist[problems, 1]{
  label=(\alph*),
}

%
\newcommand{\QQ}{\mathbb Q}
\newcommand{\DD}{\mathbb D}
\newcommand{\RR}{\mathbb R}
\newcommand{\NN}{\mathbb N}
\newcommand{\FF}{\mathbb F}
\newcommand{\CC}{\mathbb C}
\newcommand{\TT}{\mathbb T}
\newcommand{\ZZ}{\mathbb Z}

\newcommand{\dif}{\mathop{}\!\mathrm d}
\newcommand{\pdif}{\mathop{}\!\partial}
\newcommand{\drv}[3][]{\frac{\dif^{#1} #2}{\dif #3^{#1}}}
\newcommand{\pdrv}[3][]{\frac{\pdif^{#1} #2}{\pdif #3^{#1}}}

\DeclareMathOperator{\diam}{diam}

\DeclareMathOperator{\lspan}{span}

\DeclareMathOperator{\NOT}{NOT}
\DeclareMathOperator{\CNOT}{CNOT}
\DeclareMathOperator{\CCNOT}{CCNOT}
\DeclareMathOperator{\CZ}{CZ}

\DeclarePairedDelimiterX{\braket}[2]{\langle}{\rangle}{{#1} \delimsize\vert {#2}}
\DeclarePairedDelimiterX{\ketbra}[2]{\lvert}{\rvert}{{#1} \delimsize\rangle \delimsize \langle {#2}}
\DeclarePairedDelimiter{\ket}{\lvert}{\rangle}
\DeclarePairedDelimiter{\bra}{\langle}{\rvert}
\DeclarePairedDelimiter{\cbr}{\{}{\}}
\DeclarePairedDelimiter{\set}{\{}{\}}
\DeclarePairedDelimiter{\sbr}{[}{]}
\DeclarePairedDelimiter{\abr}{\langle}{\rangle}
\DeclarePairedDelimiter{\inner}{\langle}{\rangle}
\DeclarePairedDelimiter{\abs}{\lvert}{\rvert}
\DeclarePairedDelimiter{\norm}{\lVert}{\rVert}
\DeclarePairedDelimiter{\prn}{(}{)}
\DeclarePairedDelimiter{\floor}{\lfloor}{\rfloor}
\DeclarePairedDelimiter{\ceil}{\lceil}{\rceil}

\renewcommand{\vec}{\mathbfit}
\newcommand{\mat}{\mathbf}