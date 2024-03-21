\ProvidesClass{scribe-or}[2011/12/23 Scribe]
\LoadClass[a4paper]{article}

%\automata:
\usepackage{tikz}
\usepackage[shortlabels]{enumitem}\usetikzlibrary{automata,positioning}

\usepackage[left=2cm,right=2cm,top=2.5cm,bottom=2.5cm,columnsep=20pt]{geometry}
%\usepackage{geometry}

\usepackage{graphicx}
\usepackage{subfig}
\usepackage{amsmath,amssymb,amsthm}
\usepackage{array}
%\usepackage{natbib}
%\usepackage{align}
%\usepackage{watermark}
%\usepackage{wrapfig}
%\usepackage{titling}
%\usepackage{fancybox}
\usepackage[hidelinks]{hyperref} % For hyperlinks in the PDF
%\usepackage[framemethod=tikz]{mdframed}
%\usetikzlibrary{shadows}
%\newmdenv[shadow=true,shadowcolor=black,font=\sffamily,rightmargin=8pt]{shadedbox}

%\usepackage{multicol} % Used for the two-column layout of the document
%\usepackage[Kashida]{xepersian}
\usepackage{algorithmicx,algorithm}

\usepackage[noend]{algpseudocode}

\usepackage{verbatim}
%\usepackage{eso-pic}
%\usepackage{xecolour}
%\usepackage{xecolour}
%\usepackage{unicode-math}
%\setmathfont{XITS Math}
%\setmathfont[version=setB,StylisticSet=1]{XITS Math}

%----------------------------------------------------------------------------------------
%	Start	Header and Footer
%----------------------------------------------------------------------------------------

\usepackage{fancyhdr} % Headers and footers
%\pagestyle{fancy} % All pages have headers and footers
%\fancyhead{} % Blank out the default header
%\fancyfoot{} % Blank out the default footer
%\fancyhead[C]{{\large{جلسه اول}}\vspace{1mm}} % Custom header text, center
%\fancyhead[R]{
%\includegraphics[width=8mm]{logo.png}
%} % Custom header text, right
%\fancyhead[L]{کاربرد برنامه‌ریزی ریاضی در تولید الگوریتم‌های تقریبی، پاییز ۹۶-۹۷\vspace{1mm}} % Custom header text, left
\fancyfoot[C]{\thepage} % Custom footer text

\thispagestyle{empty}%use empty Style for first page


%----------------------------------------------------------------------------------------
%	End	Header and Footer
%----------------------------------------------------------------------------------------

\usepackage[localise=on]{xepersian}
\settextfont[Scale=1]{Persian Modern}
%\setdigitfont[Scale=1.1]{B Zar}
\setdigitfont[Scale=1.1]{HM XNiloofar}


%Newenvironmen-------------------------------------------------%
\newtheorem{theorem}{قضیه}
\newtheorem*{theorem*}{قضیه}
\newtheorem{corollary}[theorem]{نتيجه}
\newtheorem{proposition}[theorem]{گزاره}
\newtheorem{lemma}[theorem]{لم}
\newtheorem{definition}[theorem]{تعریف}
\newtheorem{example}[theorem]{مثال}
\newtheorem*{question}{سؤال}
\newtheorem{inequality}[theorem]{نامساوی}
\newtheorem{remark}[theorem]{تذکر}
\newtheorem{prob}{تمرین}
\newtheorem{claim}[theorem]{ادعا}
%
\newenvironment{note}{\noindent \textbf{نکته.}}{\newline}
\newenvironment{attention}{\noindent \textbf{توجه.}}{\newline}
\newenvironment{conj}{\noindent \textbf{حدس.}}{\newline}
\newenvironment{quest}{\noindent \textbf{سؤال .}}{\newline}
\newenvironment{notation}{\noindent \textbf{نماد.}}{\newline}

\newtheorem{قضیه}[theorem]{قضیه}
\newtheorem{لم}[theorem]{لم}
\newtheorem{ادعا}[theorem]{ادعا}
\newtheorem{مشاهده}[theorem]{مشاهده‌}
\newtheorem{نتیجه}[theorem]{نتیجه‌}
\newtheorem{مسئله}[theorem]{مسئله}
\newtheorem{تعریف}[theorem]{تعریف}
\newtheorem{مثال}[theorem]{مثال}


\newenvironment{اثبات}
	{\begin{trivlist}\item[\hskip\labelsep{\em اثبات.}]}
	{\leavevmode\unskip\nobreak\quad\hspace*{\fill}{\ensuremath{{\square}}}\end{trivlist}}

