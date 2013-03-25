// Generated by CoffeeScript 1.6.1
(function() {
  var OrderView;

  OrderView = Backbone.View.extend({
    initialize: function() {
      var _this = this;
      return $('#hidden-iframe').on('load', function() {
        _this.$('#order-form, #hidden-iframe').remove();
        return _this.$('#order-complete').removeClass('hide');
      });
    },
    el: '.order-body',
    events: {
      'change .order-campaign-goal[value="__other_option__"]': 'checkOtherCampaignGoal',
      'keydown .order-campaign-goal-other': 'keyDownOtherCampaignGoal',
      'click .order-submit-btn': 'validateForm',
      'load #hidden-iframe': 'completeSubmit'
    },
    checkOtherCampaignGoal: function(e) {
      var $this,
        _this = this;
      $this = $(e.currentTarget);
      return _.defer(function() {
        if (!$this.prop('checked')) {
          return _this.$('.order-campaign-goal-other').val('');
        }
      });
    },
    keyDownOtherCampaignGoal: function(e) {
      var $this,
        _this = this;
      $this = $(e.currentTarget);
      return _.defer(function() {
        return _this.$('.order-campaign-goal[value="__other_option__"]').prop('checked', $this.val() !== '');
      });
    },
    validateForm: function() {
      var validate,
        _this = this;
      validate = true;
      this.$('.control-group').removeClass('error').find('.help-inline').html('');
      this.$("#order-first-name, #order-last-name, #order-phone, #order-email, #order-company-name").each(function(ix, elem) {
        var $elem, value;
        $elem = $(elem);
        value = $.trim($elem.val());
        if (value === '') {
          _this.errorHandler($elem);
          validate = false;
        }
      });
      _.each([".order-target-marketing", ".order-campaign-goal"], function(cls) {
        if (_this.$("" + cls + ":checked").length === 0) {
          _this.errorHandler(_this.$("" + cls));
          return validate = false;
        }
      });
      if (validate) {
        return this.$('#order-form').submit();
      }
    },
    errorHandler: function($elem) {
      return $elem.parents('.control-group').addClass('error').find('.help-inline').html("You can't leave this empty.");
    },
    completeSubmit: function() {
      return console.log('complete submit');
    }
  });

  $('.order-body').load('order_form.html', function() {
    var orderView;
    return orderView = new OrderView();
  });

}).call(this);
