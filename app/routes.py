"""Libraries and packages import """

from flask import Flask, render_template, request, redirect
from lxml import etree

""" Definition of the routes"""
app = Flask("Application")

@app.route("/")
def home():
	return render_template("pages/home.html")

@app.route("/song/<int:number>")
def song(number):
	source_doc = etree.parse("/home/formation1/lirimix/app/static/XML/corpus.xml")
	xslt_doc = etree.parse("/home/formation1/lirimix/app/static/XSL/lyrics.xsl")
	xslt_transformer = etree.XSLT(xslt_doc)
	output_doc = xslt_transformer(source_doc, number=str(number))
	return render_template("pages/songs.html", template_flask1=output_doc, template_flask2=number)

@app.route("/songs_index")
def songs_index():
	source_doc = etree.parse("/home/formation1/lirimix/app/static/XML/corpus.xml")
	xslt_doc = etree.parse("/home/formation1/lirimix/app/static/XSL/songs_index.xsl")
	xslt_transformer = etree.XSLT(xslt_doc)
	output_doc = xslt_transformer(source_doc)
	return render_template("pages/songs_index.html", template_flask1=output_doc)

@app.route("/author/<int:idf>")
def author(idf):
	source_doc = etree.parse("/home/formation1/lirimix/app/static/XML/corpus.xml")
	xslt_doc = etree.parse("/home/formation1/lirimix/app/static/XSL/author.xsl")
	xslt_transformer = etree.XSLT(xslt_doc)
	output_doc = xslt_transformer(source_doc, idf=str(idf))
	return render_template("pages/author.html", template_flask1=output_doc, template_flask2=idf)	

@app.route("/authors_index")
def authors_index():
	source_doc = etree.parse("/home/formation1/lirimix/app/static/XML/corpus.xml")
	xslt_doc = etree.parse("/home/formation1/lirimix/app/static/XSL/authors_index.xsl")
	xslt_transformer = etree.XSLT(xslt_doc)
	output_doc = xslt_transformer(source_doc)
	return render_template("pages/authors_index.html", template_flask1=output_doc)

@app.errorhandler(404)
def page_not_found(error):
    return render_template("pages/error.html"), 404	

@app.route("/performances")    
def performances():
	source_doc = etree.parse("/home/formation1/lirimix/app/static/XML/corpus.xml")
	xslt_doc = etree.parse("/home/formation1/lirimix/app/static/XSL/performances.xsl")
	xslt_transformer = etree.XSLT(xslt_doc)
	output_doc = xslt_transformer(source_doc)
	return render_template("pages/performances.html", template_flask1=output_doc)	

@app.route("/contact", methods=['GET', 'POST'])
def contact():
    return render_template("pages/form.html")	

app.run()