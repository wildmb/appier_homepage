setMenu = (cls) ->
	# a boolean indicating whether or not mouse is currently on the nav bar item
	isMouseOver = false

	$(cls).on('mouseover', (e) ->
		$this = $ e.currentTarget
		$('.nav-menu-body', $this).removeClass('hide')
		isMouseOver = true
	).on('mouseout', (e) ->
		$this = $ e.currentTarget
		isMouseOver = false
		hideMenu = -> if not isMouseOver then $("#{cls} .nav-menu-body").addClass('hide')
		# delay 0.1 seconds to increase usability
		setTimeout hideMenu, 100
	)

setMenu('.is-solutions')
setMenu('.is-about')