\newenvironment{alg}[2]
	{\begin{latin}\settextfont[Scale=1.0]{Times New Roman}
	\begin{algorithm}[t]\caption{#1}\label{algo:#2}\vspace{0.2em}\begin{algorithmic}[1]}
	{\end{algorithmic}\vspace{0.2em}\end{algorithm}\end{latin}}



%------------------------ Algorithm ------------------------------------

\newenvironment{الگوریتم}[1]
	{\bigskip\bigskip\begin{algorithm}\caption{#1} \label{الگوریتم: #1}\vspace{0.5em}\begin{algorithmic}[1]}
	{\end{algorithmic}\vspace{0.5em}\end{algorithm}\bigskip}


\renewcommand{\algorithmicfor}{{به ازای}}
\renewcommand{\algorithmicwhile}{{تا وقتی}}
\renewcommand{\algorithmicdo}{\hspace{-.2em}:}
\renewcommand{\algorithmicif}{{اگر}}
\renewcommand{\algorithmicthen}{\hspace{-.2em}:}
\renewcommand{\algorithmicelse}{{در غیر این صورت:}}
%\renewcommand{\algorithmicelsif}{{در غیر این صورت اگر: }}
\renewcommand{\algorithmicreturn}{{برگردان}}
\renewcommand{\algorithmiccomment}[1]{$\triangleleft$ \emph{#1}}
\renewcommand{\algorithmicrequire}{\textbf{ورودی:}}
\renewcommand{\algorithmicensure}{\textbf{خروجی:}}

\newcommand{\اگر}{\If}
\newcommand{\وگرنه}{\Else}
\newcommand{\وگر}{\ElsIf}
\newcommand{\پایان‌اگر}{\EndIf}
\newcommand{\به‌ازای}{\For}
\newcommand{\پایان‌به‌ازای}{\EndFor}
\newcommand{\تاوقتی}{\While}
\newcommand{\پایان‌تاوقتی}{\EndWhile}
\newcommand{\دستور}{\State}
\newcommand{\دستورک}{\Statex}
\newcommand{\توضیحات}{\Comment}
\newcommand{\برگردان}{\Return}
\renewcommand{\ورودی}{\Require}
\newcommand{\خروجی}{\Ensure}



%----------------------------------------------------------------------------------------
%	Start	TITLE SECTION
%----------------------------------------------------------------------------------------


\def\N{\mathbb{N}}
\def\R{\mathbb{R}}


\newcommand{\lecture}[3]{
   \pagestyle{myheadings} \thispagestyle{plain} \newpage
\setcounter{page}{1} \noindent

\vbox{
	\noindent
	\parbox[m]{0.12\textwidth}{
	\includegraphics[width=0.1\textwidth]{logo.png}\\
	}
	\parbox{0.4\textwidth}{  \bf \baselineskip=1.6em
	\raggedleft
	دانشکده علوم ریاضی \\دانشگاه صنعتی شریف
	}
}
\vspace{7em}
\vbox{
\raggedleft
\bf
{\Huge نظریه زبان ها و اتوماتا  }
\\[1.5em]
{\large دکتر شهرام خزایی}
\\[.5em] {\large \normalfont بهار ۱۴۰۱}
\\[2.5em]
{\huge #2 \\[.5em] {\large \normalfont #1} }
\\[1em]
{\large مهلت تحویل: #3  } \\
}
\vspace{9em}


\baselineskip=1.6em


\pagestyle{fancy} % All pages have headers and footers
\fancyhead{} % Blank out the default header
\fancyfoot{} % Blank out the default footer
\fancyhead[C]{{\scriptsize \bf {#1 - #2}}\vspace{1mm}} % Custom header text, center
\fancyhead[R]{
\includegraphics[width=8mm]{logo.png}
} % Custom header text, right
\fancyhead[L]{{\scriptsize \bf نظریه زبان ها و اتوماتا ، بهار 1401}\vspace{1mm}} % Custom header text, left
\fancyfoot[C]{\thepage} % Custom footer text
}


\graphicspath{{images/}}
\eqcommand{جلسه}{lecture}

\def\size#1{\text{\textbf{size}}(#1)}
\def\error#1{\text{\textbf{error}}(#1)}
\def\C{\mathcal{C}}
\def\H{\mathcal{H}}
\def\E{\mathbb{E}}
\def\Pr{\mathbb{P}r}
\def\Max{\text{بیشینه کن}}
\def\Min{\text{کمینه کن}}
\def\st{\text{\rl{که}}}

%\newenvironment{lp}[3]{
%\begin{equation*}
%\begin{array}{rl@{}l}
%#1 & #2 \\
%#3 & \begin{array}[t]{ll}
%}{
%\end{array}\end{array}
%\end{equation*}
%}
