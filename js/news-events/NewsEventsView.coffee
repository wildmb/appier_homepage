NewsEventsView = Backbone.View.extend

    el: "#layout-news-events"

    TEMPLATE: """
        <img src="image/index/Q.png" class="doc-body-email" alt="hello@appier.com">
        <img src="image/index/2013.png" class="doc-body-gdc" alt="2013 GDC Booth #208">
        <div class="doc-body-news-events">
          <a class="fb-link" href="https://www.facebook.com/AppierNetwork"></a>
          <a class="tw-link" href="https://twitter.com/GoAppier"></a>

          <div class="doc-body-news">
            <div class="doc-body-news-tag"></div>
          </div>

          <div class="doc-body-events">
            <div class="doc-body-events-tag"></div>
          </div>
        </div>
    """

    render: ->

        @$el.html NewsEventsView::TEMPLATE
        @


window.view = new NewsEventsView().render()