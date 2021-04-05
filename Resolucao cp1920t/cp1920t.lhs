\documentclass[a4paper]{article}
\usepackage[a4paper,left=3cm,right=2cm,top=2.5cm,bottom=2.5cm]{geometry}
\usepackage{palatino}
\usepackage[colorlinks=true,linkcolor=blue,citecolor=blue]{hyperref}
\usepackage{graphicx}
\usepackage{cp1920t}
\usepackage{subcaption}
\usepackage{adjustbox}
\usepackage{color}
\usepackage{float}
%================= local x=====================================================%
\def\getGif#1{\includegraphics[width=0.3\textwidth]{cp1920t_media/#1.png}}
\let\uk=\emph
\def\aspas#1{``#1"}
%================= lhs2tex=====================================================%
%include polycode.fmt 
%format (div (x)(y)) = x "\div " y
%format succ = "\succ "
%format ==> = "\Longrightarrow "
%format map = "\map "
%format length = "\length "
%format fst = "\p1"
%format p1  = "\p1"
%format snd = "\p2"
%format p2  = "\p2"
%format Left = "i_1"
%format Right = "i_2"
%format i1 = "i_1"
%format i2 = "i_2"
%format >< = "\times"
%format >|<  = "\bowtie "
%format |-> = "\mapsto"
%format . = "\comp "
%format (kcomp (f)(g)) = f "\kcomp " g
%format -|- = "+"
%format conc = "\mathsf{conc}"
%format summation = "{\sum}"
%format (either (a) (b)) = "\alt{" a "}{" b "}"
%format (frac (a) (b)) = "\frac{" a "}{" b "}"
%format (uncurry f) = "\uncurry{" f "}"
%format (const f) = "\underline{" f "}"
%format TLTree = "\mathsf{TLTree}"
%format (lcbr (x)(y)) = "\begin{lcbr}" x "\\" y "\end{lcbr}"
%format (split (x) (y)) = "\conj{" x "}{" y "}"
%format (for (f) (i)) = "\for{" f "}\ {" i "}"
%format B_tree = "\mathsf{B}\mbox{-}\mathsf{tree} "
\def\ana#1{\mathopen{[\!(}#1\mathclose{)\!]}}
%format (cataA (f) (g)) = "\cata{" f "~" g "}_A"
%format (anaA (f) (g)) = "\ana{" f "~" g "}_A"
%format (cataB (f) (g)) = "\cata{" f "~" g "}_B"
%format (anaB (f) (g)) = "\ana{" f "~" g "}_B"
%format Either a b = a "+" b 
%format fmap = "\mathsf{fmap}"
%format NA   = "\textsc{na}"
%format NB   = "\textsc{nb}"
%format inT = "\mathsf{in}"
%format outT = "\mathsf{out}"
%format Null = "1"
%format (Prod (a) (b)) = a >< b
%format fF = "\fun F "
%format e1 = "e_1 "
%format e2 = "e_2 "
%format Dist = "\fun{Dist}"
%format IO = "\fun{IO}"
%format BTree = "\fun{BTree} "
%format LTree = "\mathsf{LTree}"
%format inNat = "\mathsf{in}"
%format (cataNat (g)) = "\cata{" g "}"
%format Nat0 = "\N_0"
%format muB = "\mu "
%format (frac (n)(m)) = "\frac{" n "}{" m "}"
%format (fac (n)) = "{" n "!}"
%format (underbrace (t) (p)) = "\underbrace{" t "}_{" p "}"
%format matrix = "matrix"
%format (bin (n) (k)) = "\Big(\vcenter{\xymatrix@R=1pt{" n "\\" k "}}\Big)"
%format `ominus` = "\mathbin{\ominus}"
%format % = "\mathbin{/}"
%format <-> = "{\,\leftrightarrow\,}"
%format <|> = "{\,\updownarrow\,}"
%format `minusNat`= "\mathbin{-}"
%format ==> = "\Rightarrow"
%format .==>. = "\Rightarrow"
%format .<==>. = "\Leftrightarrow"
%format .==. = "\equiv"
%format .<=. = "\leq"
%format .&&&. = "\wedge"
%format cdots = "\cdots "
%format pi = "\pi "
%format (cata g) = "\cata{" g "}"
%format (ana g) = "\ana{" g "}"
%format (hylo h g) = "\hylo{" h g "}"

%---------------------------------------------------------------------------

\title{
            Cálculo de Programas
\\
        Trabalho Prático
\\
        MiEI+LCC --- 2019/20
}

\author{
        \dium
\\
        Universidade do Minho
}


\date\mydate

