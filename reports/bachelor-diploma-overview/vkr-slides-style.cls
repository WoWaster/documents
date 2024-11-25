% Стиль для презентаций ВКР СПбГУ. Выполнен в почти корпоративных цветах и с корпоративной символикой.
\ProvidesClass{vkr-slides-style}[2023/11/12 version 1.00 SPbU qualification work presentation slides]
\NeedsTeXFormat{LaTeX2e}

\ProcessOptions\relax

% Грузим базовый класс документа, хотим в качестве компилятора XeTeX и соотношение сторон 16 на 9 (это лучше для онлайн-демонстраций)
\LoadClass[xetex,aspectratio=169]{beamer}

% Выставляем шрифты.
\usepackage{fontspec}
\setmainfont{CMU Serif}
\setsansfont{CMU Sans Serif}
\setmonofont{CMU Typewriter Text}

% Выставляем язык презентации.
\usepackage{polyglossia}
\setdefaultlanguage{russian}
\setotherlanguage{english}

% "Адекватная" работа с математикой в LaTeX
\usepackage{amsmath, amsfonts, amssymb, amsthm, mathtools}

% Всякие полезные пакеты — таблицы, размер текста ssmall.
\usepackage{multirow}
\usepackage{tabu}
\usepackage{moresize}

%% Пакеты для оформления алгоритмов на псевдокоде.
\usepackage[noend]{algpseudocode}
\usepackage{algorithm}
\usepackage{algorithmicx}

\usepackage{fancyvrb}

% Пакет minted для вёрстки листингов кода с синтаксической подсветкой. Говорим ему не подсвечивать лексические ошибки.
\usepackage{minted}
\makeatletter
\AtBeginEnvironment{minted}{\dontdofcolorbox}
\def\dontdofcolorbox{\renewcommand\fcolorbox[4][]{##4}}
\makeatother

% Подсветка гиперссылок.
\definecolor{links}{HTML}{2A1B81}
\hypersetup{colorlinks,linkcolor=,urlcolor=links}

% Общая цветовая схема презентации.
\usecolortheme{rose}
\useinnertheme[shadow=true]{rounded}
\useoutertheme[footline=authorinstitutetitle]{miniframes}
\usecolortheme{beaver}
\useoutertheme{infolines}

% Убираем бесполезные кнопки навигации по слайдам справа внизу.
\beamertemplatenavigationsymbolsempty

% Добавляем вертикального пространства в таблицы, чтобы они выглядели симпатичнее.
\tabulinesep=1.2mm

% Определяем дополнительную команду \attribution{Автор рисунка} для удобного указания автора исходного... чего-то (например, рисунка).
\newcommand{\attribution}[1] {
    \begin{flushright}\begin{scriptsize}\textcolor{gray}{\copyright\ #1}\end{scriptsize}\end{flushright}
}

% Пакет для удобного выставления названия, имени автора и т.п. на титульном слайде
\usepackage{xkeyval}

% Объявление параметров.
\makeatletter
\define@key{mytitle}{author}{\def\my@title@author{#1}}
\define@key{mytitle}{authorShort}{\def\my@title@authorShort{#1}}
\define@key{mytitle}{title}{\def\my@title@title{#1}}
\define@key{mytitle}{titleShort}{\def\my@title@titleShort{#1}}
\define@key{mytitle}{advisor}{\def\my@title@advisor{#1}}
\define@key{mytitle}{consultant}{\def\my@title@consultant{#1}}
\define@key{mytitle}{date}{\def\my@title@date{#1}}

% Команда \filltitle, которой в фигурных скобках указываются параметры, введённые выше.
\newcommand{\filltitle}[1]{
    \setkeys{mytitle}{#1}

    \author[\my@title@authorShort]{\vspace{-20pt}\my@title@author}
    \title[\my@title@titleShort]{\my@title@title}
    \institute[СПбГУ]{}
    \date{\my@title@date}
}

% Команда, которая сверстает титульный слайд по параметрам, указанным в \filltitle.
% С убогой абсолютной вёрсткой, но как умеем.
\newcommand{\makeslidestitle}{
    % plain убирает элементы оформления, которые на титульном слайде неуместны.
    \begin{frame}[plain]
        % Лого университета или организации, отображается в шапке титульного листа
        \includegraphics[width=1.4cm]{pictures/SPbGU_Logo.png}
        \vspace{-45pt}
        \hspace{-10pt}
        \begin{center}
            \begin{tabular}{c}
                \scriptsize{Санкт-Петербургский государственный университет} \\
                \scriptsize{Кафедра системного программирования}
            \end{tabular}
            \vspace{15pt}
            \titlepage
        \end{center}

        {\scriptsize
        % У научного руководителя должна быть указана научная степень
        \textbf{Научный руководитель:} \my@title@advisor \\
        % Консультанта может и не быть. Должна быть указана должность и ученая степень, если есть
        \ifthenelse{\equal{\my@title@consultant}{}}{}{\textbf{Консультант:}  \my@title@consultant} \\
        }
        \begin{center}
            \vspace{-5pt}
            \scriptsize{Санкт-Петербург\\
                \the\year}
        \end{center}
    \end{frame}
}
\makeatother
