OrderView = Backbone.View.extend

	initialize: ->

		bindLoadIframe = () ->


		_.delay(bindLoadIframe, 100)

	el: '.order-body'

	events:
		'change .order-campaign-goal[value="__other_option__"]': 'checkOtherCampaignGoal'
		'keydown .order-campaign-goal-other': 'keyDownOtherCampaignGoal'
		'click .order-submit-btn': 'validateForm'


	checkOtherCampaignGoal: (e) ->

		$this = $ e.currentTarget
		_.defer () => if not $this.prop('checked') then @$('.order-campaign-goal-other').val('')

	keyDownOtherCampaignGoal: (e) ->

		$this = $ e.currentTarget
		_.defer () => @$('.order-campaign-goal[value="__other_option__"]').prop('checked', $this.val() isnt '')

	validateForm: ->

		validate = true

		# clear error fields
		@$('.control-group').removeClass('error').find('.help-inline').html('')

		# all fields are required
		@$("#order-first-name, #order-last-name, #order-phone, #order-email, #order-company-name").each (ix, elem) =>
			$elem = $ elem
			value = $.trim($elem.val())

			if value is ''
				@errorHandler $elem
				validate = false
				return

		_.each [".order-target-marketing", ".order-campaign-goal"], (cls) =>
			if @$("#{cls}:checked").length is 0
				@errorHandler @$("#{cls}")
				validate = false

		if validate
			@$('#order-form').submit()
			$('#hidden-iframe').on 'load', () =>
				@$('#order-form, #hidden-iframe').remove()
				@$('#order-complete').removeClass('hide')
				$('body').scrollTop 0

	errorHandler: ($elem) ->

		$elem.parents('.control-group').addClass('error').find('.help-inline').html("You can't leave this empty.")


$('.order-body').load 'order_form.html', () ->
	orderView = new OrderView();
