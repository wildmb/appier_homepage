PAGES = index open premium
CSS_OUTPUT = css/appier-style.css
PRODUCTION_DIR = production
HTML_COMPRESSOR_JAR = htmlcompressor-1.5.3.jar

all: 
	make css
	make js
	python mkpage.py $(PAGES)

css:
	lessc css/appier-style.less > $(CSS_OUTPUT)

min-css:
	lessc --yui-compress css/appier-style.less > $(CSS_OUTPUT)

js:
	coffee -c js/*/*.coffee

min-js:
	coffee -c js/*/*.coffee
	uglifyjs --no-copyright --overwrite js/*/*.js

watch:
	python watch.py

production:
	mkdir -p $(PRODUCTION_DIR)
	mkdir -p $(PRODUCTION_DIR)/css
	mkdir -p $(PRODUCTION_DIR)/js
	lessc --yui-compress css/appier-style.less > $(PRODUCTION_DIR)/$(CSS_OUTPUT)
	for d in `find js/* -type d`; do \
		mkdir -p $(PRODUCTION_DIR)/$$d; \
		coffee -o $(PRODUCTION_DIR)/$$d -c $$d/*.coffee; \
	done
	uglifyjs --no-copyright --overwrite $(PRODUCTION_DIR)/js/*/*.js
	python mkpage.py $(PAGES)
	for p in $(PAGES); do \
		java -jar $(HTML_COMPRESSOR_JAR) --type html -o $(PRODUCTION_DIR) $$p.html; \
	done
	cp -r image $(PRODUCTION_DIR)

clean:
	rm -rf $(PRODUCTION_DIR)

.PHONY: css js production clean
