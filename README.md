# `examreport`

This repository provides a LaTeX template [`examreport.cls`](https://github.com/Nelorth/examreport/blob/master/examreport.cls) for exam reports managed by the FSinfo student committee of computer science and mathematics at the University of Passau.

## Usage

A minimal example [`examreport.tex`](https://github.com/Nelorth/examreport/blob/master/examreport.tex) employing the template looks as follows:

```latex
% step 1: define exam characteristics
\newcommand{\authors}{Wazlaf Wttlbrmft} % authors of this transcript
\newcommand{\lecture}{Great Lecture II} % lecture title
\newcommand{\semester}{WS 2021/22} % semester and year
\newcommand{\chair}{Chair of Applied Joy} % responsible chair
\newcommand{\lecturer}{Prof. Dr. Nathan Expla} % lecturer
\newcommand{\tutors}{Dr. Alan Tutor} % tutors, if applicable
\newcommand{\duration}{1337} % exam duration in minutes
\newcommand{\maxpoints}{42} % total number of attainable points
\newcommand{\aids}{Pen and brain} % permitted aids, if applicable

% step 2: load template with desired language (english or german)
\documentclass[english]{examreport}

% step 3: record the exam questions
\begin{document}
  \begin{examreport}
    \begin{task}[title = Optional title, points = 42]
      Complete this task.
      \begin{enumerate}[(a)]
        \item Prove that there exists a field where \(1 + 3 + 3 + 7 = 0\).
        \item Give the answer to life, the universe, and everything.
      \end{enumerate}
    \end{task}
  \end{examreport}
\end{document}
```

As you can see, using the template consists of three main steps:

1. First, we specify several characteristics about the exam. Since LaTeX key-value class options do not play well with rich text, they need to be defined as commands.
2. Second, we load the template class while specifying the exam's language. It will be applied to all boilerplate text. Currently supported are "english" and "german".
3. Third, we record the actual exam questions using the provided `task` environment. It optionally takes a task title and the number of attainable points.

The compiled result of the above example is [`examreport.pdf`](https://github.com/Nelorth/examreport/blob/master/examreport.pdf).