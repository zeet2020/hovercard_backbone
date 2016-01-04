((w) ->

	class hoverView extends Backbone.View

		delegate:()->
			@el.on('show.bs.popover',@onshowcallback)
			@el.on('shown.bs.popover',@aftershowcallback)
			return

		onShow:(callback)->
			@onshowcallback = callback
			return @

		afterShow:(callback)->
			@aftershowcallback = callback
			return @

		initialize:(opt) ->
			if(opt.el)
				@el = opt.el
			if(opt.selector)
				@el = $(opt.selector)
			if(opt.template)
				@template = _.template(opt.template)
			if(opt.popover_opt)
				@popover_opt = opt.popover_opt
			if(opt.model)
				@model = new Backbone.Model opt.model
			return

		show:()->
			@el.popover('show')
			return
		destroy:()->
			@el.popover('destroy')
			return
		hide:()->
			@el.popover('hide')
			return

		render:() ->
			@$el.empty()
			@$el.html @template(@model.attributes)
			@popover_opt['content'] = @$el.html()
			@delegate()
			@el.popover(@popover_opt)
			return @



		Backbone.hovercard = (opt)->
			(new hoverView(opt).render())

)(window)
