# jQuery
$ = @jQuery

# how many dissolve images are loaded
numDissolveLoaded = 1

# there are 3 dissolve images totally
NUM_DISSOLVE_IMAGES = 3

# timer
timer = null

# a boolean indicating is in the process of transition
# if it is in transition, then user clicks control points will not work
isDissolving = false

# cached jQuery object
$dissolvers = $('.dissolve-blue, .dissolve-orange, .dissolve-gray')
$headlineDissolvers = $('.dissolve-heading-blue, .dissolve-heading-orange, .dissolve-heading-gray')

# current image
$curr = null

# after 9 seconds, next dissolving will start
ANIMATION_INTERVAL = 9000

# dissolving lasts 2 second
ANIMATION_DURATION = 2000


onClickDissolveControl = (e) ->

	if isDissolving then return

	# ignore if the same element
	ix = $('.dissolve-control').index(e.currentTarget)
	if ix is $dissolvers.index($curr) then return

	# clear scheduled task
	clearTimeout timer

	# do dissolving
	doDissolving $dissolvers.eq(ix)


doDissolving = ($next) ->

	# ignore if we are doing animation
	if isDissolving then return

	# ignore if current element equals to next element
	if $next.get(0) is $curr.get(0) then return

	# ensure only one animation at the same time
	isDissolving = true

	# decide which two are going to dissolve
	currix = $dissolvers.index $curr
	nextix = $dissolvers.index $next
	nextnextix = if nextix + 1 >= NUM_DISSOLVE_IMAGES then 0 else nextix + 1

	$currHeadline = $ $headlineDissolvers.get(currix)
	$nextHeadline = $ $headlineDissolvers.get(nextix)

	# refresh control points
	$('.dissolve-control').eq(currix).removeClass('is-active').end().eq(nextix).addClass('is-active')

	# do animation
	$curr.fadeOut(ANIMATION_DURATION, 'swing')
	$currHeadline.fadeOut(ANIMATION_DURATION, 'swing')
	$nextHeadline.fadeIn(ANIMATION_DURATION, 'swing')
	$next.fadeIn ANIMATION_DURATION, 'swing', () ->
		$curr.addClass 'hide'
		$currHeadline.addClass 'hide'
		$next.removeClass 'hide'
		$nextHeadline.removeClass 'hide'

		isDissolving = false
		timer = setTimeout($.proxy(doDissolving, window, $dissolvers.eq(nextnextix)), ANIMATION_INTERVAL)
		$curr = $next


prepareDissolving = ->
	# ready to dissolve images

	# (1) show control component and register click handler
	$('.dissolve-control-group').removeClass('hide').find('.dissolve-control').on('click', onClickDissolveControl)

	# (2) do dissolving
	$curr = $('.dissolve-blue')
	doDissolving $('.dissolve-orange')


$('.dissolve-orange img, .dissolve-gray img').each (ix, elem) ->

	$this = $ elem

	$this.attr('src', $this.attr('data-src')).one 'load', () ->
		numDissolveLoaded += 1
		if numDissolveLoaded >= NUM_DISSOLVE_IMAGES then prepareDissolving()
