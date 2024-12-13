% ----------------------------------------------------------------------------
% Szablon prac dyplomowych na Wydziale Elektrycznym PW, zgodny z obowiązującymi
% Zarządzeniami JM Rektora PW:
% 57/2016, 42/2020, 109/2021, 3/2022 oraz 4/2022.
% ----------------------------------------------------------------------------
% Spełnione wszystkie zasady wymagane:
%  - druk dwustronny (twoside, openright) na A4
%  - numeracja stron um ieszczona u dołu po zewnętrznej stronie z odbiciem
%  lustrzanym na stronach parzystych i nieparzystych
%  - podrozdziały do trzech poziomów - kontrola po stronie autora pracy
%  dyplomowej
% ----------------------------------------------------------------------------
% Większość zasad zalecanych zgodnie z zaleceniami.
% Główne różnice - dla poprawy czytelności pracy:
%   * zwiększone światło międzywierszowe (interlinia 1.46557 zamiast 1.15)
%   * wyróżniające się nagłówki rozdziałów
%   * wyróżnione kolorem, klikalne odnośniki
% ----------------------------------------------------------------------------
% Dziękuję innym Autorom, na których szablonach mogłem się wzorować:
% prof. dr hab. inż. Jacek Starzyński, Wydział Elektryczny, PW
% Artur M. Brodzki i Piotr Woźniak, Wydział EiTI, PW
% ----------------------------------------------------------------------------
% Licencja szablonu: CC-BY 4.0
% https://creativecommons.org/licenses/by/4.0/
% Możesz edytować ten plik, jeśli Cię to nie przeraża ;)
% ----------------------------------------------------------------------------
% Aktualna wersja szablonu dostępna na GitHubie:
% https://github.com/SP5LMA/EE-dyplom
% Autor: Łukasz Makowski <lukasz.makowski.ee@pw.edu.pl>
% ----------------------------------------------------------------------------

\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{diploma}[2024/12/01 PhD Thesis Diploma at WUT]

\LoadClass[a4paper,11pt,twoside,openright]{book}
% Alternatywnie: 12 pt
%\LoadClass[a4paper,12pt,twoside,openright]{book}

% -------------------------------------------------------------------
% Możliwość kompilacji przez pdflatex i xelatex
% -------------------------------------------------------------------
% -------------------------------------------------------------------
% Zdefiniowanie parametru klasy
% -------------------------------------------------------------------
\RequirePackage{kvoptions}
\SetupKeyvalOptions{family=diploma.cls, prefix=pw}
\ProcessKeyvalOptions*


\newcommand{\locallang}{EN}

% -------------------------------------------------------------------
% Wykaz symboli i skrótów
% Pakiet musi być wczytany przed mathspec
% -------------------------------------------------------------------

\usepackage[T1]{fontenc}
\RequirePackage{inputenc}
\RequirePackage[acronym,symbols,nopostdot]{glossaries}
\setglossarysection{section}
\makeglossaries
\loadglsentries{sections/0_glossary}
\newcommand{\acronymstitle}{List of Abbreviations and Symbols}

% -------------------------------------------------------------------
% Krój pisma w XeLaTeX
% Zalecane: krój bezszeryfowy (sfdefault)
% Symbole matematyczne
% Specyfikacja kroju pisma
% Lista krojów pisma (aka "czcionek") w Overleaf:
% https://www.overleaf.com/learn/latex/Questions/Which%20OTF%20or%20TTF%20fonts%20are%20supported%20via%20fontspec%3F
% Lista krojów typowo dostępnych w LaTeX:
% https://tug.org/FontCatalogue/
% -------------------------------------------------------------------

\RequirePackage{mathtools}
\RequirePackage{amsmath}
\RequirePackage{amssymb}
\RequirePackage{mathspec} % wczytuje również fontspec
% \setmainfont{Latin Modern Roman}
% \setromanfont{Latin Modern Roman}
% \setsansfont{Latin Modern Sans}
% \setmonofont{Latin Modern Mono}
% \setmathrm{Latin Modern Math}
% \setmathfont(Digits,Latin)[Scale=MatchLowercase]{Latin Modern Math}

