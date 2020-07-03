"""Libraries and packages import """

import os
from flask import Flask, render_template, request, redirect
from lxml import etree

""" Definition of the routes"""
chemin_actuel = os.path.dirname(os.path.abspath(__file__))
templates = os.path.join(chemin_actuel, "templates")
static = os.path.join(chemin_actuel, "static")
app = Flask("Application", static_folder=static, template_folder=templates)


@app.route("/")
def home():
	return render_template("pages/home.html")

@app.route("/song/<int:number>")
def song(number):
	source_doc = etree.parse(os.path.join(chemin_actuel, "static/XML/corpus.xml"))
	xslt_doc = etree.parse(os.path.join(chemin_actuel, "static/XSL/lyrics.xsl"))
	xslt_transformer = etree.XSLT(xslt_doc)
	output_doc = xslt_transformer(source_doc, number=str(number))
	return render_template("pages/songs.html", template_flask1=output_doc, template_flask2=number)

@app.route("/songs_index")
def songs_index():
	source_doc = etree.parse(os.path.join(chemin_actuel, "static/XML/corpus.xml"))
	xslt_doc = etree.parse(os.path.join(chemin_actuel, "static/XSL/songs_index.xsl"))
	xslt_transformer = etree.XSLT(xslt_doc)
	output_doc = xslt_transformer(source_doc)
	return render_template("pages/songs_index.html", template_flask1=output_doc)

@app.route("/author/<int:idf>")
def author(idf):
	source_doc = etree.parse(os.path.join(chemin_actuel, "static/XML/corpus.xml"))
	xslt_doc = etree.parse(os.path.join(chemin_actuel, "static/XSL/author.xsl"))
	xslt_transformer = etree.XSLT(xslt_doc)
	output_doc = xslt_transformer(source_doc, idf=str(idf))
	return render_template("pages/author.html", template_flask1=output_doc, template_flask2=idf)	

@app.route("/authors_index")
def authors_index():
	source_doc = etree.parse(os.path.join(chemin_actuel, "static/XML/corpus.xml"))
	authors = {}
	for aut in source_doc.xpath("//teiCorpus/teiHeader/profileDesc/particDesc/listPerson/person[@idf]"):
		author_id = aut.attrib["idf"]
		name = aut.xpath("persName[@xml:lang='en']/forename")[0].text
		authors[author_id] = name

	return render_template("pages/authors_index.html", authors=authors)

@app.errorhandler(404)
def page_not_found(error):
    return render_template("pages/error.html"), 404	

@app.route("/performances")    
def performances():
	source_doc = etree.parse(os.path.join(chemin_actuel, "static/XML/corpus.xml"))
	xslt_doc = etree.parse(os.path.join(chemin_actuel, "static/XSL/performances.xsl"))
	xslt_transformer = etree.XSLT(xslt_doc)
	output_doc = xslt_transformer(source_doc)
	return render_template("pages/performances.html", template_flask1=output_doc)	

@app.route("/contact", methods=['GET', 'POST'])
def contact():
    return render_template("pages/form.html")	
