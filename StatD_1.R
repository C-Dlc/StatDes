install.packages("tidyverse")
library(tidyverse)
library(ggplot2)

ggplot2::mpg
mpg <- ggplot2::mpg

ggplot2::ggplot(data = mpg) + 
  geom_point(mapping = aes(x = displ, y = hwy))

#EXERCICES
# /3/
  # 1. 
ggplot(data = mpg)
    # R : "Erreur" parfois, sinon graphique vide
  
  # 2.
    # R : 11 colonnes, 234 rangs

  # 3.
?mpg
    # R : displ = engine displacement, in litres

  # 4.
ggplot2::ggplot(data = mpg) + 
  geom_point(mapping = aes(x = displ, y = hwy))

  # 5.
ggplot2::ggplot(data = mpg) + 
  geom_point(mapping = aes(x = drv, y = class))
    # R : On obtient un graph de montrant le(s) mode(s) de traction disponible selon le type de véhicules, 
    #     information sans grand intéret.


# /3/3/1
  # 1.
ggplot(data = mpg) + 
  geom_point(mapping = aes(x = displ, y = hwy, color = "blue"))
    # R : Les points du graph ne sont pas bleus car la donnée pour la couleur a été entre comme une
    #     info aes (qui concerne les variables), alors qu'elle doit être entrée comme ceci :
ggplot(data = mpg) + 
  geom_point(mapping = aes(x = displ, y = hwy), color = "blue")

  # 2.
    # R : V CATEGORIELLES : 'manufacturer', 'model', 'year', 'cyl', 'trans', 'drv', 'fl', 'class'
    #   : V CONTINUOUS    : 'cty', 'hwy'

  # 3.
ggplot(data = mpg) + 
  geom_point(mapping = aes(x = displ, y = hwy, size = cty))
    # CONTINUOUS
    # R : "Erreur : A continuous variable can not be mapped to shape"
    #   : Ok pour couleur (dégradé d'une même couleur selon les valeurs)
    #   : Ok pour size    (dégradé de tailles selon les valeurs)
    # CATEGORIELLES 
    # R : Erreur pour shape, trop de variables (plus 6), une partie des données non mappées
    #   : Ok pour couleur (couleurs distinctes selon les valeurs)
    #   : THEORIQUEMENT Ok pour size (dégradé de tailles selon les valeurs), mais non recommandé pour rendre compte de variable discrètes

  # 4.
ggplot(data = mpg) + 
  geom_point(mapping = aes(x = displ, y = hwy, size = cty, colour = cty))
    # R : Quand même variable mappée avec plusieurs aes, les deux sont prises en compte
    #   : Ici, dégradé de couleur et de taille pour rendre compte de cty. Information redondante. 
    #   : Aucun graph tacé si l'un des aes choisi n'est pas compatible avec le type de variable

  # 5.
?geom_point
  # R : "stroke =" permet de modifier la largeur des contours des points du graphiques en définissant une valeur fixe, ex :
ggplot(data = mpg) + 
  geom_point(mapping = aes(x = displ, y = hwy, stroke = 3))
  # R : ou en y associant la valleur d'une variable (pas très malin dasn ce cas ci), ex :
ggplot(data = mpg) + 
  geom_point(mapping = aes(x = displ, y = hwy, stroke = cyl))
ggplot(data = mpg) + 
  geom_point(mapping = aes(x = displ, y = hwy, stroke = year))

  #6
ggplot(data = mpg) + 
  geom_point(mapping = aes(x = year, y = hwy, colour = displ < 5))
  # La couleur va varier sur le graph selon la valeur TRUE/FALSE de l'�l�ment mis en aes.

#3.4
  #1
ggplot(data = mpg) + 
  geom_point(mapping = aes(x = displ, y = hwy)) + 
  facet_wrap(~ class, nrow = 2)
ggplot(data = mpg) + 
  geom_point(mapping = aes(x = displ, y = hwy)) + 
  facet_wrap(~ cty, nrow = 2) #Qaund on plot sur variable continuelle -> multiplication des plots

  #2
  # Les cellules vides sont dues au fait que certains moteurs se sont disponible qu'avec certains mode de traction, certaines cobinaisons non sont donc poas disponibles

  #3
ggplot(data = mpg) + 
  geom_point(mapping = aes(x = displ, y = hwy)) +
  facet_grid(drv ~ .)

ggplot(data = mpg) + 
  geom_point(mapping = aes(x = displ, y = hwy)) +
  facet_grid(. ~ cyl)
  # LE "." permet une pr�sentation diff�rente des graphique (sans avoir de facet), la position d�termine l'orientation

  #4
ggplot(data = mpg) + 
  geom_point(mapping = aes(x = displ, y = hwy)) + 
  facet_wrap(~ class, nrow = 2)
  #facet_wrap permet un lecture plus nette, quand le nombre d'�lements de la variable (ici 'class')sur lequel il est plot reste petit.
  # dans le cas contraire, cela entrainerait un graph illisible du fait de la multiplication des facets.

  #5
?facet_wrap
  #nrow et ncol permettent de parametrer manuelement le nombre de rangs et/ou de colonnes form�s par les different facet du facetwrap
?facet_grid
  #facet_grid n'a pas de commandes pour modiifer le nombre de colonnes ou de rangs, ceux-ci d�pendant des variables utilis�e dans le facet

  #6
  # Permet une pr�sentation et une lecture plus calire et pertinente

#3.6
# left
ggplot(data = mpg) + 
  geom_point(mapping = aes(x = displ, y = hwy))

# right
ggplot(data = mpg) + 
  geom_smooth(mapping = aes(x = displ, y = hwy))

  #3.6.1
  #1 geom_smooth

  #2
  # Le graph va montrer hwy(y) en fonction de displ(x), par des points (de couleurs differentes en fonction de drv) mais aussi par des courbes de meme couleurs que les points
ggplot(data = mpg, mapping = aes(x = displ, y = hwy, color = drv)) + 
  geom_point() + 
  geom_smooth(se = FALSE)


  #4"se = FALSE" permet de ne pas montrer la partie gris�es assioci�es � chacunes des coubes/lignes du graph

  #5
  # Les deux graph seront les m�me car ils utilisent les meme donn�es de la m�me mani�re
  # Dans le premier cas, en les pr�cisant avant que quoique ce soit ne soit trac�
  # Dans le second en les pr�cisant et pour le tracage des points et pour le tracage de la ligne
