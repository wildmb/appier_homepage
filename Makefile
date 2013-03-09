all:
	make css
	make js
	python mkpage.py index

css:
	lessc css/appier-style.less > css/appier-style.css

js:
	coffee -c js/*/*.coffee

watch:
	python watch.py

.PHONY: css js
