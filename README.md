# STATS Scraper

This is a Rails API version of my previous [STATS scraper written in Flask](https://github.com/jkereako/stats-html-scraper-api).

It is built with Rails 5 beta 3 using the [API generator configuration](http://edgeguides.rubyonrails.org/api_app.html). This will be a much more reliable scaper than the Flask version because I'm writing tests for the code as I go. There are zero tests for the Flask scraper.

# Motivation
I wanted to fire up the Flask version so I could write tests for it, but I couldn't remember how to install and activate `virtualenv`. I also never liked how I tried to turn that Flask app into a MVC Rails app. It's too complex and each class and file does too much. This project will have a separation of concerns with respect to the SOLID principles.
