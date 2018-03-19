(function($) {
    $.fn.tabs = function(opt) {
        this.each(function () {
            var $tabs = $(this);
            var positionBar = function ($tab, hover) {
                var $bar = $tabs.find('[data-el=bar]');
                if (!$bar.length)
                    return;

                if (hover)
                    $bar.addClass('hover');
                else
                    $bar.removeClass('hover');

                if (!$tab)
                    $tab = $tabs.find('li.is-active').find('[data-el=tab]');
                $bar.css({
                    left: $tab.position().left,
                    width: $tab.width()
                });
            }

            if (typeof opt == 'string') {
                switch (opt) {
                    case 'update':
                        positionBar();
                        break;
                }
                return;
            }

            if ($tabs.find('> ul:first').length)
                new IScroll($tabs.find('> ul:first').wrap('<div>').parent()[0], { scrollX: true, scrollY: false, mouseWheel: true });

            $tabs.find('[data-el=tab]').click(function () {
                var $this = $(this);
                $tabs.find('[data-el=tab]').parents('li:first').removeClass('is-active');
                $this.parents('li:first').addClass('is-active');
                $tabs.find('[data-el=pane].is-active').removeClass('is-active');
                $tabs.find($this.attr('href')).addClass('is-active');
                positionBar($this);
                return false;
            }).mouseenter(function () {
                positionBar($(this), true);
            }).mouseleave(function () {
                positionBar();
            });
            positionBar();
        })
    }
})(jQuery);