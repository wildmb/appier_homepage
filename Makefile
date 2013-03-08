all:
	make css

css:
	lessc css/appier-style.less > css/appier-style.css

watch:
	python watch.py

.PHONY: css
