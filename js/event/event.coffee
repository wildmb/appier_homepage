$ = @jQuery

$.getJSON '/js/event.json', (response) ->

	html = ''

	for res in response
		html += """
			<div class="doc-body-event">
				<div class="doc-body-event-date">#{res.date}</div>
				<h3 class="doc-body-event-title">#{res.title}</h3>
				<a href="#{res.link}" class="doc-body-event-link">#{res.link}</a>
				<a href="#{res.link}"><img src="#{res.image}" class="doc-body-event-image"></a>
			</div>
		"""

	$('.doc-body').append html