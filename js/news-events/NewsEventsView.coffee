NewsCollection = Backbone.Collection.extend

    url: 'http://api.tumblr.com/v2/blog/blog.appier.com/posts/text/'

    API_KEY: '4hYIViehR1Ct3dVS1TQU4a4O0k5YJj4wflgERcVCHwK8DCGxGQ'

    fetch: (options = {}) ->

        data = (options.data ?= {})
        data.api_key = NewsCollection::API_KEY
        data.limit = 2
        data.filter = 'text'

        options.dataType = 'jsonp'

        Backbone.Collection::fetch.call @, options

    parse: (response) ->

        if response.meta?.status isnt 200 then return []

        data = response.response ? []
        data.posts ? []


EventCollection = Backbone.Collection.extend

    url: "/js/event.json"

    parse: (response) ->

        now = (new Date()).getTime() / 1000
        _.filter response, (res) -> res.beginAt <= now <= res.endAt


NewsEventsView = Backbone.View.extend

    el: "#layout-news-events"

    TEMPLATE: """
        <a href="mailto:hello@appier.com">
            <img src="image/index/Q.png" class="doc-body-email" alt="hello@appier.com">
        </a>
        <a href="event.html">
            <img src="image/index/2013.png" class="doc-body-gdc" alt="2013 GDC Booth #208">
        </a>
        <div class="doc-body-resource">
            <b>Messaging apps on the rise</b><br>
            There are a few fundametal reasons as to why these social media...<br>
            <a href="resource.html">Download Now &gt;</a>
        </div>
        <div class="doc-body-news-events">
            <a class="fb-link" target="_blank" href="https://www.facebook.com/AppierNetwork"></a>
            <a class="tw-link" target="_blank" href="https://twitter.com/GoAppier"></a>

            <% if (news.length > 0) { %>
                <div class="doc-body-news-group">
                    <div class="doc-body-news-tag"></div>
                    <%= news.join('<hr>') %>
                </div>
            <% } %>

            <% if (events.length > 0) { %>
                <div class="doc-body-events-group">
                    <div class="doc-body-events-tag"></div>
                    <%= events.join('<hr>') %>
                </div>
            <% } %>
        </div>
    """

    renderNews: (newsModel) ->

        MONTH = [
            'January', 'February', 'March', 'April', 'May', 'June',
            'July', 'August', 'September', 'October', 'November', 'December'
        ]

        if not newsModel instanceof Backbone.Model then return ''

        #t = newsModel.get('timestamp')
        #d = (if t then new Date(t * 1000) else new Date())
        #publishDate = "#{MONTH[d.getMonth()]} #{d.getDate()} #{d.getFullYear()}"

        title = newsModel.get('title') ? ''
        title = title.slice(0, 96).concat('...')

        #return """
        #    <div class="doc-body-news">
        #        <div class="doc-body-news-time">#{publishDate}</div>
        #        <h5 class="doc-body-news-title">#{title}</h5>
        #        <a class="doc-body-news-link" href="#{newsModel.get('post_url') ? ''}" target="_blank">Read more &gt;</a>
        #    </div>
        #"""
        return """
            <div class="doc-body-news">
                <h5 class="doc-body-news-title">#{title}</h5>
                <a class="doc-body-news-link" href="#{newsModel.get('post_url') ? ''}" target="_blank">Read more &gt;</a>
            </div>
        """

    renderEvent: (eventModel) ->

        if not eventModel instanceof Backbone.Model then return

        return """
            <div class="doc-body-event">
                <div class="doc-body-news-time">#{eventModel.get('date')}</div>
                <h5 class="doc-body-news-title">#{eventModel.get('title')}</h5>
                <a class="doc-body-news-link" href="#{eventModel.get('link')}" target="_blank">Read more &gt;</a>
            </div>
        """

    render: ->

        data = news: [], events: []

        newsCollection = new NewsCollection()
        eventCollection = new EventCollection()

        $.when(newsCollection.fetch(), eventCollection.fetch()).done () =>
            newsCollection.each (m) => data.news.push(@renderNews(m))
            eventCollection.each (e) => data.events.push(@renderEvent(e))
            @$el.html(_.template(NewsEventsView::TEMPLATE, data))

        @


window.newsEventsView = new NewsEventsView().render()