\RequirePackage{tocloft}
\renewcommand{\cftpartleader}{\cftdotfill{\cftdotsep}} % for parts
\renewcommand{\cftchapleader}{\cftdotfill{\cftdotsep}} % for chapters
%\renewcommand{\cftsecleader}{\cftdotfill{\cftdotsep}} % for sections, if you really want! (It is default in report and book class (So you may not need it).


% -------------------------------------------------------------------
% Podstawowa konfiguracja XeLaTeX
% -------------------------------------------------------------------

% -------------------------------------------------------------------
% Lokalizacja XeLaTeX % PL-EN
% Musi być wczytana na początku
% -------------------------------------------------------------------
% \RequirePackage[MeX]{polski}


\RequirePackage{xltxtra}
\RequirePackage{polyglossia}
% \ifnum\strcmp{\locallang}{PL} = 0 
%     \setdefaultlanguage{polish}
% \else
%     \setdefaultlanguage{english}
% \fi
% \setotherlanguage{polish}
\setotherlanguage{english}
\setdefaultlanguage{english}
% \setotherlanguage{latin}
% -------------------------------------------------------------------
% Wymiary strony
% Zalecane:
%   margines wewnętrzny 30 mm,
%   margines zewnętrzny 20 mm,
%   marginesy górny i dolny 20 mm
% -------------------------------------------------------------------
\RequirePackage[a4paper,
    includehead,
    includefoot,
    inner=30mm,
    outer=20mm,
    vmargin=25mm]
{geometry}
% Do debugowania wymiarów
%\RequirePackage{showframe}

% -------------------------------------------------------------------
% Odstęp międzywierszowy
% Zalecane: interlinia 1,15
% -------------------------------------------------------------------
\RequirePackage{setspace}
% -------------------------------------------------------------------
% Alternatywnie supergęsty tekst: lineskip 12 pt gdy stopień pisma 12 pt
%\setstretch{0.8333333} % bo LaTeX ma defaultowy współczynnik 1.2
% -------------------------------------------------------------------
% Interlinia 1,15 (0.83333 * 1.15)
%\setstretch{0.9583}
% -------------------------------------------------------------------
% Alternatywnie interlinia 1.2*stopień pisma (standard w LaTeX)
%\singlespacing % == \setstretch{1.0}
% -------------------------------------------------------------------
% Alternatywnie superzłoty podział (0.83333 * 1.46557)
\setstretch{1.2213}
% -------------------------------------------------------------------
% Alternatywnie interlinia 1.5
%\onehalfspacing % == \setstretch{1.25} 1.25*1.2=1.5
% -------------------------------------------------------------------
% Alternatywnie złoty podział (odstęp 1.618):
%\setstretch{1.348333}
% -------------------------------------------------------------------
% Alternatywnie podwójna interlinia
%\doublespacing

% -------------------------------------------------------------------
% Nagłówki i stopki stron
% Wymagane: numery stron w zewnętrznych,
% dolnych narożnikach.
% -------------------------------------------------------------------
\RequirePackage{fancyhdr}
\fancyhf{}
\fancypagestyle{plain}{ %
    \fancyhf{}
    \renewcommand{\headrulewidth}{0pt}
    \renewcommand{\footrulewidth}{0pt}
    \fancyfoot[RO,LE]{\thepage}
}
\fancypagestyle{headings}{
    \fancyhf{}
    \renewcommand{\headrulewidth}{1pt}
    \fancyheadoffset{0cm}
    \fancyhead[LE]{\textit{\nouppercase{\leftmark}}}
    \fancyhead[RO]{\textit{\nouppercase{\rightmark}}}
    \fancyfoot[RO,LE]{\thepage}
    \renewcommand{\footrulewidth}{0pt}
    \setlength{\headheight}{16pt}
}
\pagestyle{headings}

% -------------------------------------------------------------------
% Puste strony niech będą naprawdę puste
% -------------------------------------------------------------------
\RequirePackage{emptypage}

% -------------------------------------------------------------------
% Formatowanie akapitów
% Do wyboru: akapit z wcięciem 0,5 cm
% ALBO bez wcięcia z odstępem 4 [?] przed akapitem
% Uwaga: pierwszy akapit rozdziału zawsze jest bez
% wcięcia i jest to prawidłowe, zgodne z zasadami 
% typografii.
% -------------------------------------------------------------------
% Rozwiązanie 1:
\setlength{\parindent}{0.5cm}
\setlength{\parskip}{0em}
% Rozwiązanie 2:
%\setlength{\parindent}{0pt}
%\setlength{\parskip}{4mm}

% -------------------------------------------------------------------
% Odwołania do źródeł (bibliografia)
% Do wyboru: styl numeracyjny wg normy PN (?)
% ALBO styl harwardzki
% -------------------------------------------------------------------
\RequirePackage[
        style=ieee,     % styl numeryczny IEEE prawie jak PN
        sorting=nyt,    % sortowanie spisu po nazwiskach
        citestyle=numeric-comp, % kompaktowe odnośniki numeryczne typu [21-23]
        backref=true,
        natbib=true,
        maxbibnames=99,
        backrefstyle=three,
    ]{biblatex}
\DeclareNameAlias{default}{family-given} % nazwisko na początku
\newcommand{\applybibliography}{
    \phantomsection
    \addcontentsline{toc}{chapter}{Bibliography}
    {
        \sloppy
        \printbibliography
    }
}

% -------------------------------------------------------------------
% Alternatywa - styl harwardzki:
% -------------------------------------------------------------------
% \RequirePackage[numbers,sort&compress]{biblatex}
% % \setlength{\bibsep}{1pt plus 1pt minus 1pt}
% \bibliographystyle{agsm}
% \newcommand{\applybibliography}{
%        \bibliography{main.bib}
% }

% -------------------------------------------------------------------
% Żeby spis treści zawierał to co trzeba
% -------------------------------------------------------------------
\RequirePackage{tocbibind}

% -------------------------------------------------------------------
% Numeracja tabel i rysunków
% Do wyboru: ciągła w całej pracy
% ALBO kolejna w rozdziałach
% -------------------------------------------------------------------
% Rozwiązanie 1: ciągła w pracy
\RequirePackage{chngcntr}
\counterwithout{figure}{chapter}
\counterwithout{table}{chapter}
\counterwithout{equation}{chapter}
% Rozwiązanie 2: kolejna w rozdziałach
% To standard - wystarczy zakomentować powyższe

% -------------------------------------------------------------------
% Tytuły tabel i podpisy rysunków
% Zalecenie: 9 pt, "justowany do lewej strony" (?)
% -------------------------------------------------------------------
% Gdy główny stopień pisma to 11 pt wtedy footnotesize daje 9 pt 
%\RequirePackage[format=plain, labelfont=bf, labelsep=period, 
%            font=footnotesize, justification=RaggedRight]
%        {caption}
% Alternatywnie: 10 pt gdy główny to 11 pt i 11 pt gdy główny to 12 pt
\RequirePackage[format=plain, labelfont=bf, labelsep=period,
            font=small, justification=justified]
        {caption}
\RequirePackage{subcaption}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Ustawienia typografii
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% -------------------------------------------------------------------
% Kontrola wdów i sierot
% -------------------------------------------------------------------
\widowpenalty 20000
\clubpenalty 20000
\raggedbottom

% -------------------------------------------------------------------
% Przenoszenie wyrazów do nowej linii
% -------------------------------------------------------------------
\pretolerance 1000
\hyphenpenalty 1000
\tolerance 2000
\emergencystretch .618em
\righthyphenmin 4
\lefthyphenmin 4

% -------------------------------------------------------------------
% Znaki cytowania % PL-EN
% -------------------------------------------------------------------
\RequirePackage{csquotes}
% \setquotestyle[guillemets]{polish}
\setquotestyle{english}

% -------------------------------------------------------------------
% Klikalne linki
% -------------------------------------------------------------------
\RequirePackage{hyperref}
\hypersetup{ % Na bazie https://en.wikibooks.org/wiki/LaTeX/Hyperlinks
%    bookmarks=true,         % show bookmarks bar? FIXME
    unicode=true,           % non-Latin characters in Acrobat’s bookmarks
    pdftoolbar=true,        % show Acrobat’s toolbar?
    pdfmenubar=true,        % show Acrobat’s menu?
    pdffitwindow=false,     % window fit to page when opened
    pdfstartview={FitH},    % fits the width of the page to the window
%    pdfsubject={}, % subject of the document
%    pdfkeywords={}, % list of keywords
    linktoc=all,            % defines which part of an entry in the table 
                            %of contents is made into a link (none,section,page,all)
    pdfnewwindow=true,      % links in new PDF window
    colorlinks=true,        % false: boxed links; true: colored links
    linkcolor=EEBlueDark,   % color of internal links (change box color with linkbordercolor)
    citecolor=EEBlueDark,   % color of links to bibliography
    filecolor=EEBlueDark,   % color of file links
    urlcolor=EEBlueDark,    % color of external links
    linkbordercolor={1 0 0},     % color of frame around internal links (if colorlinks=false)
    citebordercolor={0 1 0},     % color of frame around citations
    urlbordercolor={0 1 1},     % color of frame around URL links 
    breaklinks=true,        % allow links to break over lines
}


% -------------------------------------------------------------------
% Wypełniacze do testowania typografii
% -------------------------------------------------------------------
\RequirePackage{lipsum}
\RequirePackage{bredzenie}

% -------------------------------------------------------------------
% Formatowanie tabel
% -------------------------------------------------------------------
\RequirePackage{multirow}
\RequirePackage{multicol}
\RequirePackage{longtable}
\RequirePackage{colortbl}

% -------------------------------------------------------------------
% Kolory
% -------------------------------------------------------------------
\RequirePackage[dvipsnames]{xcolor}
\definecolor{mysamplecolor}{rgb}{0.123, 0.456, 0.789}
% Kolory wydziałów "budowlanych"
\definecolor{bud}{RGB}{106, 186, 156}

% Kolory wydziałów "mechanicznych"
\definecolor{mech}{RGB}{234, 124, 90}

% Kolory wydziałów "chemicznych"
\definecolor{chem}{RGB}{254, 213, 66}

% Kolory wydziałów "elektrycznych"
\definecolor{elek}{RGB}{120, 150, 207}

% Kolory wydziałów "matematyczno-fizycznych"
\definecolor{mfiz}{RGB}{150, 95, 119}

% Kolory wydziałów "multidyscyplinarnych"
\definecolor{multi}{RGB}{180, 160, 170}

% Kolor Wydziału Elektrycznego i dwa pokrewne monochromatyczne.
% Kolor podstawowy jest tu określony w przybliżeniu, gdyż 
% Zarządzenie definiuje go niejednoznacznie. Dla wskazanego 
% Pantone 2716C i 2716U podane wartości CMYK (50, 30, 0, 0) 
% są inne niż podaje to Pantone na swej stronie www (38, 26, 0, 0).
\definecolor{EEBlue}{cmyk}{0.50, 0.30, 0, 0}            % #8ba5d3 
\definecolor{EEBlueLight}{cmyk}{0.14, 0.04, 0.03, 0}    % #e2ecf8
\definecolor{EEBlueDark}{cmyk}{0.73, 0.55, 0.35, 0.32}  % #45536a
% Uzupełniający dla EEBlue - pomarańczowy
\definecolor{EEOrange}{cmyk}{0.02, 0.41, 0.94, 0}       % #f6a307
% Uzupełniające bliskie dla EEBlue, 10 stopni na kole barw
\definecolor{EETangerine}{RGB}{255, 119, 0}
\definecolor{EEGold}{RGB}{255, 209, 0}
\definecolor{EEAzure}{RGB}{0, 136, 255}
\definecolor{EEUltramarine}{RGB}{0, 46, 255}

% -------------------------------------------------------------------
% Ścieżki do grafik
% -------------------------------------------------------------------
\RequirePackage{graphicx}
\graphicspath{{assets/}{assets/gfx/}}

% -------------------------------------------------------------------
% Listingi programów
% -------------------------------------------------------------------
\RequirePackage{listings}
\lstdefinestyle{EEStyle}{
    backgroundcolor=\color{white},
    commentstyle=\color{EEBlueDark},
    keywordstyle=\bfseries\color{EEUltramarine},
    numberstyle=\tiny\color{EEBlue},
    stringstyle=\color{EETangerine},
    basicstyle=\ttfamily\small,
    breakatwhitespace=false,
    breaklines=true,
    captionpos=b,
    keepspaces=true,
    numbers=left,
    firstnumber=1, % 2
    stepnumber=1,  % 5
    numbersep=5pt,
    showspaces=false,
    showstringspaces=false,
    showtabs=false,
    tabsize=2,
    frame=lB,
    frameround=tttt,
    inputpath=src
}
\lstset{style=EEStyle}

% -------------------------------------------------------------------
% Ozdobniki ścieżek plików, menu i klawiszy
% -------------------------------------------------------------------
\RequirePackage[os=win]{menukeys}
\renewmenumacro{\menu}[>]{roundedmenus}
\renewmenumacro{\directory}{pathswithfolder}
\renewmenumacro{\keys}{shadowedroundedkeys}


% -------------------------------------------------------------------
% Dodatki
% -------------------------------------------------------------------
\RequirePackage{etoolbox}
%\RequirePackage[titletoc]{appendix}
\newcommand{\appendiceslisttitle}{List of Appendices}
\newcommand{\appendixprefix}{Appendix}
\renewcommand{\appendixname}{\appendixprefix}
\let\appendixname\appendixprefix

% -------------------------------------------------------------------
% Stopnie pisma tytułów
% Zalecenie: wielkości 14 [?], 13 [?], 12 [?]
% odpowiednio dla poziomów I, II i III
% -------------------------------------------------------------------
%\RequirePackage{titlesec}
%\titleformat{\chapter}[display]
%  {\fontsize{18pt}{48pt}\selectfont \bfseries}
%  {\chaptertitlename\ \thechapter}{1em}
%  {\fontsize{14pt}{0pt}\selectfont \bfseries}
%\titleformat{\section}[hang]
%  {\fontsize{13pt}{18pt}\selectfont \bfseries}
%  {\thesection}{1em}{}
%\titleformat{\subsection}[hang]
%  {\fontsize{12pt}{15pt}\selectfont \bfseries}
%  {\thesubsection}{1em}{}
% Alternatywne rozwiązanie:
% LaTeX robi to dobrze więc po co zmieniać?

% -------------------------------------------------------------------
% Wyliczenia
% Zalecenie: tylko kropka lub myślnik
% -------------------------------------------------------------------
% \newlength\docparskip
% \setlength{\docparskip}{\parskip}
% \setlist[itemize,1]{nosep,
%         label=$\bullet$,    % ustawiony krój ma kwadratowe kropki
% }
% \setlist[itemize,2]{nosep,label=--}
% \setlist[itemize,3]{nosep,label=-}
% \setlist[itemize,4]{nosep,label=$\cdot$}
%\setlist[description]{font=\normalfont, labelwidth=3em}

% -------------------------------------------------------------------
% Przypisy dolne
% -------------------------------------------------------------------
% Standardowo zgodne z zaleceniami

% -------------------------------------------------------------------
% W celu umieszczenia PDF z "Oświadczeniami"
% -------------------------------------------------------------------
\RequirePackage{tikz}
%\RequirePackage[absolute,overlay]{textpos}

\newcommand{\grantlicense}[1]{
    \newcommand{\@grantlicense}{#1}
}


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Here be dragons...
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% STRONA TYTUŁOWA
% Here be dragons...
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\newcommand{\instytut}[1]{
    \newcommand{\@instytut}{#1}
}
\newcommand{\kierunek}[1]{
    \newcommand{\@kierunek}{#1}
}
\newcommand{\dyscyplina}[1]{
    \newcommand{\@dyscyplina}{#1}
}
\newcommand{\specjalnosc}[1]{
    \newcommand{\@specjalnosc}{#1}
}
\newcommand{\album}[1]{
    \newcommand{\@album}{#1}
}
\newcommand{\promotor}[1]{
    \newcommand{\@promotor}{#1}
}
\newcommand{\promotorpomocniczy}[1]{
    \newcommand{\@promotorpomocniczy}{#1}
}
\newcommand{\engtitle}[1]{
    \newcommand{\@engtitle}{#1}
}
\newcommand{\longdate}[1]{
    \newcommand{\@longdate}{#1}
}

\newcommand{\frontpageheader}{mschead.png}

\newcommand{\kieruneklocal}{in~the~field~of~study }
\newcommand{\dyscyplinalocal}{in~the~discipline~of }
\newcommand{\specjalnosclocal}{and~specialisation }
\newcommand{\titlelocal}{\@engtitle }
\newcommand{\albumlocal}{student record book number }
\newcommand{\promotorlocal}{supervisor }
\newcommand{\promotorpomocniczylocal}{assistant supervisor }
\newcommand{\citylocal}{WARSZAWA }


\let\oldmaketitle\maketitle
\renewcommand{\maketitle}{
    \linespread{1.15}
    \thispagestyle{empty}
    \begin{center}
        \begin{minipage}[c]{0.8\textwidth}
            {
                \setmainfont{Adagio Slab}
                \fontsize{23pt}{23pt}\selectfont
                Warsaw University of Technology
            }
            \vskip 2em
            {
                \setmainfont{Adagio Slab}
                \addfontfeature{LetterSpace=2.0} 
                \fontsize{12pt}{12pt}\selectfont
                FACULTY OF ELECTRONICS AND INFORMATION TECHNOLOGY
            }
        \end{minipage}
        \hfill{}
        \begin{minipage}[c]{25mm}
            \includegraphics[width=\linewidth]{assets/gfx/logo-PW.png}
        \end{minipage}

        \vskip 6em
        % \includegraphics[width=\linewidth]{\frontpageheader}
        {
            \setmainfont{Adagio Slab Light}
            \fontsize{43pt}{43pt}\selectfont
            PhD Thesis
        }
        \vskip 4em
        {
            \setmainfont{Helvetica Light}
            \fontsize{12pt}{12pt}\selectfont
            \dyscyplinalocal \@dyscyplina
        }
        \vskip 5em
        {
            \setmainfont{Helvetica Light}
            \fontsize{14pt}{14pt}\selectfont
            \titlelocal \\
        }
        \vskip 5em
        {
            \setmainfont{Helvetica}
            \fontsize{21pt}{21pt}\selectfont
            \@author \\
        }
        {
            \setmainfont{Helvetica Light}
            \fontsize{12pt}{16pt}\selectfont
            % \albumlocal \@album
            \vskip 2em
            \promotorlocal\\\@promotor
            \vskip 2em
            \promotorpomocniczylocal\\\@promotorpomocniczy
        \vfill
        \citylocal \@date
        }
    \end{center}
    \cleardoublepage
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% streszczenie, abstract
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\newcommand{\streszczeniepracy}[1]{
    \newcommand{\@streszczeniepracy}{#1}
}
\newcommand{\slowakluczowe}[1]{
    \newcommand{\@slowakluczowe}{#1}
}
\newcommand{\thesisabstract}[1]{
    \newcommand{\@thesisabstract}{#1}
}
\newcommand{\thesiskeywords}[1]{
    \newcommand{\@thesiskeywords}{#1}
}
\newcommand{\thesisacknowledgements}[1]{
    \newcommand{\@thesisacknowledgements}{#1}
}
\newcommand{\thesislaysummary}[1]{
    \newcommand{\@thesislaysummary}{#1}
}
\newcommand{\thesisarticles}[1]{
    \newcommand{\@thesisarticles}{#1}
}

% Streszczenie polskie
\newcommand{\stronastreszczenia}{
    \thispagestyle{empty}
    \chapter*{Streszczenie}
    \addcontentsline{toc}{chapter}{Streszczenie}
    \thispagestyle{empty}
    \@streszczeniepracy
    
    \vskip 2em
    \noindent\textbf{Słowa kluczowe: }
    \@slowakluczowe
    \clearpage
}

% Abstract angielski
\newcommand{\abstractpage}{
    \chapter*{Abstract}
    \addcontentsline{toc}{chapter}{Abstract}
    \thispagestyle{empty}
    % \begin{center}
    %     \textbf{\large\@engtitle}
    %     \vskip 1em

    %     \textbf{Abstract}
    % \end{center}
    \@thesisabstract
    
    \vskip 2em
    \noindent\textbf{Keywords: }
    \@thesiskeywords
    \clearpage
}

\newcommand{\acknowledgements}{
    \chapter*{Acknowledgements}
    \addcontentsline{toc}{chapter}{Acknowledgements}
    \thispagestyle{empty}
    \@thesisacknowledgements
    \cleardoublepage
}
\newcommand{\laysummary}{
    \chapter*{Lay Summary}
    \addcontentsline{toc}{chapter}{Lay Summary}
    \thispagestyle{empty}
    \@thesislaysummary
    \cleardoublepage
}
\newcommand{\articles}{
    \chapter*{Publications in this thesis}
    \addcontentsline{toc}{chapter}{Publications in this thesis}
    \thispagestyle{empty}
    \@thesisarticles
    \cleardoublepage
}
% Spięcie stron streszczeń we właściwej
% kolejności w jedno polecenie.
\newcommand{\abstractpages}{
    \abstractpage
    \stronastreszczenia
}


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Oświadczenia o autorstwie
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\newcommand{\authorship}{
    \begin{tikzpicture}[remember picture, overlay]
        \node [anchor=north west, inner sep=0pt] at (current page.north west)
        {{\includegraphics[width=\paperwidth]{assets/gfx/oswiadczenieEN-2021-109.pdf}};};
        \node[anchor=north west, inner sep=0pt] at(10.4, -1.4) {Warszawa \@longdate};
        \node[anchor=north west, inner sep=0pt] at(-0.8, -2.6) {\@author};
        \node[anchor=north west, inner sep=0pt] at(-0.8, -3.9) {\@album};
        \node[anchor=north west, inner sep=0pt] at(-0.8, -5.2) {\@kierunek};
        \node[anchor=north east, inner sep=0pt] at(13.8, -19.6) {\@author};
    \end{tikzpicture}
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Oświadczenia o licencji
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\newcommand{\licensedthesis}{
        % podstawowe dane w wersji angielskiej
        \begin{tikzpicture}[remember picture, overlay]
            \node [anchor=north west, inner sep=0pt] at (current page.north west)
            {{\includegraphics[width=\paperwidth]{assets/gfx/licencjaEN-2021-109.pdf}};};
            \node[anchor=north west, inner sep=0pt] at(11.4, -1.7) {Warszawa \@longdate};
            \node[anchor=north west, inner sep=0pt] at(-0.8, -2.95) {\@author};
            \node[anchor=north west, inner sep=0pt] at(-0.8, -4.21) {\@album};
            \node[anchor=north west, inner sep=0pt] at(-0.8, -5.45) {\@kierunek};
            \node[anchor=north east, inner sep=0pt] at(14.9, -19.5) {\@author};
		\node[anchor=south west, inner sep=0pt] at(9.4, -11.7) {\resizebox*{7cm}{1em}{\@title}};
		\node[anchor=south west, inner sep=0pt] at(10.2, -13.95) {\resizebox*{1.5cm}{1em}{\@engtitle}};
        \end{tikzpicture}
	% przekreślenia w wersji angielskiej
	% skreślenie "współautora" - TODO: prace wieloautorskie
	\begin{tikzpicture}[remember picture, overlay]
		\draw[thick] (3.5,-11.6) -- (5.3,-11.6);
		\draw[thick] (3.9,-13.8) -- (5.4,-13.8);
	\end{tikzpicture}
	% skreślenia nieudzielenia licencji
	% \ifnum\strcmp{\@grantlicense}{TRUE} = 0
	% \begin{tikzpicture}[remember picture, overlay]
	% 	\draw[thick] (.2,-12.05) -- (2.6,-12.05);
	% 	\draw[thick] (12.8,-13.8) -- (14.6,-13.8);
	% \end{tikzpicture}
	% \else % skreślenia udzielenia licencji XD
	\begin{tikzpicture}[remember picture, overlay]
		\draw[thick] (-1.3,-12.05) -- (.1,-12.05);
		\draw[thick] (11.9,-13.8) -- (12.7,-13.8);
	\end{tikzpicture}
	% \fi
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Jedno polecenie - kombajn stron początkowych
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\AtBeginDocument{\addtocontents{toc}{\protect\thispagestyle{empty}}} 
\newcommand{\frontpages}{
    \frontmatter
    \counterwithout{lstlisting}{chapter} % hack niestety
    \pagestyle{empty}
    \maketitle
    \acknowledgements
    \abstractpages
    \laysummary
    \articles
% Zgodnie z Zarządzeniem JM Rektora 3/2022, oświadczenia o autorstwie i
% opcjonalne oświadczenie o udzieleniu licencji składane są w systemie USOS
% APD.
% Zgodnie z Zarządzeniem JM Rektora 4/2022 załącznik 1, układ pracy nie obejmuje
% oświadczenia o autorstwie i udzielenia licencji BG PW.
%    \authorship
%    \licensedthesis
    \tableofcontents
    \pagestyle{headings}
    \mainmatter
}

\newcommand{\documentpreface}{%
% Headers
\frontpages

\acronymslist
% % % Spis rysunków
\listoffigures
% % % Spis tabel
\listoftables
 }

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Lista skrótów i symboli
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\newcommand{\acronymslist}{
    \chapter*{\acronymstitle}
    \pagestyle{plain}
    \addcontentsline{toc}{chapter}{\acronymstitle}
    \printglossary[type=\acronymtype,title={}]
    \printglossary[type=symbols,title={}]
    % Alternatywna lista symboli - do użycia tylko w Overleaf
    %\input{symbols}
}   %

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Załączniki i ich lista
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\newcounter{easyappendix}[chapter]
\newenvironment{easyappendix}[1]{
    \refstepcounter{easyappendix}
    \addcontentsline{app}{chapter}{\hspace{1em}\theeasyappendix\hspace{1em} #1\dotfill}
    \par\bigskip
    \Huge{\textbf{\appendixname~\theeasyappendix}}
    \par\medskip
    \Huge{\textbf{#1}}
    \par\bigskip
    \normalsize
}{}
\newcommand\easyappendices{
    \let\appendixname\appendixprefix
    \chapter*{\appendiceslisttitle}
    \addcontentsline{toc}{chapter}{\appendiceslisttitle}
    \@starttoc{app}
    \input{sections/X_appendices}
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Jedno polecenie - kombajn stron końcowych (bez bibliografii)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\newcommand{\tailpages}{
    % wykaz symboli i skrótów
    \acronymslist

    % spis rysunków
    \listoffigures

    % spis tabel
    \listoftables

    \easyappendices
}

\RequirePackage{xspace}

% already, then \xspace.
\makeatletter
\DeclareRobustCommand\onedot{\futurelet\@let@token\@onedot}
\def\@onedot{\ifx\@let@token.\else.\null\fi\xspace}

\def\eg{\emph{e.g}\onedot} \def\Eg{\emph{E.g}\onedot}
\def\ie{\emph{i.e}\onedot} \def\Ie{\emph{I.e}\onedot}
\def\cf{\emph{cf}\onedot} \def\Cf{\emph{Cf}\onedot}
\def\etc{\emph{etc}\onedot} \def\vs{\emph{vs}\onedot}
\def\wrt{w.r.t\onedot} \def\dof{d.o.f\onedot}
\def\iid{i.i.d\onedot} \def\wolog{w.l.o.g\onedot}
\def\etal{\emph{et al}\onedot}
\makeatother

\AtEndPreamble{
    \usepackage[capitalize]{cleveref}
    \crefname{section}{Sec.}{Secs.}
    \Crefname{section}{Section}{Sections}
    \Crefname{table}{Table}{Tables}
    \crefname{table}{Tab.}{Tabs.}
    \Crefname{enumerate}{Item}{Items}
    \crefname{enumerate}{}{}
}

% ---------------------------------------------------------------

%% More compact compact itemize/enumeration (e.g. list contributions)
\RequirePackage[shortlabels,inline]{enumitem}
% \setlist[itemize]{noitemsep,leftmargin=*,topsep=0em}
% \setlist[enumerate]{noitemsep,leftmargin=*,topsep=0em}
