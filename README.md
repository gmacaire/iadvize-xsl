iadvize-xsl
===========

La feuille de style XSL iadvize.xsl décrit la transformation en HTML d'un fichier de discussions iAdvize au format XML.

# Comment utiliser iadvize.xsl ?

## 1. Télécharger la feuille de style

Télécharger la feuille de style XSL iadvise.xsl à l'URL https://raw.githubusercontent.com/gmacaire/iadvize-xsl/master/iadvize.xsl.

**Important :** la feuille de style doit être stockée dans le répertoire contenant les discussions iAdvize au format XML.

## 2. Editer le fichier de discussions iAdvize

Dans le fichier XML de discussions iAdvize, remplacer la première balise : 

    <?xml version="1.0" encoding="UTF-8"?>

par :

    <?xml version="1.0" encoding="UTF-8"?>
    <?xml-stylesheet type="text/xsl" href="iadvize.xsl" ?>

Enregistrer les modifications.

## 3. Ouvrir le fichier de discussions iAdvize

Ouvrir le fichier de discussions iAdvize avec un navigateur Web.
