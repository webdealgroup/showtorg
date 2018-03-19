(function($) {
    $.fn.itemCount = function() {
        this.each(function () {
            var $count = $(this);
            var $input = $count.find('input');
            var $num = $count.find('[data-el=num]');
            var price = $count.data('price');
            var max = $count.data('max');
            var $minus = $count.find('[data-el=minus]');
            var $plus = $count.find('[data-el=plus]');
            var calc = function (num) {
                var n = num * parseInt(price);
                $count.nearest('.js-item-click-price').html(n);
                $input.val(num);
                $count.trigger('change', n);
            }
            $minus.addClass('disabled');
            $minus.click(function () {
                var num = parseInt($num.html()) - 1;
                $plus.removeClass('disabled');
                if (num < 1)
                    return;
                $num.html(num);
                calc(num);
                if (num == 1)
                    $minus.addClass('disabled');
                else
                    $minus.removeClass('disabled');
            });
            $plus.click(function () {
                var num = parseInt($num.html()) + 1;
                $minus.removeClass('disabled');
                if (num > max)
                    return;
                $num.html(num);
                calc(num);
                if (num == max)
                    $plus.addClass('disabled');
                else
                    $plus.removeClass('disabled');
            });
        });
    }
})(jQuery);