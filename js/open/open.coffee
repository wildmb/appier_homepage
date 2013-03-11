$ = @jQuery

$('.doc-body-tabbable').on 'click', (e) ->

	$this = $ e.currentTarget

	if $this.hasClass('is-active') then return

	$('.doc-body-tabbable').toggleClass('is-active')
	$('.doc-body-advertiser, .doc-body-publisher').toggleClass('hide')