\makeindex
\newcommand{\rn}[1]{\textcolor{red}{#1}}
\begin{document}

\maketitle

\begin{center}\large
\begin{tabular}{ll}
\textbf{Grupo} nr. & 40 
\\\hline
a87994 & Daniel Ribeiro 
\\
a87986 & Paulo Costa  
\\
a87989 & Rui Baptista
\end{tabular}
\end{center}

\section{Preâmbulo}

A disciplina de \CP\ tem como objectivo principal ensinar
a progra\-mação de computadores como uma disciplina científica. Para isso
parte-se de um repertório de \emph{combinadores} que formam uma álgebra da
programação (conjunto de leis universais e seus corolários) e usam-se esses
combinadores para construir programas \emph{composicionalmente}, isto é,
agregando programas já existentes.
  
Na sequência pedagógica dos planos de estudo dos dois cursos que têm
esta disciplina, restringe-se a aplicação deste método à programação
funcional em \Haskell. Assim, o presente trabalho prático coloca os
alunos perante problemas concretos que deverão ser implementados em
\Haskell.  Há ainda um outro objectivo: o de ensinar a documentar
programas, validá-los, e a produzir textos técnico-científicos de
qualidade.

\section{Documentação} Para cumprir de forma integrada os objectivos
enunciados acima vamos recorrer a uma técnica de programa\-ção dita
``\litp{literária}'' \cite{Kn92}, cujo princípio base é o seguinte:
\begin{quote}\em Um programa e a sua documentação devem coincidir.
\end{quote} Por outras palavras, o código fonte e a documentação de um
programa deverão estar no mesmo ficheiro.

O ficheiro \texttt{cp1920t.pdf} que está a ler é já um exemplo de \litp{programação
literária}: foi gerado a partir do texto fonte \texttt{cp1920t.lhs}\footnote{O
suffixo `lhs' quer dizer \emph{\lhaskell{literate Haskell}}.} que encontrará
no \MaterialPedagogico\ desta disciplina descompactando o ficheiro \texttt{cp1920t.zip}
e executando
\begin{Verbatim}[fontsize=\small]
    $ lhs2TeX cp1920t.lhs > cp1920t.tex
    $ pdflatex cp1920t
\end{Verbatim}
em que \href{https://hackage.haskell.org/package/lhs2tex}{\texttt\LhsToTeX} é
um pre-processador que faz ``pretty printing''
de código Haskell em \Latex\ e que deve desde já instalar executando
\begin{Verbatim}[fontsize=\small]
    $ cabal install lhs2tex
\end{Verbatim}
Por outro lado, o mesmo ficheiro \texttt{cp1920t.lhs} é executável e contém
o ``kit'' básico, escrito em \Haskell, para realizar o trabalho. Basta executar
\begin{Verbatim}[fontsize=\small]
    $ ghci cp1920t.lhs
\end{Verbatim}

%if False
\begin{code}
{-# OPTIONS_GHC -XNPlusKPatterns #-}
{-# LANGUAGE GeneralizedNewtypeDeriving, DeriveDataTypeable, FlexibleInstances #-}
--module Cp1920t where 
import Cp
import List  hiding (fac)
import Nat
import BTree
import LTree
import Probability
import ListUtils
import Show
import Data.List hiding (find)
import Test.QuickCheck hiding ((><),choose,collect)
import qualified Test.QuickCheck as QuickCheck
import System.Random  hiding (split)
import System.Process
import GHC.IO.Exception
import GHC.IO.Unsafe
import Graphics.Gloss
import Control.Monad
import Control.Applicative hiding ((<|>))
import Exp
\end{code}
%endif

\noindent Abra o ficheiro \texttt{cp1920t.lhs} no seu editor de texto preferido
e verifique que assim é: todo o texto que se encontra dentro do ambiente
\begin{quote}\small\tt
\verb!\begin{code}!
\\ ... \\
\verb!\end{code}!
\end{quote}
vai ser seleccionado pelo \GHCi\ para ser executado.

\section{Como realizar o trabalho}
Este trabalho teórico-prático deve ser realizado por grupos de três alunos.
Os detalhes da avaliação (datas para submissão do relatório e sua defesa
oral) são os que forem publicados na \cp{página da disciplina} na \emph{internet}.

Recomenda-se uma abordagem participativa dos membros do grupo
de trabalho por forma a poderem responder às questões que serão colocadas
na \emph{defesa oral} do relatório.

Em que consiste, então, o \emph{relatório} a que se refere o parágrafo anterior?
É a edição do texto que está a ser lido, preenchendo o anexo \ref{sec:resolucao}
com as respostas. O relatório deverá conter ainda a identificação dos membros
do grupo de trabalho, no local respectivo da folha de rosto.

Para gerar o PDF integral do relatório deve-se ainda correr os comando seguintes,
que actualizam a bibliografia (com \Bibtex) e o índice remissivo (com \Makeindex),
\begin{Verbatim}[fontsize=\small]
    $ bibtex cp1920t.aux
    $ makeindex cp1920t.idx
\end{Verbatim}
e recompilar o texto como acima se indicou. Dever-se-á ainda instalar o utilitário
\QuickCheck,
que ajuda a validar programas em \Haskell\ e a biblioteca \gloss{Gloss} para
geração de gráficos 2D:
\begin{Verbatim}[fontsize=\small]
    $ cabal install QuickCheck gloss
\end{Verbatim}
Para testar uma propriedade \QuickCheck~|prop|, basta invocá-la com o comando:
\begin{verbatim}
    > quickCheck prop
    +++ OK, passed 100 tests.
\end{verbatim}
Pode mesmo controlar o número de casos de teste e sua complexidade utilizando
o comando:
\begin{verbatim}
    > quickCheckWith stdArgs { maxSuccess = 200, maxSize = 10 } prop
    +++ OK, passed 200 tests.
\end{verbatim}
Qualquer programador tem, na vida real, de ler e analisar (muito!) código
escrito por outros. No anexo \ref{sec:codigo} disponibiliza-se algum
código \Haskell\ relativo aos problemas que se seguem. Esse anexo deverá
ser consultado e analisado à medida que isso for necessário.

\Problema

Pretende-se implementar um sistema de manutenção e utilização de um dicionário.
Este terá uma estrutura muito peculiar em memória. Será construída
uma árvore em que cada nodo terá apenas uma letra da palavra e cada
folha da respectiva árvore terá a respectiva tradução (um ou mais sinónimos).
Deverá ser possível:
\begin{itemize}
\item
|dic_rd| --- procurar traduções para uma determinada palavra
\item   
|dic_in| --- inserir palavras novas (palavra e tradução)
\item
|dic_imp| --- importar dicionários do formato ``lista de pares palavra-tradução"
\item
|dic_exp| --- exportar dicionários para o formato ``lista de pares palavra-tradução".
\end{itemize}
A implementação deve ser baseada no módulo \textbf{Exp.hs} que está incluído no material deste trabalho prático,
que deve ser estudado com atenção antes de abordar este problema.

    \begin{figure}          
    \includegraphics[scale=0.15]{images/dic.png}
    \caption{Representação em memória do dicionário dado para testes.}
    \label{fig:dic}          
    \end{figure}

No anexo \ref{sec:codigo} é dado um dicionário para testes, que corresponde à figura \ref{fig:dic}.
A implementação proposta deverá garantir as seguintes propriedades:
\begin{propriedade}
Se um dicionário estiver normalizado (ver apêndice \ref{sec:codigo}) então
não perdemos informação quando o representamos em memória:
\begin{code}
prop_dic_rep x = let d = dic_norm x in (dic_exp . dic_imp) d == d
\end{code}
\end{propriedade}
\begin{propriedade}
Se um significado |s| de uma palavra |p| já existe num dicionário então adicioná-lo
em memória não altera nada:
\begin{code}
prop_dic_red p s d
   | dic_red p s d = dic_imp d == dic_in p s (dic_imp d)
   | otherwise = True
\end{code}
\end{propriedade}
\begin{propriedade}
A operação |dic_rd| implementa a procura na correspondente exportação do dicionário:
\begin{code}
prop_dic_rd (p,t) = dic_rd  p t == lookup p (dic_exp t)
\end{code}
\end{propriedade}

\Problema

Árvores binárias (elementos do tipo \BTree) são
    frequentemente usadas no armazenamento e procura de dados, porque
    suportam um vasto conjunto de ferramentas para procuras
    eficientes. Um exemplo de destaque é o caso das
    \href{https://en.wikipedia.org/wiki/Binary_search_tree}{árvores
    binárias de procura}, \emph{i.e.} árvores que seguem o
    princípio de \emph{ordenação}: para todos os nós,
    o filho à esquerda tem um
    valor menor ou igual que o valor no próprio nó; e de forma
     análoga, o filho à direita
    tem um valor maior ou igual que o valor no próprio nó.
    A Figura~\ref{fig:ex} apresenta dois exemplos de árvores binárias de procura.\footnote{
    As imagens foram geradas com recurso à função |dotBt| (disponível
    neste documento). Recomenda-se o
    uso desta função para efeitos de teste e ilustração.}

    \begin{figure}          
    \includegraphics[scale=0.26]{images/example1.png}
    \includegraphics[scale=0.26]{images/example2.png}
    \caption{Duas árvores binárias de procura; a da esquerda vai ser designada
    por $t_1$ e a da direita por $t_2$.}
    \label{fig:ex}          
    \end{figure}
  Note que tais árvores permitem reduzir \emph{significativamente}
  o espaço de procura, dado que ao procurar um valor podemos sempre
  \emph{reduzir a procura a um ramo} ao longo de cada nó visitado. Por
  exemplo, ao procurar o valor $7$ na primeira árvore ($t_1$), sabemos que nos
  podemos restringir ao ramo da direita do nó com o valor $5$ e assim
  sucessivamente. Como complemento a esta explicação, consulte
  também os \href{http://www4.di.uminho.pt/~jno/media/}{vídeos das aulas teóricas} (capítulo `pesquisa binária').

  Para verificar se uma árvore binária está ordenada,
  é útil ter em conta  a seguinte
  propriedade: considere uma árvore binária cuja raíz tem o valor
  $a$, um filho $s_1$ à esquerda e um filho $s_2$ à direita.
  Assuma que os dois filhos estão ordenados; que o elemento
  \emph{mais à direita} de $t_1$ é menor ou igual a $a$; e que o
  elemento \emph{mais à esquerda} de $t_2$ é maior ou igual a $a$.
  Então a árvore binária está ordenada. Dada esta informação,
  implemente as seguintes funções como catamorfismos de árvores binárias.
\begin{code}
maisEsq :: BTree a -> Maybe a
maisDir :: BTree a -> Maybe a
\end{code}
  Seguem alguns exemplos dos resultados que se esperam ao aplicar
  estas funções à árvore da esquerda ($t1$) e à árvore da direita ($t2$)
  da Figura~\ref{fig:ex}.
  \begin{Verbatim}[fontsize=\small]
   *Splay> maisDir t1
    Just 16
   *Splay> maisEsq t1
    Just 1
   *Splay> maisDir t2
    Just 8
   *Splay> maisEsq t2
    Just 0
  \end{Verbatim}
  \begin{propriedade}
  As funções |maisEsq| e |maisDir| são determinadas unicamente
  pela propriedade
\begin{code}
prop_inv :: BTree String -> Bool
prop_inv = maisEsq .==. maisDir . invBTree
\end{code}
  \end{propriedade}
  \begin{propriedade}
    O elemento mais à esquerda de uma árvore está presente no ramo da
    esquerda, a não ser que esse ramo esteja vazio:
\begin{code}
propEsq Empty = property Discard
propEsq x@(Node(a,(t,s))) = (maisEsq t) /= Nothing ==> (maisEsq x) == maisEsq t
\end{code}
\end{propriedade}
  A próxima tarefa deste problema consiste na implementação de uma função
  que insere um novo elemento numa árvore
  binária \emph{preservando} o princípio de ordenação,
\begin{code}
insOrd :: (Ord a) => a -> BTree a -> BTree a
\end{code}
  e de uma função que verifica se uma dada árvore binária está ordenada,
\begin{code}
isOrd :: (Ord a) => BTree a -> Bool
\end{code}
Para ambas as funções deve utilizar o que aprendeu sobre \emph{catamorfismos e
recursividade mútua}.

\noindent
\textbf{Sugestão:} Se tiver problemas em implementar
com base em catamorfismos  estas duas últimas
funções, tente implementar (com base em catamorfismos) as funções auxiliares
\begin{code}
insOrd' :: (Ord a) => a -> BTree a -> (BTree a, BTree a)
isOrd' :: (Ord a) => BTree a -> (Bool, BTree a)
\end{code}
tais que
$insOrd' \> x = \langle insOrd \> x, id \rangle$ para todo o elemento $x$
do tipo $a$
e
$isOrd' = \langle isOrd, id \rangle$.
  \begin{propriedade}
   Inserir uma sucessão de elementos numa árvore vazia gera uma árvore
   ordenada.
\begin{code}
prop_ord :: [Int] -> Bool
prop_ord = isOrd . (foldr insOrd Empty)
\end{code}
\end{propriedade}

\smallskip
  \noindent
    As árvores binárias providenciam uma boa maneira de reduzir o espaço
    de procura. Mas podemos fazer ainda melhor: podemos aproximar da
    raíz os elementos da árvore que são mais acedidos, reduzindo assim
    o espaço de procura na \emph{dimensão vertical}\footnote{Note que
    nas árvores de binária de procura a redução é feita na dimensão
    horizontal.}. Esta operação é geralmente
    referida como
    \href{https://en.wikipedia.org/wiki/Splay_tree}{\emph{splaying}} e
    é implementada com base naquilo a que chamamos
    \href{https://en.wikipedia.org/wiki/Tree_rotation}{\emph{rotações à esquerda
    e à direita de uma  árvore}}.

    Intuitivamente, a rotação à direita de uma árvore move todos os
    nós "\emph{uma casa para a sua direita}". Formalmente,
    esta operação define-se da seguinte maneira:
    \begin{enumerate}
       \item Considere uma árvore binária e designe a sua
       raíz pela letra $r$. Se $r$ não tem filhos à esquerda então simplesmente
       retornamos a árvore dada à entrada. Caso contrário,
       \item designe o filho à esquerda pela letra $l$. A árvore
       que vamos retornar tem $l$ na raíz, que mantém o filho à esquerda
       e adopta $r$ como o filho à direita. O orfão (\emph{i.e.} o anterior
       filho à direita de $l$) passa a ser o filho à esquerda de $r$.
    \end{enumerate}
    A rotação à esquerda é definida de forma análoga. As
       Figuras~\ref{exrot:fig} e \ref{exrot2:fig} apresentam dois
       exemplos de rotações à direita. Note que em ambos os casos o
       valor $2$ subiu um nível na árvore correspodente. De facto,
       podemos sempre aplicar uma \emph{sequência} de rotações numa
       árvore de forma a mover um dado nó para a raíz (dando origem
       portanto à referida operação de splaying).

    \begin{figure}
    \includegraphics[scale=0.27]{images/example1.png}
    \includegraphics[scale=0.27]{images/example3.png}
    \caption{Exemplo de uma rotação à direita. A árvore da esquerda
    é a árvore original; a árvore da direita representa a rotação à direita
    correspondente.}
    \label{exrot:fig}
    \end{figure}

    \begin{figure}
    \includegraphics[scale=0.25]{images/example2.png}
    \includegraphics[scale=0.25]{images/example4.png}
    \caption{Exemplo de uma rotação à direita. A árvore da esquerda
    é a árvore original; a árvore da direita representa a rotação à direita
    correspondente.}
    \label{exrot2:fig}
    \end{figure}

    Começe então por implementar as funções   
\begin{code}
rrot :: BTree a -> BTree a
lrot :: BTree a -> BTree a
\end{code}
    de rotação à direita e à esquerda.
    \begin{propriedade}
       As rotações à esquerda e à direita preservam a ordenação
       das árvores.
\begin{code}
prop_ord_pres_esq = forAll orderedBTree (isOrd . lrot)
prop_ord_pres_dir = forAll orderedBTree (isOrd . rrot)
\end{code}
    \end{propriedade}
De seguida implemente a operação de splaying
\begin{code}
splay :: [Bool] -> (BTree a -> BTree a)
\end{code}
como um catamorfismo de listas. O argumento |[Bool]|
representa um caminho ao longo de uma árvore, em que o valor |True|
representa "seguir pelo ramo da esquerda" e o valor |False|
representa "seguir pelo ramo da direita". O caminho ao longo de uma árvore serve
para \emph{identificar} unicamente um nó dessa árvore.
\begin{propriedade}
A operação de splay preserva a ordenação de uma árvore.
\begin{code}
prop_ord_pres_splay :: [Bool] -> Property
prop_ord_pres_splay path = forAll orderedBTree (isOrd . (splay path))
\end{code}
\end{propriedade}

\Problema

\emph{Árvores de decisão binárias} são estruturas de dados usadas na
 área de
 \href{https://www.xoriant.com/blog/product-engineering/decision-trees-machine-learning-algorithm.html}{machine
 learning} para codificar processos de decisão. Geralmente, tais
 árvores são geradas por computadores com base num vasto conjunto de
 dados e reflectem o que o computador "aprendeu" ao processar esses
 mesmos dados. Segue-se um exemplo muito simples de uma árvore de decisão
 binária:

\[
  \xymatrix{ & \text{chuva na ida?} \ar[dl]_{\text{sim}} \ar[dr]^{\text{não}} & &\\
  \text{precisa} & & \text{chuva no regresso?} \ar[dl]^{\text{sim}}
  \ar[dr]^{\text{não}} & \\
  & \text{precisa} & & \text{não precisa}
  }
\]

Esta árvore representa o processo de decisão relativo a ser preciso ou
    não levar um guarda-chuva para uma viagem, dependendo das
    condições climatéricas. Essencialmente, o processo de decisão é
    efectuado ao "percorrer" a árvore, escolhendo o ramo da esquerda ou
    da direita de acordo com a resposta à pergunta correspondente. Por
    exemplo, começando da raiz da árvore, responder |["não", "não"]|
    leva-nos à decisão |"não precisa"| e responder |["não", "sim"]|
    leva-nos à decisão |"precisa"|.

Árvores de decisão binárias podem ser codificadas em \Haskell\ usando
o seguinte tipo de dados:
\begin{code}
data Bdt a = Dec a | Query (String, (Bdt a, Bdt a)) deriving Show
\end{code}

Note que o tipo de dados |Bdt| é parametrizado por um tipo de dados
 |a|.  Isto é necessário, porque as decisões podem ser de diferentes
 tipos: por exemplo, respostas do tipo "sim ou não" (como apresentado
 acima), a escolha de números, ou
 \href{http://jkurokawa.com/2018/02/09/machine-learning-part-ii-decision-trees}{classificações}.

De forma a conseguirmos processar árvores de decisão binárias em \Haskell,
deve, antes de tudo, resolver as seguintes alíneas:
\begin{enumerate}
  \item Definir as funções |inBdt|, |outBdt|, |baseBdt|, |cataBdt|, e |anaBdt|.
  \item Apresentar no relatório o diagrama de |anaBdt|.
\end{enumerate}
Para tomar uma decisão com base numa árvore de decisão binária |t|, o
computador precisa apenas da estrutura de |t| (\emph{i.e.} pode esquecer
a informação nos nós da árvore) e de uma lista de respostas "sim ou não" (para
que possa percorrer a árvore da forma desejada). Implemente então as seguintes
funções na forma de \emph{catamorfismos}:
\begin{enumerate}
\item |extLTree : Bdt a -> LTree a| (esquece a informação presente
nos nós de uma dada árvore de decisão binária).
\begin{propriedade}
  A função |extLTree| preserva as folhas da árvore de origem.
\begin{code}
prop_pres_tips :: Bdt Int -> Bool
prop_pres_tips = tipsBdt .==. tipsLTree . extLTree
\end{code}
\end{propriedade}
\item |navLTree : LTree a -> ([Bool] -> LTree a)| (navega um elemento de
|LTree|
de acordo com uma sequência de respostas "sim ou não". Esta função deve
ser implementada como um catamorfismo de |LTree|. Neste contexto,
elementos de |[Bool]| representam sequências de respostas: o valor |True| corresponde a "sim" e portanto a "segue pelo ramo da esquerda"; o valor
|False| corresponde a "não" e portanto a "segue pelo ramo da direita".

Seguem
alguns exemplos dos resultados que se esperam ao aplicar |navLTree| a
|(extLTree bdtGC)|, em que |bdtGC| é a  àrvore de decisão binária acima descrita,
e a uma
sequência de respostas.
   \begin{Verbatim}[fontsize=\small]
    *ML> navLTree (extLTree bdtGC) []
    Fork (Leaf "Precisa",Fork (Leaf "Precisa",Leaf "N precisa"))
    *ML> navLTree (extLTree bdtGC) [False]
    Fork (Leaf "Precisa",Leaf "N precisa")
    *ML> navLTree (extLTree bdtGC) [False,True]
    Leaf "Precisa"
    *ML> navLTree (extLTree bdtGC) [False,True,True]
    Leaf "Precisa"
    *ML> navLTree (extLTree bdtGC) [False,True,True,True]
    Leaf "Precisa"
   \end{Verbatim}
\end{enumerate}
\begin{propriedade}
  Percorrer uma árvore ao longo de um caminho é equivalente a percorrer
a árvore inversa ao longo do caminho inverso.
\begin{code}
prop_inv_nav :: Bdt Int -> [Bool] -> Bool
prop_inv_nav t l = let t' = extLTree t in
  invLTree (navLTree t' l) == navLTree (invLTree t') (fmap not l)
\end{code}
\end{propriedade}
\begin{propriedade}
  Quanto mais longo for o caminho menos alternativas de fim irão existir.
\begin{code}
prop_af :: Bdt Int -> ([Bool],[Bool]) -> Property
prop_af t (l1,l2) = let t' = extLTree t
                        f = length . tipsLTree . (navLTree t')
                    in isPrefixOf l1 l2 ==> (f l1 >= f l2)
\end{code}
\end{propriedade}

\Problema

%format B = "\mathit B"
%format C = "\mathit C"
Mónades são functores com propriedades adicionais que nos permitem obter
efeitos especiais em progra\-mação. Por exemplo, a biblioteca \Probability\
oferece um mónade para abordar problemas de probabilidades. Nesta biblioteca,
o conceito de distribuição estatística é captado pelo tipo
\begin{eqnarray}
    |newtype Dist a = D {unD :: [(a, ProbRep)]}|
    \label{eq:Dist}
\end{eqnarray}
em que |ProbRep| é um real de |0| a |1|, equivalente a uma escala de $0$ a
$100 \%$.

Cada par |(a,p)| numa distribuição |d::Dist a| indica que a probabilidade
de |a| é |p|, devendo ser garantida a propriedade de  que todas as probabilidades
de |d| somam $100\%$.
Por exemplo, a seguinte distribuição de classificações por escalões de $A$ a $E$,
\[
\begin{array}{ll}
A & \rule{2mm}{3pt}\ 2\%\\
B & \rule{12mm}{3pt}\ 12\%\\
C & \rule{29mm}{3pt}\ 29\%\\
D & \rule{35mm}{3pt}\ 35\%\\
E & \rule{22mm}{3pt}\ 22\%\\
\end{array}
\]
será representada pela distribuição
\begin{code}
d1 :: Dist Char
d1 = D [('A',0.02),('B',0.12),('C',0.29),('D',0.35),('E',0.22)]
\end{code}
que o \GHCi\ mostrará assim:
\begin{Verbatim}[fontsize=\small]
'D'  35.0%
'C'  29.0%
'E'  22.0%
'B'  12.0%
'A'   2.0%
\end{Verbatim}
É possível definir geradores de distribuições, por exemplo distribuições \emph{uniformes},
\begin{code}
d2 = uniform (words "Uma frase de cinco palavras")
\end{code}
isto é
\begin{Verbatim}[fontsize=\small]
     "Uma"  20.0%
   "cinco"  20.0%
      "de"  20.0%
   "frase"  20.0%
"palavras"  20.0%
\end{Verbatim}
distribuição \emph{normais}, eg.\
\begin{code}
d3 = normal [10..20]
\end{code}
etc.\footnote{Para mais detalhes ver o código fonte de \Probability, que é uma adaptação da
biblioteca \PFP\ (``Probabilistic Functional Programming''). Para quem quiser souber mais
recomenda-se a leitura do artigo \cite{EK06}.}
|Dist| forma um \textbf{mónade} cuja unidade é |return a = D [(a,1)]| e cuja composição de Kleisli
é (simplificando a notação)
\begin{spec}
  ((kcomp f g)) a = [(y,q*p) | (x,p) <- g a, (y,q) <- f x]
\end{spec}
em que |g: A -> Dist B| e |f: B -> Dist C| são funções \textbf{monádicas} que representam
\emph{computações probabilísticas}.
Este mónade é adequado à resolução de problemas de
 \emph{probabilidades e estatística} usando programação funcional, de
 forma elegante e como caso particular da programação
 monádica. Vamos estudar a aplicação
 deste mónade ao exercício anterior, tendo em conta o facto de que nem
 sempre podemos responder com 100\% de certeza a perguntas presentes
 em árvores de decisão.


Considere a seguinte situação: a Anita vai
 trabalhar no dia seguinte
e quer saber se precisa de levar guarda-chuva.  Na verdade,
 ela tem autocarro de porta de casa até ao trabalho, e portanto
 as condições meteorológicas não são muito significativas; a não ser
 que seja segunda-feira...Às segundas é dia de feira e o autocarro vai
 sempre lotado! Nesses dias, ela prefere fazer a pé o caminho de casa
 ao trabalho, o que a obriga a levar guarda-chuva (nos dias de
 chuva). Abaixo está apresentada a árvore de decisão respectiva a este problema.

 \[
     \xymatrix{
     && \text{2a-feira?} \ar[dl]_{\text{sim}} \ar[dr]^{\text{não}} & \\
     & \text{chuva na ida?} \ar[dl]_{\text{sim}} \ar[dr]^{\text{não}}
      && \text{não precisa} \\
     \text{precisa} && \text{chuva no regresso?}
    \ar[dl]_{\text{sim}} \ar[dr]^{\text{não}} & \\
     &\text{precisa} && \text{não precisa}
     }
  \]

Assuma que a Anita não sabe em que dia está, e que a previsão da
   chuva para a ida é de 80\% enquanto que a previsão de chuva para o
   regresso é de 60\%. \emph{A Anita deve
  levar guarda-chuva?}
  Para responder a esta questão, iremos tirar partido do que se aprendeu
  no exercício anterior. De facto, a maior diferença é que agora as
  respostas ("sim" ou "não") são dadas na forma de uma distribuição sobre o tipo de dados
  |Bool|. Implemente como um catamorfismo de |LTree| a função
\begin{code}
bnavLTree :: LTree a -> ((BTree Bool) -> LTree a)
\end{code}
que percorre uma árvore dado um caminho, \emph{não} do tipo |[Bool]|, mas
do tipo |BTree Bool|. O tipo |BTree Bool| é necessário
na presença de incerteza, porque neste contexto não sabemos sempre
       qual a próxima pergunta a responder. Teremos portanto
que ter resposta para todas as perguntas na árvore de decisão.

Seguem alguns exemplos dos resultados que se esperam
       ao aplicar |bnavLTree| a |(extLTree anita)|, em que |anita| é a
       árvore de decisão acima descrita, e a uma árvore
      binária de respostas.
     \begin{Verbatim}[fontsize=\small]
      *ML> bnavLTree (extLTree anita) (Node(True, (Empty,Empty)))
      Fork (Leaf "Precisa",Fork (Leaf "Precisa",Leaf "N precisa"))
      *ML> bnavLTree (extLTree anita) (Node(True, (Node(True,(Empty,Empty)),Empty)))
      Leaf "Precisa"
      *ML> bnavLTree (extLTree anita) (Node(False, (Empty,Empty)))
      Leaf "N precisa"
     \end{Verbatim}
Por fim, implemente como um catamorfismo de |LTree| a função
\begin{code}
pbnavLTree :: LTree a -> ((BTree (Dist Bool)) -> Dist(LTree a))
\end{code}
que deverá consiste na "monadificação" da função |bnavLTree| via a mónade das
probabilidades. Use esta última implementação para responder se a Anita deve
levar guarda-chuva ou não dada a situação acima descrita.
\Problema

Os \truchet{mosaicos de Truchet} são padrões que se obtêm gerando aleatoriamente
combinações bidimensionais de ladrilhos básicos. Os que se mostram na figura
\ref{fig:tiles} são conhecidos por ladrilhos de Truchet-Smith.
A figura \ref{fig:truchet} mostra um exemplo de mosaico produzido por uma
combinação aleatória de 10x10 ladrilhos |a| e |b| (cf.\ figura
\ref{fig:tiles}).

Neste problema pretende-se programar a geração aleatória de mosaicos de
Truchet-Smith usando o mónade \random{Random} e a biblioteca \gloss{Gloss}
para produção do resultado. Para uniformização das respostas, deverão ser
seguidas as seguintes condições:
\begin{itemize}
\item   Cada ladrilho deverá ter as dimensões 80x80
\item   O programa deverá gerar mosaicos de quaisquer dimensões, mas deverá ser apresentado como figura no relatório o mosaico de 10x10 ladrilhos.
\item   Valorizar-se-ão respostas elegantes e com menos linhas de código \Haskell.
\end{itemize} 
No anexo \ref{sec:codigo} é dada uma implementação da operação de permuta aleatória de uma lista que pode ser útil para resolver este exercício.

    \begin{figure}\centering
    \includegraphics[scale=0.20]{images/tiles.png}
    \caption{Os dois ladrilhos de Truchet-Smith.}
    \label{fig:tiles}
    \end{figure}

    \begin{figure}\centering
    \includegraphics[scale=0.20]{images/truchet.png}
    \caption{Um mosaico de Truchet-Smith.}
    \label{fig:truchet}
    \end{figure}

%----------------- Programa, bibliotecas e código auxiliar --------------------%

\newpage

\part*{Anexos}

\appendix

\section{Como exprimir cálculos e diagramas em LaTeX/lhs2tex}
Estudar o texto fonte deste trabalho para obter o efeito:\footnote{Exemplos tirados de \cite{Ol18}.} 
\begin{eqnarray*}
\start
    |id = split f g|
%
\just\equiv{ universal property }
%
        |lcbr(
        p1 . id = f
    )(
        p2 . id = g
    )|
%
\just\equiv{ identity }
%
        |lcbr(
        p1 = f
    )(
        p2 = g
    )|
\qed
\end{eqnarray*}

Os diagramas podem ser produzidos recorrendo à \emph{package} \LaTeX\ 
\href{https://ctan.org/pkg/xymatrix}{xymatrix}, por exemplo: 
\begin{eqnarray*}
\xymatrix@@C=2cm{
    |Nat0|
           \ar[d]_-{|cataNat g|}
&
    |1 + Nat0|
           \ar[d]^{|id + (cataNat g)|}
           \ar[l]_-{|inNat|}
\\
     |B|
&
     |1 + B|
           \ar[l]^-{|g|}
}
\end{eqnarray*}


\section{Código fornecido}\label{sec:codigo}

\subsection*{Problema 1}
Função de representação de um dicionário:
\begin{code}
dic_imp :: [(String,[String])] -> Dict
dic_imp = Term "" . map (bmap  id singl) . untar . discollect

\end{code}
onde
\begin{code}
type Dict = Exp String String
\end{code}
Dicionário para testes:
\begin{code}
d :: [(String, [String])]
d =  [ ("ABA",["BRIM"]),
       ("ABALO",["SHOCK"]),
       ("AMIGO",["FRIEND"]),
       ("AMOR",["LOVE"]),
       ("MEDO",["FEAR"]),
       ("MUDO",["DUMB","MUTE"]),
       ("PE",["FOOT"]),
       ("PEDRA",["STONE"]),
       ("POBRE",["POOR"]),
       ("PODRE",["ROTTEN"])]
\end{code}
Normalização de um dicionário (remoção de entradas vazias):
\begin{code}
dic_norm = collect . filter p . discollect where
   p(a,b)= a > "" && b > ""
\end{code}
Teste de redundância de um significado |s| para uma palavra |p|:
\begin{code}
dic_red p s d = (p,s) `elem` discollect d
\end{code}

\subsection*{Problema 2}

Árvores usadas no texto:
\begin{code}
emp x = Node(x,(Empty,Empty))

t7 = emp 7
t16 = emp 16
t7_10_16 = Node(10,(t7,t16))
t1_2_nil = Node(2,(emp 1, Empty)) 
t' = Node(5,(t1_2_nil, t7_10_16))

t0_2_1 = Node(2, (emp 0, emp 3))
t5_6_8 = Node(6, (emp 5, emp 8))
t2 = Node(4, (t0_2_1, t5_6_8))


dotBt :: (Show a) => BTree a -> IO ExitCode
dotBt = dotpict . bmap Just Just . cBTree2Exp . (fmap show)
\end{code}

\subsection*{Problema 3}
Funções usadas para efeitos de teste:
\begin{code}
tipsBdt :: Bdt a -> [a]
tipsBdt = cataBdt (either singl ((uncurry (++)) . p2))
tipsLTree = tips
\end{code}

\subsection*{Problema 5}
Função de permutação aleatória de uma lista:
\begin{code}

permuta [] = return []
permuta x = do { (h,t) <- getR x; t' <- permuta t; return (h:t') } where
      getR x = do { i <- getStdRandom (randomR (0,length x-1)); return (x!!i,retira i x) }
      retira i x = take i x ++ drop (i+1) x
\end{code}

\subsection*{QuickCheck}
Código para geração de testes:
\begin{code}
instance Arbitrary a => Arbitrary (BTree a) where
    arbitrary = sized genbt  where
              genbt 0 = return (inBTree $ i1 ())
              genbt n = oneof [(liftM2 $ curry (inBTree . i2))
                QuickCheck.arbitrary (liftM2 (,) (genbt (n-1)) (genbt (n-1))),
                (liftM2 $ curry (inBTree . i2))
                QuickCheck.arbitrary (liftM2 (,) (genbt (n-1)) (genbt 0)),
                (liftM2 $ curry (inBTree . i2))
                QuickCheck.arbitrary (liftM2 (,) (genbt 0) (genbt (n-1)))]               

instance (Arbitrary v, Arbitrary o) => Arbitrary (Exp v o) where
    arbitrary = (genExp 10)  where
              genExp 0 = liftM (inExp . i1) QuickCheck.arbitrary
              genExp n = oneof [liftM (inExp . i2 . (\a -> (a,[]))) QuickCheck.arbitrary,
                         liftM (inExp . i1) QuickCheck.arbitrary,
                         liftM (inExp . i2 . (\(a,(b,c)) -> (a,[b,c])))
                         $ (liftM2 (,) QuickCheck.arbitrary (liftM2 (,)
                                                             (genExp (n-1)) (genExp (n-1)))),
                         liftM (inExp . i2 . (\(a,(b,c,d)) -> (a,[b,c,d])))
                         $ (liftM2 (,) QuickCheck.arbitrary (liftM3 (,,)
                                                             (genExp (n-1)) (genExp (n-1)) (genExp (n-1))))        
                      ]

orderedBTree :: Gen (BTree Int)
orderedBTree = liftM (foldr insOrd Empty) (QuickCheck.arbitrary :: Gen [Int])

instance (Arbitrary a) => Arbitrary (Bdt a) where
    arbitrary = sized genbt  where
              genbt 0 = liftM Dec QuickCheck.arbitrary
              genbt n = oneof [(liftM2 $ curry Query)
                QuickCheck.arbitrary (liftM2 (,) (genbt (n-1)) (genbt (n-1))),
                (liftM2 $ curry (Query))
                QuickCheck.arbitrary (liftM2 (,) (genbt (n-1)) (genbt 0)),
                (liftM2 $ curry (Query))
                QuickCheck.arbitrary (liftM2 (,) (genbt 0) (genbt (n-1)))]      


\end{code}

\subsection*{Outras funções auxiliares}
%----------------- Outras definições auxiliares -------------------------------------------%
Lógicas:
\begin{code}
infixr 0 .==>.
(.==>.) :: (Testable prop) => (a -> Bool) -> (a -> prop) -> a -> Property
p .==>. f = \a -> p a ==> f a

infixr 0 .<==>.
(.<==>.) :: (a -> Bool) -> (a -> Bool) -> a -> Property
p .<==>. f = \a -> (p a ==> property (f a)) .&&. (f a ==> property (p a))

infixr 4 .==.
(.==.) :: Eq b => (a -> b) -> (a -> b) -> (a -> Bool)
f .==. g = \a -> f a == g a

infixr 4 .<=.
(.<=.) :: Ord b => (a -> b) -> (a -> b) -> (a -> Bool)
f .<=. g = \a -> f a <= g a

infixr 4 .&&&.
(.&&&.) :: (a -> Bool) -> (a -> Bool) -> (a -> Bool)
f .&&&. g = \a -> ((f a) && (g a))
\end{code}
Compilação e execução dentro do interpretador:\footnote{Pode ser útil em testes
envolvendo \gloss{Gloss}. Nesse caso, o teste em causa deve fazer parte de uma função
|main|.}
\begin{code}

run = do { system "ghc cp1920t" ; system "./cp1920t" }
\end{code}

%----------------- Soluções dos alunos -----------------------------------------%

\section{Soluções dos alunos}\label{sec:resolucao}
Os alunos devem colocar neste anexo as suas soluções aos exercícios
propostos, de acordo com o "layout" que se fornece. Não podem ser
alterados os nomes ou tipos das funções dadas, mas pode ser adicionado texto e/ou 
outras funções auxiliares que sejam necessárias.



\subsection*{Problema 1}

\par Começamos por definir a função discollect como um catamorfismo 
de listas, da seguinte forma:

\begin{code}

discollect :: (Ord b, Ord a) => [(b, [a])] -> [(b, a)]
discollect = cataList g where
           g = either nil k
           k = conc . ( discc >< id )
           discc (a,x) = [(a,b) | b <- x]

\end{code}
\par Para a função auxiliar tar do |dic_exp| usamos um catamorfismo de árvores de expressão, 
se estivermos numa Var v damos return a uma lista com o par [(' '),v], caso seja um Term 
vamos concatenar esse termo ao que já tinhamos do lado esquerdo do par.
\\
\begin{code}

tar = cataExp g where
  g = either k h
  k v = [("", v)]
  h =  (uncurry f) . ( id >< concat) 
  f x y = map ((curry conc x) >< id ) y

dic_exp :: Dict -> [(String,[String])]
dic_exp = collect . tar

\end{code}

\par Para a função de procura usamos um hilomorfismo de árvores de expressão
onde o anamorfismo vai "podar" a árvore, ou seja temos um Termo que não é
prefixo da palavra que estamos a pesquisar, vamos colocar uma lista vazia, 
na lista das árvores de expressão desse tal termo, podando assim os ramos abaixo 
dele, se for prefixo, vamos procurar a palavra tirando esse prefixo, na lista 
desse Termo, podando quando necessário.
\\
\par No final do anamorfismo vamos acabar com uma árvore onde as Variáveis dela
são as traduções possíveis para uma dada palavra, assim usamos um catamorfismo
para colocar essas Variáveis todas em uma lista.
\\
\par É de notar que a definição do gene do nosso catamorfismo é exatamente igual
à função expLeaves do módulo Exp.hs, por isso podiamos defininir esta função
como a expLeaves após o anamorfismo antes referido.

\begin{code}
dic_rd = curry (finaliza . (hyloExp dic_rd_CataGen dic_rd_AnaGen))
            where finaliza [] = Nothing
                  finaliza lista = (Just . iSort . nub) lista

\end{code}
\par gene do catamorfismo
\\
\begin{code}
dic_rd_CataGen = either singl (concat . p2)
\end{code}
\par gene do anamorfismo
\\
\begin{code}
dic_rd_AnaGen ("", Var a) = i1 a
dic_rd_AnaGen (p , Var _) = i2 (p, [])
dic_rd_AnaGen (p , Term j n) = if (isPrefix j p) then i2 (j, [(sufixo, o) | o <- n]) else i2 (p, [])
                       where sufixo = drop (length j) p

isPrefix x l = elem x (prefixes l)
\end{code}
\\
\par Para a função de inserção usamos um anamorfismo que vai cobrir todos os casos possíveis de 
inserções.
Primeiro testamos se a palavra já existe no dicionário com a |dic_rd|, se isso se confimar,
testamos se a tradução existe na lista de traduções da palavra procurada, se sim damos return ao dicionário.
Caso contrário iremos inseri-la usando então o anamorfismo de árvores de expressão, passamos-lhe (dici,(p,t,True)
ou seja o dicionário, a palavra a ser inserida, a sua respetiva tradução e um booleano True, este booleano é uma 
espécie de flag ao longo da nossa função que nos vai dizer se é nessa expressão que temos de inserir.


Vamos enumerar as linhas e os diferentes casos:

Caso estejamos numa Var
\\
1 - Caso de quando a flag é falsa em uma Variável, damos return a essa Variável
\\
2 - Caso a palavra for vazia acrescentamos a sua tradução a um termo novo pois 
Var "chinelo" == Term '' [Var "chinelo"]
\\
\\
3 - Caso a palavra não seja vazia acrescentamos a palavra e a sua tradução, como um termo, dentro de outro
com o que já tinha antes.
\\
\\
Caso estejamos num Termo
\\
4 - Caso a flag seja false vamos dar return ao Termo com que tinhamos antes, sem alterar.
\\
5 - Caso o operador j for prefixo de p e forem iguais então vamos dar return a um Termo novo com
esse mesmo j , a lista de expressões do j concatenada com nova Variável inserida.
\\
6 - Caso o operador j for prefixo da palavra, a palavra a inserir for diferente do operador j e 
a insertProbe do sufixo da palavra na lista dos Termos der True vamos então inserir no Termo que deu 
True, utilizando a função insertP
\\
7 - Caso (5) e (6) não se cumprir vamos para o case 7 que vamos apenas concatenar o 
(Term sufixo [Var t],("","",False)) à lista em que estamos
\\
8 - Caso o operador j não for prefixo de p mas a palavra p for prefixo do operador j então vamos dar return
a um Termo com a a palavra p como operador e uma lista com a tradução t e com o resto dos Termos com o operador
deles sendo o sufixo2 que é o operador j sem o p inicial
\\
9 - Caso as palavras não tenham nada a ver (nenhuma ser prefixo da outra) vamos dar return a um Termo com o operador "",
com o que ja tinhamos antes e um novo Termo com lá dentro com a palavra e a tradução

\\
\begin{code}

dic_in p t dici = if (exists t (dic_rd p dici)) then dici else anaExp dic_in_AnaGen (dici,(p,t,True))
               where exists _ Nothing = False
                     exists o (Just x) = elem o x

dic_in_AnaGen (Var a,(_,_,False)) = i1 a                                                                   -- 1
dic_in_AnaGen (Var a,(p,t,_)) = if (p == "") 
                                    then i2 ("", [(Var a,("","",False)), (Var t,("","",False))])           -- 2
                                    else i2 ("", [(Var a,("","",False)), (Term p [Var t], ("","",False))]) -- 3
dic_in_AnaGen (Term j n,(_,_,False)) = i2 (j, [(o, ("","",False)) | o <- n])                               -- 4
dic_in_AnaGen (Term j n,(p,t,True)) = if (isPrefix j p) 
  then if (p==j) then i2 (j, cons (   (Var t, ("","",False))  ,  [(o, ("","",False)) | o <- n] ))          -- 5
    else if (insertProbe sufixo n) 
      then i2 (j, insertP sufixo t n)                                                                      -- 6
        else i2 (j, cons (  (Term sufixo [Var t],("","",False))  ,  [(o, ("","",False)) | o <- n]  ))      -- 7
  else if (isPrefix p j) then i2 (p, [ (Var t,("","",False)), (Term  sufixo2 n,("","",False))  ])          -- 8
  else i2 ("", [  (Term p [Var t],("","",False))  ,  (Term j n,(p,t,False))  ])                            -- 9
                      where sufixo = drop (length j) p
                            sufixo2 = drop (length p) j
                                  

\end{code} 
\\ 
\par A função insertProbe apenas verifica se pode inserir naquela lista.
\\
\begin{code}
insertProbe p [] = False
insertProbe p ((Var a):xs) = False || (insertProbe p xs)
insertProbe p ((Term j o):xs) = (elem j (prefixes p)) || (insertProbe p xs)

\end{code} 
\\
\par A função insertP, se a insertProbe se confirmar, verifica a mesma coisa mas 
desta vez constrói a lista pondo True ou False
\begin{code}

insertP _ _ [] = []
insertP p t ((Var a):xs) = (Var a,("","",False)) : (insertP p t xs)
insertP p t ((Term o n):xs) = if (elem o (prefixes p)) 
                              then (Term o n,(p,t,True)):(insertP p t xs) 
                                   else (Term o n,("","",False)):(insertP p t xs)

\end{code}
\\

\subsection*{Problema 2}

\par Nesta função "maisDir", percorremos sempre para a direita, até verificarmos que a posição à direita está como "Empty" 
(aqui sabemos que nos encontramos na posição mais à direita possível). E quando assim o verificamos, retorna-se x (Just x).
\\
\begin{code}

maisDir = cataBTree g where
        g = either (const Nothing) h
        h (x,(_,Nothing)) = Just x
        h (_,(_,r)) = r

\end{code}
\\
\par Esta próxima função é análoga à função anterior. Mas, obviamente, para o lado esquerdo.
\\
\begin{code}

maisEsq = cataBTree g
  where g = either (const Nothing) h
        h (x,(Nothing,_)) = Just x
        h (_,(l,_)) = l

\end{code}
\\
\par Nesta função "insOrd", utilizamos um catamorfismo. De início, multiplicamos a árvore, 
devido à utilização da recursividade mútua ( (l1,r1) representam funções). Aqui temos 2 casos,
se tivermos Nil Nil, devolvemos um nó, com descendentes vazios. E o outro caso, verificamos
se o elemento é igual, não inserimos, se for menor, vamos trabalhar na parte esquerda e 
obviamente, se o elemento for maior, trabalharemos na parte da direita.

\\
\begin{code}

insOrd' x = cataBTree g
  where g = undefined

insOrd a x = (cataBTree g) x x a
    where g = either g1 g2
          g1 _ _ e = Node(e,(Empty, Empty))
          g2 (e1,(l1,r1)) (Node(e2,(l2,r2))) e = if (e == e1) then Node(e2,(l2,r2))
                 else  if (e < e1) then Node (e1, ((l1 l2 e),r2)) else Node (e1, (l2 , (r1 r2 e)))

\end{code}
\\
\par Esta próxima função, "isOrd", tem como intuito verificar se a árvore está ordenada.
Como podemos verificar, no segundo caso, (g2), primeiro verificaremos a cabeça e depois os filhos,
isto com o auxílio de duas funções, "checkHead" e "checkSons", respetivamente.
A função "checkHead", usa ainda outra função "isBigger" para auxílio à parte esquerda da árvore, e
a função "isSmaller" para a parte à direita. 
A função "checkSons", faz (l ll), para a parte esquerda e ainda (r rr), para a parte à direita.
\\
\begin{code}

isOrd' = cataBTree g
   where g = undefined

isOrd j = (cataBTree g) j j
     where g = either g1 (curry g2)
           g1 _ _ = True
           g2 ((a,(l,r)),Node(aa,(ll,rr))) = checkHead && checkSons
                where checkHead = isBigger a (maisEsq ll) && isSmaller a (maisDir rr)
                      checkSons = l ll && r rr

isBigger x Nothing = True
isBigger x (Just j) = x > j

isSmaller x Nothing = True
isSmaller x (Just j) = x < j
\end{code}
\\
\par A função que se segue, "rrot", vai servir para efetuar uma rotação à direita.
Como é óbvio, em primeiro caso, temos que, rodar Empty, devolverá automaticamente 
Empty (caso base). 
No caso de, (x a Empty c), algo que não poderá acontecer, devolvemos de forma igual.
O outro caso, e o mais complicado a nosso ver de chegar a uma conclusão, é quando temos 
(x a (Node(aa,(bb,cc))) c) e aqui sim, já efetuaremos uma rotação como pretendido e que fica 
da forma (Node (aa, ( bb,(Node (a,(cc,c)))))).
\\
\begin{code}

rrot Empty = Empty
rrot (Node (a,(b,c))) = x a b c
                where x a Empty c = Node (a,(b,c))
                      x a (Node(aa,(bb,cc))) c = Node (aa, ( bb,(Node (a,(cc,c)))))
\end{code}
\\
\par Esta próxima função, funciona de forma análoga à anterior, mas esta, servir-nos-á
para efetuar rotações à esquerda.
\\
\begin{code}               

lrot Empty = Empty
lrot (Node (a,(b,c))) = x a b c
              where x a b Empty = Node (a,(b,c))
                    x a b (Node(aa,(bb,cc))) = Node (aa,((Node (a,(b,bb))),cc))
\end{code}
\\
\par E por último, neste problema, chega a função "splayCataGen".
Esta função, através de Bools, executará rotações ("True" refere-se às rotações para a esquerda e 
portanto "False", referir-se-á às rotações para a direita).
\\
\begin{code}

splay l t = (cataList splayCataGen) l t

splayCataGen = either g1 (curry g2)
       where g1 _ bt = bt
             g2 ((j,n), bt ) = if (j) then n (rrot bt) else n (lrot bt)

\end{code}
\\
\\

\subsection*{Problema 3}

\par Definimos as funções da seguinte forma:

\begin{code}

inBdt = either Dec Query

outBdt (Dec a) = i1 a

outBdt (Query (s, (l,r))) = i2 (s,(l,r))

baseBdt g h  = id -|- (g  >< (h >< h))

recBdt g = baseBdt id g

cataBdt g = g . (recBdt (cataBdt g)) . outBdt

anaBdt g = inBdt . (recBdt (anaBdt g)) . g

\end{code}



\begin{eqnarray*}
\xymatrix@@C=2cm{
    |Bdt|
            \ar[d]_-{|ana g|}
            \ar[r]_-{|g|}
&
    |Dec + A >< (Bdt >< Bdt)| 
           \ar[d]^{|id + id >< (ana g>< ana g)|}
\\
     |Bdt|
&
     |Dec + A >< (Bdt >< Bdt)|
           \ar[l]^-{|inBdt|}
}
\end{eqnarray*}




\par E seguidamente o diagrama do anamorfismo em árvores de decisão 
binárias



\par A função extLtree para esquecer a informação nos nós é definida
como um catamorfismo de árvores de decisão binárias simples que 
quando recebe uma Decisão a, vai transformar em Leaf a, e quando
recebe uma Query (s,(l,r)) vai transformar o (l,r) em um Fork, 
esquecendo assim o s (informação no nó)
\begin{code}


extLTree :: Bdt a -> LTree a
extLTree = cataBdt g where
  g = either Leaf (Fork . p2)

\end{code}


\par A função de navegação em uma árvore de decisão, foi implementada
através de um catamorfismo, de Leaf Trees, no caso base, se estivermos em uma
folha e tivermos qualquer coisa na lista, vamos dar essa folha pois não podemos
tomar nenhuma decisão em uma folha, no caso recursivo, se a lista for vazia, damos 
a LTree que estivermos a "olhar", caso não seja vazia, testamos o valor da cabeça da
lista de bool, se for true vamos para a função do split do lado esquerdo (p1) com o 
resto da lista, se for false vamos para o lado direito.
\\
\begin{code}
navLTree :: LTree a -> ([Bool] -> LTree a)
navLTree x y = cataLTree navLTreeGen x y

navLTreeGen = either g1 (curry g2)
     where g1 x _= Leaf x
           g2 ((a,b), []) = Fork ((split a b) [])
           g2 ((a,b), (x:xs)) = if (x) then p1 $ g else p2 $ g
                       where g = split a b xs

\end{code}
\\
\\

\subsection*{Problema 4}

\par Esta função "bnavLTree", recebe uma LTreee uma BTree de Bools e devolvemos uma LTree.
Aqui nesta função, temos (l1,r1) que funcionam como funções, (l2,r2) que funcionam como representação
da árvore e ainda (l3,r3) que conforme o valor de b, se "b=True" então faremos (l1 l2 l3), no caso de 
"b=False" então teremos (r1 r2 r3).
\\
\begin{code}
bnavLTree lt bt = (cataLTree bnavLTreeGen) lt lt bt

bnavLTreeGen = either g1 g2
    where g1 j _ _ = Leaf j
          g2 _ lt Empty = lt
          g2 (l1,r1) (Fork(l2,r2)) (Node(b,(l3,r3))) = if (b) then l1 l2 l3 else r1 r2 r3
\end{code}
\\
\par A função pbnavLTree recebe uma LTree e uma BTree de distribuição e tem como objetivo devolver uma lista 
com as árvores próvaveis. Aqui, utilizamos um catamorfismo, começamos pela parte de baixo e vamos subindo na árvore, 
por isso a probabilidade individual de cada folha vai começar sempre a 100 por cento (1.0)[1], se a árvore de decisão 
for fazia, também colocamos 100 por cento na árvore em qual estamos [2].
Por fim, na chamada recursiva faz-se 2 pares, um para percorrer o ramo da esquerda e outro o ramo da direita[3].
\\


\begin{code}

pbnavLTree lt bt = (cataLTree pbnavLTreeGen) lt lt bt

pbnavLTreeGen = either g1 g2
  where g1 j _ _ = D [(Leaf j, 1.0)]  --1
        g2 _ bt Empty = D [(bt, 1.0)] --2 
        g2 (l1,r1) (Fork(l2,r2)) (Node(dist,(l3,r3))) =
                 (D . conc . (n >< n)) ((l1 l2 l3, probEsq),(r1 r2 r3, probDir)) --3
          where probEsq = getTrueProb (getProbs) 
                probDir = getFalseProb (getProbs)
                getProbs = (map (id >< sum ) . collectProb . unD) dist
                n =  distProb . (unD >< id)
                unD = Probability.unD
\end{code}
\\
\par Nas funções auxiliares descritas em baixo, o getTrueProb[4] vai buscar a probabilidade de ser True sendo análoga
à getFalseProb[5], a distProb[6] vai multiplicar as probabilidades para sabermos a probabilidade encadeada e
a collectProb[7] vai colecionar probabilidades que são iguais, colocando em um par o booleano do lado esquerdo, e do 
outro lado a lista das respetivas probabilidades, após isso o (map (id $><$ sum ) irá somar essa lista, ficamos 
assim só com 0-2 pares, na variável getProbs.
\\
\begin{code}
  
getTrueProb = cataList g -- 4
      where g = either g1 g2
            g1 _ = 0.0
            g2 ((j, n), o) = if (j) then n else o

getFalseProb = cataList g --5
      where g = either g1 g2
            g1 _ = 0.0
            g2 ((j, n), o) = if (not j) then n else o

distProb (x,y) = map (id >< (*y)) x --6

collectProb x = set [ k |-> [ d' | (k',d') <- x , k'==k ] | (k,d) <- x ] --7

\end{code}
\\
\\
\subsection*{Problema 5}

\begin{figure}[H]\centering
\includegraphics[scale=0.5]{images/truchet5.png}
\caption{Exemplo gerado com a função drawTruchet 10 10.}
\end{figure}
\vspace{2cm}
\par Os truchet tiles usados como base
\begin{code}

truchet1 = Pictures [ put (0,80) (Arc (-90) 0 40), put (80,0) (Arc 90 180 40) ]

truchet2 = Pictures [ put (0,0) (Arc 0 90 40), put (80,80) (Arc 180 (-90) 40) ]


put  = uncurry Translate 
\end{code}

\\
\par A função drawTruchet x y é a principal, para a usar colocamos quantos tiles queremos no x
e quantos tiles queremos no y, a janela vai ser gerada à medida, e na pic vamos ter a informação
para gerar a imagem.
\\

\begin{code}

drawTruchet x y = display janela1 white pic
        where pic = mconcat (mapGen x y)
              janela1 = InWindow "Truchet" (80*x, 80*y) (100,100)

\end{code}
\\
\par A função mapGen vai dar return a uma lista de listas de monads Picture, que depois são concatenados
usando o mconcat na drawTruchet.
\\
\par Nas mapCoords vamos ter as coordenadas criadas a partir de uma lista de compreensão, é uma lista de listas, que onde as
listas interiores são 4 pontos que fazem um quadrado, e podemos manipular o ponto 2 e 3 para colocar um Truchet 1 e o ponto
1 e 4 para colocar um Truchet 2.
\\
\begin{figure}[H]\centering
\includegraphics[scale=0.6]{images/pontos5.png}
\caption{Geração dos pontos}
\end{figure}
\\
Essa lista é criada toda no primeiro quadrante de um referencial x y, ou seja vamos precisar de centra-las, para esse efeito
usamos um map de map onde o map interior vai fazer leftshift ao x e um downshift ao y de metade do comprimento e metade da largura.
Ficamos assim com uma lista de listas das coordenadas já centradas em mapCenter
\\
\begin{figure}[H]\centering
\includegraphics[scale=0.4]{images/translacaoy5.png}
\includegraphics[scale=0.4]{images/translacaox5.png}
\includegraphics[scale=0.3]{images/coordenadasfinal5.png}
\caption{Exemplo do funcionamento do leftshift e do downshift}
\end{figure}
\\

Agora vamos calcular nTruchet1 que vai ser a area / 2 e o nTruchet2 que vai ser o que sobra, com isto vamos ter porções mais ou menos
iguais de Truchet1 e Truchet2, a razão disto é para a imagem ficar mais bonita e equilibrada, podiamos também implementar uma 
aleatoriedade aqui, escolhendo um número de [0,área] para os Truchet1 o o Truchet2 seria o resto
Após isso genTruchetList vai criar uma lista com nTruchet1 1 e nTruchet2 2
Depois a função genTruchet vai permutar essa lista usando a função permuta disponibilizada e vai usar um unsafePerformIO para podermos
trabalhar com esse IO
\\
\begin{code}
mapGen comp lar = truchetSmithGen genTruchet mapCenter
  where mapCenter = map ( map (  ((+leftshift) . realToFrac) ><  ((+downshift) . realToFrac) ) ) mapCoords
        mapCoords = [[(x*80,y*80),(x*80+80,y*80),(x*80,y*80+80),(x*80+80,y*80+80)] | 
                    x <- [0..comp-1], y <- [0..lar-1]]
        leftshift = (-((realToFrac comp)/2*80))
        downshift = (-((realToFrac lar)/2*80))
        genTruchet = unsafePerformIO (permuta genTruchetList)
        genTruchetList = conc (  replicate nTruchet1 1 , replicate nTruchet2 2  )
        area = comp * lar
        nTruchet1 =  (div area 2)
        nTruchet2 =  (nTruchet1 + (mod area 2))
\end{code}

\par A função truchetSmithGen vai receber uma lista de 1's e 2's onde o 1 representa Truchet1 e o 2 representa o 
Truchet 2, o tamanho da lista é o número de truchets totais na imagem (x * y), esta lista já foi permutada, e também 
recebe uma lista de coordenadas "lcoords" onde tem então os 4 pontos.
\\
\par A função vai usar um catamorfismo e a recursividade mútua, percorrendo assim a lista de 1's e 2's ao mesmo tempo que percorre 
a lista das coordenadas, se encontrar o número 1, vai colocar nessas coordenadas o Truchet 1, caso encontre um 2 coloca o 
Truchet 2.

\begin{code}

truchetSmithGen lts lcoords = (cataList g) lts lts lcoords
  where g = either g1 g2
        g1 _ _ _ = []
        g2 (1,j) (1:o) (l:ls) = conc ([Pictures [ put (l !! 2) (Arc (-90) 0 40), 
                                put (l !! 1) (Arc 90 180 40) ]], j o ls)
        g2 (2,j) (2:o) (l:ls) = conc ([Pictures [ put (l !! 0) (Arc 0 90 40), 
                                put (l !! 3) (Arc 180 (-90) 40) ]], j o ls)

\end{code}


\\
\\
\\


%----------------- Fim do anexo com soluções dos alunos ------------------------%

%----------------- Índice remissivo (exige makeindex) -------------------------%

\printindex

%----------------- Bibliografia (exige bibtex) --------------------------------%

\bibliographystyle{plain}
\bibliography{cp1920t}

%----------------- Fim do documento -------------------------------------------%
\end{document}
