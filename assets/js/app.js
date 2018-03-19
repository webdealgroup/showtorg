var isMobile = function () { return $('.header__logo-mobile').is(':visible'); }

$(function () {
    var $body = $('body');

    function initItemGallery($parent, opts) {
        function lightGallery($el, slide) {
            var img = [];
            var $gallery = $el.parent().find('.js-item-gallery');
            $el.find('img').each(function () {
                img.push({
                    src: $(this).attr('src'),
                    thumb: $(this).attr('src')
                })
            });

            $gallery.lightGallery({
                dynamic: true,
                dynamicEl: img,
                thumbnail:true,
                thumbMargin: 10,
                hideBarsDelay: 999999999,
                download: false,
                toogleThumb: false,
                counter: false,
                index: $el.parent().find('.js-item-gallery .swiper-slide-active').index()
            }).on('onCloseAfter.lg', function () {
                if ($gallery.data('lightGallery'))
                    setTimeout(function() { $gallery.data('lightGallery').destroy(true); $gallery.off(); }, 100);
            });
        }
        function imageZoom($img) {
            var $itemMeta = $parent.find('.item-meta');
            var $zoomContainer = $('<div>', { id: 'zoomContainer' }).css({ display: 'none', position: 'absolute', zIndex: 9, left: 0, top: 0, width: $itemMeta.outerWidth(), height: $itemMeta.outerHeight(),}).insertBefore($itemMeta);

            $img.elevateZoom({
                lensBorder: 3,
                borderSize: 3,
                zoomWindowPosition: 'zoomContainer',
                zoomWindowWidth: $itemMeta.outerWidth(),
                zoomWindowHeight: $itemMeta.outerHeight()
            }).on('show', function () {
                $zoomContainer.show();
            }).on('hide', function () {
                $zoomContainer.hide();
            }).on('destroy', function () {
                $zoomContainer.remove();
            });

            if (opts && opts.openOnClick)
                $img.bind('click', function () { lightGallery($parent.find('.js-item-gallery')); });
        }

        $parent.find('.js-item-gallery').each(function () {
            var $this = $(this);
            if ($this.data('init')) {
                if (!isTouchDevice())
                    imageZoom($this.find('.swiper-slide-active img'));
                return false;
            }
            $this.data('init', true);
            var galleryTop = SwiperProxy($this, {
                dots: true,
                nav: true,
                direction: 'vertical',
                slidesPerView: 1,
                paginationClickable: true,
                spaceBetween: 30,
                mousewheelControl: true,
                speed: 600,
                breakpoints: {
                    760: { direction: 'horizontal' }
                },
                onInit: function () {
                    $parent.find('.js-item-gallery-full').click(function () {
                        lightGallery($this);
                        return false;
                    });

                    if (!isTouchDevice() && opts && opts.imageZoom)
                        imageZoom($this.find('.swiper-slide-active img'));
                },
                onSlideChangeStart: function () {
                    $this.find('img').each(function () {
                        if ($(this).data('elevateZoom'))
                            $(this).data('elevateZoom').destroy();
                    });
                    if (!isTouchDevice() && opts && opts.imageZoom)
                        imageZoom($this.find('.swiper-slide-active img'));
                }
            });
            var galleryThumbs = new Swiper($parent.find('.js-item-gallery-thumbs').eq($this.index()), {
                spaceBetween: 16,
                centeredSlides: true,
                slidesPerView: 'auto',
                speed: 600,
                touchRatio: 0.2,
                slideToClickedSlide: true,
            });
            galleryTop.params.control = galleryThumbs;
            galleryThumbs.params.control = galleryTop;
        });
    };

    // About
    (function () {
        var $opinionsCarousel = $('.js-opinions');
        var elements = [];
        var sections = $('.js-about-sections > section');
        var navbarHeight = 90;

        if (!sections.length)
            return;

        var galleryTop = SwiperProxy($opinionsCarousel, {
            dots: false,
            nav: true,
            slidesPerView: 1,
            spaceBetween: 30,
            speed: 600,
            breakpoints: {
                760: { direction: 'horizontal' }
            },
        });

        $('.js-page-map').stick_in_parent({
            parent: '[data-sticky_parent]',
            offset_top: 80
        });

        $('.js-map-scroll').click(function () {
            $('html, body').animate({scrollTop: $($(this).attr('href')).offset().top - 90 }, 700);
            return false;
        });

        $(".js-map-scroll").each(function (i, link) {
            var $progress = $('<div class="p-about__map-rail js-map-rail"></div>');
            $progress.prependTo($(link).parent());

            elements.push({
                link: link,
                section: $($(link).attr('href'))[0],
                progress: $progress[0]
            });
        });

        var updateSectionBCR = function updateSectionBCR() {
            return elements.forEach(function (el) {
                var bcr = el.section.getBoundingClientRect();
                el.top = bcr.top + scrollY;
                el.height = bcr.height;
            });
        };

        var setStyle = function (percent) {

        }

        var updateProgress = function updateProgress() {
            return elements.forEach(function (el, index) {
                var y = scrollY - el.top + navbarHeight + 1;
                var h = el.height;

                var percent = y / h * 100;
                percent = Math.max(Math.min(percent, 100), 0);

                el.progress.style.height = 'calc(' + percent + "% - 2px)";

                var isActive = percent > 0 || percent == 100;
                el.link.classList[isActive ? "add" : "remove"]("is-active");

                if ($(el.section).isOnScreen() && elements[index - 1] && window.innerHeight + $(window).scrollTop() >= document.body.scrollHeight - 10 && $(window).scrollTop() < $(el.section).offset().top) {
                    elements[index - 1].progress.style.height = 'calc(100% - 2px)';
                    el.link.classList.add('is-active');
                }
            });
        };

        updateSectionBCR();
        updateProgress();
        $(window).scroll(updateProgress);
    })();

    // Contacts
    (function () {

        var loginModalSelector = '[data-remodal-id="to-director"]';
        var $modal = $(loginModalSelector);
        var $result = $('.md-director__result');

        $('.js-contact-form').submit(function () {
            $('.p-contacts__result').css('bottom', $(this).outerHeight() - 20 - ($('.p-contacts__submit').position().top + $('.p-contacts__submit').outerHeight())).show();
            $('.success-form').height($('.order-step:last').outerHeight() + $('.p-contacts__submit').outerHeight() + 20);
            return false;
        });

        $('.js-contact-form-clear').click(function () {
            var $form = $('.js-contact-form');
            $form.trigger('reset');
            $form.find('select').trigger('change.select2');
            $form.find('input').change().focusout();
            return false;
        })

        $('.js-director-form').submit(function () {
            $modal.find('.title, form').animate({ opacity: 0 }, function () {
                $modal.data('style', { width: $modal.outerWidth(), height: $modal.outerHeight() })
                $modal.animate({ maxWidth: 600, height: $result.outerHeight() }, function () {
                    $modal.find('.title, form').hide();
                    $result.fadeIn();
                });
            })
            return false;
        });

        $('.js-director-more').click(function () {
            $result.fadeOut(null, function () {
                var style = $modal.data('style');
                $modal.animate({ maxWidth: style.width, height: style.height }, function () {
                    $modal.find('.title, form').show();
                    $modal.attr('style', '');
                    $modal.find('.title, form').animate({ opacity: 1 });
                });
            });
            return false;
        })

        var $remodal = $modal.remodal({ hashTracking: false });
        $(document).on('opening', loginModalSelector, function () {
            $('.remodal-overlay').addClass('md-login-overlay');
        });
        $(document).on('closed', loginModalSelector, function () {
            $('.remodal-overlay').removeClass('md-login-overlay');
        });
    })();

    // Dropdown
    (function () {
        var close = function () {
            $('.dropdown').removeClass('is-active');
            $('.js-dropdown-toggle.is-active').removeClass('is-active');
        };
        var appear = function ($toggle, $block) {
            if (!$block.find('> i').length)
                $block.prepend($('<i>'));
            var $i = $block.find('> i');
            var $positioned = $toggle.find('.js-positioned').length ? $toggle.find('.js-positioned') : $toggle;
            if ($block.offset().left + $block.outerWidth() > $('.topbar > .l-wrapper').width()) {
                $i.css({ left: 'auto', 'right': ($toggle.parent().outerWidth() - ($positioned.outerWidth() + $positioned.position().left)) + ($positioned.outerWidth() / 2) - ($i.width() / 2)})
                $block.css({ left: 'auto', right: 0 })
            } else {
                $i.css({ left: $positioned.position().left + $positioned.width() / 2 - ($i.width() / 2), right: 'auto' })
                $block.css({ left: 0, right: 'auto' })
            }
        }
        $('.js-dropdown-toggle').click(function (e) {
            var $toggle = $(this);
            var $dropdown = $toggle.parents('.dropdown:first');
            var $block = $dropdown.find('.dropdown__block');
            close();
            $dropdown.toggleClass('is-active');
            appear($toggle, $block);
            $dropdown.find('.js-custom-scroll').perfectScrollbar('update');
            e.preventDefault();
            return false;
        });

        $('.js-dropdown-close').click(function (e) {
            close();
            e.preventDefault();
            return false;
        })

        /*
        $('.js-bonus-target').each(function () {
            var $target = $(this);
            var $bonus = $target.parents('.bonus:first');
            var $block = $bonus.find('.bonus__block');
            $block.fadeIn();
            appear($target, $block);
        });
        */

        $('.js-bonus-close').click(function () {
            $(this).parent().remove();
            return false;
        });

        $('html').click(function (e) {
            var $t = $(e.target);

            if (!$t.parents('.dropdown').length)
                close();
        });

        if (!$('.js-header').hasClass('fixed'))
            $('.js-dropdown-location').click();
    })();

    (function () {
        var $select = $('.js-location-select');
        var $selectBlock = $('.js-location-list')
        var $selectHeader = $('.js-location-header');
        var $html = $('html, body');
        $('.js-location-select-toggle').click(function () {
            $select.addClass('is-active');
            $html.addClass('scroll-lock');
            $selectBlock.css('height', $select.innerHeight() - 50 - $selectHeader.outerHeight())
            setTimeout(function () {
                $select.find('.js-custom-scroll').perfectScrollbar('update');
            }, 0);
            return false;
        });

        $('.js-location-close').click(function () {
            $select.removeClass('is-active');
            $html.removeClass('scroll-lock');
            return false;
        });
    })();

    (function () {
        var $carousel = $('.js-index-carousel');
        var $indicator = $('.js-index-carousel-indicator > span');
        var autoplay = 10000;
        var speed = 600;
        var i = 0;
        var swiper = SwiperProxy($carousel, {
            dots: true,
            nav: true,
            slidesPerView: 1,
            paginationClickable: true,
            speed: speed,
            autoplay: autoplay,
            autoplayDisableOnInteraction: false,
            loop: true,
            onPaginationRendered: function () {
                $carousel.parent().find('.swiper-dot').each(function () {
                    $(this).html('<div class="pie spinner"></div><div class="pie filler"></div><div class="mask"></div>');
                    $(this).find('> *').css('animation-duration', (autoplay) + 'ms');
                });
            },
            onAutoplayStart: function() {
                $indicator.css({ transition: 'width linear ' + (autoplay - speed) + 'ms', width: '100%'});
            },
            onSlideChangeStart: function() { i++; $indicator.css({ transition:  'width linear ' + (speed) + 'ms', width: '0'}); },
            onSlideChangeEnd: function() {

                if (i <= 1)
                    return;
                $indicator.css({ transition: 'width linear ' + (autoplay) + 'ms', width: '100%'});
                $carousel.parent().find('.swiper-dot').each(function () {
                    $(this).find('> *').css('animation-duration', (autoplay + speed) + 'ms');
                });
            }
        });
    })();

    (function () {
        SwiperProxy($('.js-items-carousel'), {
            dots: true,
            nav: true,
            slidesPerView: 1,
            paginationClickable: true,
            speed: 600,
            loop: true,
            spaceBetween: 16,
            breakpoints: {
                480: { spaceBetween: 8 }
            }
        });

        SwiperProxy($('.js-items-popular-carousel'), {
            dots: true,
            nav: true,
            slidesPerView: 1,
            paginationClickable: true,
            speed: 600,
            loop: true,
            autoHeight: true
        });
    })();

    (function () {
        $body.on('mouseenter', '.js-item-grid', function () {
            var $item = $(this);
            var $carousel = $item.find('.js-item-gallery-carousel');
            if (!$carousel.length || isTouchDevice())
                return;
            $carousel.parent().show();
            $item.addClass('is-hover');

            SwiperProxy($carousel, {
                dots: true,
                nav: true,
                slidesPerView: 1,
                paginationClickable: true,
                speed: 600,
                loop: true,
                onInit: function () {
                    var i = 0;
                    $carousel.find('.swiper-slide:not(.swiper-slide-duplicate)').each(function () {
                        var $img = $(this).find('.js-item-carousel-image');
                        $carousel.parent().find('.swiper-dot').eq(i).css('background', $img.data('color')).html('<i style="border-color: transparent transparent ' + $img.data('color') + ' transparent"></i>');
                        i++;
                    });
                }
            });
        }).on('mouseleave', '.js-item-grid', function () {
            var $item = $(this);
            var $carousel = $item.find('.js-item-gallery-carousel');
            if (!isTouchDevice())
                $item.removeClass('is-hover');
            if ($carousel.length) {
                $carousel.parent().hide();
            }
        });
    })();

    (function () {
        $body.on('click', '.js-item-remove', function () {
            var $tgl = $(this);
            var $item = $tgl.parents('.item-grid:first, .item-cart:first, .item-click:first');
            $item.toggleClass('removed');
            $tgl.toggleClass('is-active');
            return false;
        });
    })();


    function phoneMaskInit($parent) {
        var $selector = !$parent ? $('.js-phone-mask') : $parent.find('.js-phone-mask')
        $selector.mask("(999) 999-99-99", { placeholder:"(___) ___-__-__" });
    }
    phoneMaskInit();

    (function () {
        $('.js-mask-input').each(function () {
            var $this = $(this);
            var placeholder = $this.data('mask').replace(/9/g, '_');
            $this.attr('placeholder', placeholder).prop('placeholder', placeholder).mask($this.data('mask'), { placeholder: placeholder });
        })
    })();


    // Up bn
    (function () {
        var $upBtn = $('.js-up-btn');
        var showed = false;
        var showing = function () {
            var scroll = $(window).scrollTop();
            if (scroll < 300) {
                $upBtn.fadeOut();
                showed = false;
            } else {
                if (!showed) {
                    showed = true;
                    $upBtn.fadeIn();
                }
            }
        }
        showing();
        $(window).scroll(showing);
        $upBtn.click(function () {
            $("html, body").stop().animate({scrollTop:0}, 500, 'swing');
            return false;
        });
    })();

    (function () {
        var init = function () {
            $('.js-replace-block').each(function () {
                var $this = $(this);
                var $old = $('.js-replace-old[data-target="' + this.id + '"]');
                $('.js-replace-place[data-target="' + this.id + '"]').each(function () {
                    var $place = $(this);
                    if (window.innerWidth <= parseInt($place.data('width'))) {
                        $this.appendTo($place)
                    } else {
                        $this.appendTo($old);
                    }
                })
            })
        }
        $('.js-replace-block').each(function () {
            var $this = $(this);
            $(this).wrap('<div data-target="' + this.id + '" class="js-replace-old">');
        });

        init();
        $(window).resize(init);
    })();

    (function () {
        $('.js-scroll-to').click(function (e) {
            var el = $( $(this).attr('href') );
            var elOffset = el.offset().top;
            var elHeight = el.height();
            var windowHeight = $(window).height();
            var offset;

            if (elHeight < windowHeight) {
                offset = elOffset - ((windowHeight / 2) - (elHeight / 2));
            }
            else {
                offset = elOffset;
            }
            var speed = 700;
            $('html, body').animate({scrollTop:offset}, speed);
            return false;
        })
    })();


    (function () {
        var $block = $('.js-rate');
        $block.find('label').click(function () {
           $block.find('.is-active').removeClass('is-active');
           $(this).addClass('is-active');
        });
    })();

    // Header
    (function () {
        var $mnav = $('.js-m-nav');
        var $main = $('.js-main');
        var $nav = $('.js-nav');
        var $navToggle = $('.js-nav-toggle');
        var $header = $(".header");
        var pos = $header.offset().top + $header.outerHeight();
        function headerFixed() {
            var top = $(document).scrollTop();
            if ($header.hasClass('is-active') || isMobile())
                return;
            if (top > 0 && top > pos && !$header.hasClass('fixed')) {
                pos = $header.offset().top + $header.outerHeight();
                $main.css('padding-top', $header.outerHeight())
                $header.addClass('fixed');
                if (!isMobile())
                    $nav.hide();
            } else if (top <= pos - 100 && $header.hasClass('fixed')) {
                $main.css('padding-top', 0);
                $header.removeClass('fixed');
                if (!isMobile()) {
                    $nav.show();
                    $navToggle.removeClass('is-active');
                }
            }
        }

        var slideout = new Slideout({
            panel: $main[0],
            menu: $mnav[0],
            padding: $mnav.width(),
            tolerance: 70,
            duration: 600,
            easing: 'cubic-bezier(0.175, 0.885, 0.32, 1.275)',
            touch: false
        });
        var open = function() {
            $navToggle.addClass('is-active');
            $header.css('position','absolute').css('top', ($(window).scrollTop()) + 'px');
        }
        slideout.on('translatestart', open);
        slideout.on('beforeopen', open);
        slideout.on('close', function() { $header.attr('style', '').prop('style', ''); });
        slideout.on('beforeclose', function () { $navToggle.removeClass('is-active'); });

        $navToggle.click(function () {
            if (isMobile())
                slideout.open();
            else {
                $navToggle.toggleClass('is-active');
                $nav.slideToggle();
            }
            return false;
        });

        $main.click(function () {
            if (slideout.isOpen()) {
                slideout.close();
                return false;
            }
        });

        $('.js-search-toggle').click(function () {
            $('.js-search').slideToggle();
            return false;
        });

        $('.js-search-close').click(function () {
            $('.js-search').slideUp();
            return false;
        });

        $(window).scroll(headerFixed);
        headerFixed();
    })();

    // Catalog
    (function () {
        var $navBar = $('.js-nav-bar');
        var $catalog = $('.js-catalog');
        var $mCatalog = $('.js-m-catalog');
        var $header = $('.js-header');
        var $htmlBody = $('html, body');
        var scrollTop = 0;
        var showTimeout, closeTimeout;
        var showDelay = 200, closeDelay = 100;
        var scrollbarWidth = (function() {
            var result = 0,
                $outer = $('<div>').css({ overflow: 'scroll', visibility: 'hidden', height: '100px', position: 'absolute', msOverflowStyle: 'scrollbar', left: 0, top: 0, width: '100%', zIndex: -9999})
            $inner = $('<div>').css({ width: '100%', height: '1px'});
            $outer.append($inner);
            $body.append($outer);
            result = $outer.width() - $inner.width();
            $outer.remove();
            return result;
        })();
        var close = function () {
            if (!$catalog.hasClass('is-active'))
                return;
            if (!$header.hasClass('fixed')) {
                //$header.css('margin-bottom', 0);
                $body.css('padding-top', 0);
            }
            $header.css('top', 0);
            $('.js-catalog-toggle.is-active').removeClass('is-active');
            $catalog.removeClass('is-active');
            $header.removeClass('is-active');
            $htmlBody.removeClass('scroll-lock');
            $body.removeClass('shadowed');
            $(document).scrollTop(scrollTop);
            $navBar.fadeOut();
            if ($header.find('> *').height() <= window.innerHeight) {
                $body.css('padding-right', 0)
                $header.css('margin-right', 0);
                $header.find('.header__inn > *').css('padding-right', 0);
            }
        };
        $('.js-catalog-toggle').mouseenter(function () {
            var $this = $(this);
            clearTimeout(closeTimeout);
            clearTimeout(showTimeout);
            showTimeout = setTimeout(function () {
                scrollTop = $(document).scrollTop();

                $('.js-catalog-toggle.is-active').removeClass('is-active');
                $this.addClass('is-active');
                $navBar.fadeIn().css({
                    left: $this.find('span').position().left,
                    width: $this.find('span').width()
                });
                if ($catalog.hasClass('is-active'))
                    return false;

                if (!$header.hasClass('fixed')) {
                    //$header.css('margin-bottom', -1 * $catalog.outerHeight());
                    $body.css('padding-top', $header.outerHeight());
                    $header.css('top', -1 * scrollTop)

                }

                $catalog.addClass('is-active');
                $header.addClass('is-active');
                $htmlBody.addClass('scroll-lock');
                $body.addClass('shadowed');

                // Убираем дергание страницы при скрытии скроллбара
                if ($header.find('> *').height() <= window.innerHeight) {
                    $body.css('padding-right', scrollbarWidth)
                    $header.css('margin-right', -1 * scrollbarWidth);
                    $header.find('.header__inn > *').css('padding-right', scrollbarWidth);
                }
            }, showDelay);
        }).mouseleave(function () {
            clearTimeout(showTimeout);
            closeTimeout = setTimeout(close, closeDelay);
        });

        $catalog.mouseenter(function () {
            clearTimeout(closeTimeout);
        }).mouseleave(function () {
            closeTimeout = setTimeout(close, closeDelay);
        });

        $('.js-catalog-close').click(function (e) {
            close();
            e.preventDefault();
            return false;
        });

        var isTranslating = false;
        var isAjax = false;
        var prevLists = [];
        var showList = function ($current, $new, title) {
            if (isTranslating)
                return false;
            isTranslating = true;
            $current.width($current.width());
            $new.width($current.width());
            if (title) {
                $new.prepend('<li class="m-catalog__title js-m-catalog-back">' + title + '</li>');
            }
            $new.css({ position: 'absolute', top: 0, left: (title ? 1 : -1) * $current.width(), zIndex: 1 }).insertAfter($current);
            $current.css('left', (title ? -1 : 1) * $current.width());
            $new.css('left', 0);
            $mCatalog.height($new.height());
            setTimeout(function () {
                $mCatalog.css('height', $new.height());
                $current.remove();
                $new.css('position', 'relative');
                isTranslating = false;
            }, 500);
        }
        $body.on('click', '.js-m-catalog-link', function () {
            var $link = $(this);
            var $list = $link.parents('.m-catalog__list:first');
            if (isAjax)
                return false;
            isAjax = true;
            prevLists.push($mCatalog.html());
            $mCatalog.height($mCatalog.height());
            $.get('submenu.html?id=' + $link.data('id'), function (response) {
               var $sub = $(response);
               showList($list, $sub, $link.text());
                isAjax = false;
            });
            return false;
        });

        $body.on('click', '.js-m-catalog-back', function () {
            showList($(this).parents('.m-catalog__list:first'), $(prevLists.pop()));
            return false;
        })
    })();


    // Add to fav or cart
    (function () {
        var flyTo = function ($btn, $to)   {
            var $item = $btn.parents('.js-item:first');
            var imgtodrag = $item.find('.owl-loaded').length ? $item.find('.owl-item.active img') : $item.find(".js-item-main-img");
            if (imgtodrag.length) {
                var $wrap = $('<div>').css({ position: 'absolute', left: 0, top: 0, width: '100%', height: '100%', overflow: 'hidden' });
                $wrap.prependTo('body');
                var imgclone = $('<img>').attr('src', imgtodrag.attr('src'))
                    .offset({ top: imgtodrag.offset().top, left: imgtodrag.offset().left})
                    .css({ opacity: '0.5', position: 'absolute', height: imgtodrag.height(), width: imgtodrag.width(), zIndex: '9999'})
                    .appendTo($wrap)
                    .animate({ top: $to.offset().top + 10, left: $to.offset().left + 10, width: imgtodrag.width() / 2, height: imgtodrag.height() / 2}, 1000);

                imgclone.animate({ 'width': 0, 'height': 0}, function () {
                    $wrap.remove();
                    $to.addClass('rubberBand').addClass('animated');
                    setTimeout(function () { $to.removeClass('animated').removeClass('rubberBand'); }, 1000);
                });
            }
        }
        var $cart = $('.js-cart');
        var $favs = $('.js-favs');

        $body.on('click', '.js-cart-add', function () {
            var $this = $(this);
            if (!$this.hasClass('is-active')) {
                flyTo($this, $cart);
                $this.addClass('is-active');
            } else
                $this.removeClass('is-active');

            return false;
        });

        $body.on('click', '.js-fav-add', function () {
            var $this = $(this);
            if (!$this.hasClass('is-active')) {
                flyTo($this, $favs);
                $this.addClass('is-active').addClass('is-clicked');
            } else
                $this.removeClass('is-active').removeClass('is-clicked');

            return false;
        });
    })();

    // Fast view
    (function () {
        var $fastView = $('.js-fast-view');
        var $htmlBody = $('html, body');
        var $prevNext = $('.fast-view__prev, .fast-view__next');
        var offset = 20;
        var close = function () {
            if (!$fastView.hasClass('is-active'))
                return;
            $fastView.removeClass('is-active');
            $htmlBody.removeClass('scroll-lock');
            $fastView.find('.js-item-gallery img').each(function () {
                if ($(this).data('elevateZoom'))
                    $(this).data('elevateZoom').destroy();
            })
            $prevNext.hide();
        };

        $('.js-fast-view-toggle').click(function () {
            $fastView.addClass('is-active');
            $htmlBody.addClass('scroll-lock');
            $prevNext.width(($fastView.outerWidth() - $fastView.find('.fast-view__container').outerWidth()) / 2);
            $fastView.find('.js-tabs').tabs('update');
            setTimeout(function () {
                initItemGallery($fastView);
            }, 1);
            setTimeout(function () {
                $prevNext.fadeIn();
            }, 300);
            return false;
        });

        $('.js-fast-view-next').mouseenter(function () {
            $(this).css('margin-left', -1 * Math.abs($(this).parent().outerWidth() - $(this).outerWidth() - offset));
            $fastView.addClass('is-overlay');
        }).mouseleave(function () {
            $(this).css('margin-left', offset);
            $fastView.removeClass('is-overlay');
        });

        $('.js-fast-view-prev').mouseenter(function () {
            $(this).css('margin-right', -1 * Math.abs($(this).parent().outerWidth() - $(this).outerWidth() - (offset * 2)));
            $fastView.addClass('is-overlay');
        }).mouseleave(function () {
            $(this).css('margin-right', offset);
            $fastView.removeClass('is-overlay');
        });

        $('.js-fast-view-close').click(function () {
            close();
            return false;
        });

        $('html').click(function (e) {
            var $t = $(e.target);

            if (!$t.parents('.fast-view__block').length)
                close();
        });
    })();

    (function () {
        $('.js-tabs').tabs();
    })();

    // Order search autocomplete
    (function () {
        $('.js-order-search').each(function () {
            var $this = $(this);

            new Awesomplete(this, {
                list: [ {type: 'order', id: 18345}, {type: 'item', id: 18887744} ],
                data: function (item, input) {
                    var typeLabels = { order: 'Номер заказа', item: 'Номер товара' };
                    return { label: typeLabels[item.type] + ': ' + item.id , value: item.id };
                }
            });

            $this.on('awesomplete-open', function () { $this.addClass('is-autocomplete'); });

            $this.on('awesomplete-close', function () { $this.removeClass('is-autocomplete'); });
        })
    })();

    // Login modal init
    (function () {
        var loginModalSelector = '[data-remodal-id=login]';
        var $modal = $(loginModalSelector);
        var $remodal = $modal.remodal({ hashTracking: false });
        $(document).on('opening', loginModalSelector, function () {
            $('.remodal-overlay').addClass('md-login-overlay');
        });
        $(document).on('closed', loginModalSelector, function () {
            $('.remodal-overlay').removeClass('md-login-overlay');
        });
        $('.js-login-tab-toggle').click(function () {
            $('a[href="#login_tab"]').click();
        });
        $('.js-register-tab-toggle').click(function () {
            $('a[href="#register_tab"]').click();
        });
    })();

    // Show/Hide password button
    (function () {
        $('.js-toggle-password-btn').click(function () {
            var $this = $(this);
            var $input = $this.parent().parent().find('.js-toggle-password');
            $this.toggleClass('is-active');
            if ($this.hasClass('is-active')) {
                $this.attr('title', 'Скрыть пароль')
                $input.attr('type', 'text');
            } else {
                $this.attr('title', 'Показать пароль')
                $input.attr('type', 'password');
            }
            return false;
        })
    })();

    // Complex input
    (function () {
        $('.js-complex-input').each(function () {
            var $parent = $(this);
            $parent.prepend('<span class="complex-input__status"></span>')
            $parent.find('input, textarea').focus(function () {
               $parent.addClass('is-focus');
               $parent.find('.complex-input__error').fadeOut(null, function() { $(this).remove(); })
            }).focusout(function () {
                $parent.removeClass('is-focus');
                if (this.value.trim() != '') {
                    $parent.addClass('is-not-empty').addClass('is-valid');
                } else {
                    $parent.removeClass('is-not-empty').removeClass('is-valid');
                }
            });
        });
    })();


    (function () {
        function getChar(event) {
            if (event.which == null) { // IE
                if (event.keyCode < 32) return null; // спец. символ
                return String.fromCharCode(event.keyCode)
            }

            if (event.which != 0 && event.charCode != 0) { // все кроме IE
                if (event.which < 32) return null; // спец. символ
                return String.fromCharCode(event.which); // остальные
            }

            return null; // спец. символ
        }

        $('.js-password-row').find('input').bind('keyup', function (e) {
            var $input = $(this);
            var char = e.keyCode || e.which;

            if (char == 8 && this.value == '') {
                $input.parent().prev().find('input').focus();
            }
        });

        $('.js-password-row').find('input').on('keypress', function (e) {
            var $input = $(this);
            var char = e.keyCode || e.which;

            if (char == 39) {
                $input.parent().next().find('input').focus();
                return false;
            }
            if (char == 37) {
                $input.parent().prev().find('input').focus();
                return false;
            }
            this.value = getChar(e);
            if (this.value.length == 1)
                $input.parent().next().find('input').focus();
            if (this.value.length == 0)
                $input.parent().prev().find('input').focus();
            return false;
        });
    })();

    (function () {
        $('.js-parent-remove').click(function () {
            $(this).parent().remove();
            return false;
        });
    })();

    // Example form
    (function () {
        $('.js-example-form').submit(function () {
            var $modal = $(this).parents('.modal:first');
            $(this).find('input[data-error]').each(function () {
                var $input = $(this);
                var $parent = $input.parent();
                var $error = !$parent.find('.complex-input__error').length ? $('<div class="complex-input__error complex-input__error--warning">') : $parent.find('.form-input-error')
                $error.html($input.data('error'));
                $error.appendTo($parent);
                $error.show();
                $modal.addClass('panelShakeAnimation');
                setTimeout(function () {
                    $modal.removeClass('panelShakeAnimation');
                }, 400);
                $parent.addClass('complex-input--warning');
            });
           return false;
        });
    })();

    // Filters
    (function () {
        var $filters = $('.js-catalog-filters');
        var close = function () {
            $('.filter').removeClass('is-active');
            $('.filter').parent().find('.js-filter-label').removeClass('is-active');
        };

        function declOfNum(number, titles) {
            var cases = [2, 0, 1, 1, 1, 2];
            number = Math.abs(number);
            return titles[ (number%100>4 && number%100<20)? 2 : cases[(number%10<5)?number%10:5] ];
        }

        $('.js-catalog-filters-toggle').click(function () {
            $filters.css('top', $(this).position().top).show();
            return false;
        });

        $('.js-filters-close').click(function () {
            $filters.hide();
            return false;
        })

        $('.js-filter-label').click(function () {
            var $this = $(this);
            if (!$this.hasClass('is-active'))
                close();
            $this.toggleClass('is-active');
            $this.parent().find('.filter').toggleClass('is-active');
            return false;
        })

        $('.js-filter').each(function () {
            var $filter = $(this);
            var $inn = $filter.find('.filter__inn');
            var $dropdown = $filter.find('.filter__dropdown');
            var $label = $filter.find('.filter__label');
            var manyText = $label.data('many');
            var $remove = $('<div class="filter__remove">');
            $inn.prepend($remove);
            $dropdown.prepend('<i></i>');
            $filter.data('label', $label.html());

            $filter.find('.js-filter-toggle').click(function () {
                var $this = $(this);
                var $filter = $this.parents('.filter:first');
                var $dropdown = $filter.find('.filter__dropdown');
                close();
                $filter.addClass('is-active');
                $filter.parent().find('.js-filter-label').addClass('is-active');
                $dropdown.find('.js-custom-scroll').perfectScrollbar('update');
                return false;
            });

            $filter.find('.js-filter-append').click(function () {
                if ($dropdown.find('input[type=checkbox]').length) {
                    var l = $dropdown.find('input:checked').length;
                    if (!l) {
                        $filter.removeClass('is-active');
                        return false;
                    }

                    $label.html(l + ' ' + declOfNum(l, manyText));
                }
                if ($dropdown.find('[data-type=from], [data-type=to]').length) {
                    var from = $dropdown.find('[data-type=from]').val();
                    var to = $dropdown.find('[data-type=to]').val();
                    var text = '';
                    if (from == '' && to == '') {
                        $filter.removeClass('is-active');
                        return;
                    }
                    if (from != '' && to != '')
                        text = from + '-' + to;
                    if (from != '' && to == '')
                        text = 'от ' + from;
                    if (from == '' && to != '')
                        text = 'до ' + to;

                    $label.html($filter.data('label') + ': ' + text);
                }
                $filter.parent().find('.js-filter-label').removeClass('is-active');
                $filter.addClass('is-selected').removeClass('is-active');
                return false;
            });

            $remove.click(function () {
                $filter.removeClass('is-selected').removeClass('is-active');
                $label.html($filter.data('label'));
                return false;
            })
        });

        $('.js-filters-clear').click(function () {
            $(this).parents('form:first').trigger('reset').find('.filter__remove').click();
            return false;
        });

        $('html').click(function (e) {
            var $target = $(e.target);

            if (!$target.parents('.filter').length)
                close();
        });

    })();

    (function () {
        $('.js-range-slider').each(function () {
            var $slider = $(this);
            var $inputFrom = $slider.parent().find('[data-type=from]');
            var $inputTo = $slider.parent().find('[data-type=to]');

            $slider.ionRangeSlider({
                hide_min_max: true,
                grid: false,
                type: 'double',
                force_edges: true,
                hide_from_to: true
            });
            var slider = $slider.data("ionRangeSlider");
            var onchange = function () {
                slider.update({
                    from: $inputFrom.val(),
                    to: $inputTo.val()
                });
            }
            $slider.on('change', function (e) {
                var $input = $(e.target);
                var from = $input.data("from"),
                    to = $input.data("to");
                if ($slider.data('min') != from)
                    $inputFrom.val(from);
                if ($slider.data('max') != to)
                    $inputTo.val(to);
            });

            $inputFrom.on('input', onchange);
            $inputTo.on('input', onchange);
        });
    })();

    (function () {
        $('.js-sort-item').click(function () {
            var $this = $(this);
            var $sort = $this.parents('.js-sort:first');
            $sort.find('.js-sort-item.is-active').removeClass('is-active');
            $this.addClass('is-active');
            $sort.find('.dropdown').removeClass('is-active');
            $('.js-sort-label').html($(this).find('> span').html());
        });
    })();

    // Items
    (function () {
        var $grid = $('.js-items-grid');

        $grid.isotope({
            itemSelector: '.items__cell',
            filter: '[data-type="' + $('.js-items-grid-filter.is-active').data('type') + '"]'
        });

        $('.js-items-grid-filter').click(function () {
            var $this = $(this);
            $this.parent().find('.is-active').removeClass('is-active');
            $this.addClass('is-active');
            $grid.isotope({ filter: '[data-type=' + $this.data('type') + ']' });
            return false;
        })
    })();

    (function () {
        $('.js-item-count').itemCount();
        $('.js-item-cart-count').on('change', function (e, num) {
            var $progress = $('.js-cart-progress-bar');
            var $bar = $progress.find('[data-el=bar]');
            var $left = $progress.find('[data-el=left]');
            var to = $progress.data('to');
            var width = (num / to) * 100;
            var left = to - num;
            if (width > 100) width = 100;
            if (width < 0) width = 0;
            if (left < 0) left = 0;
            $bar.css('width', width + '%');
            $left.html(number_format(left, 0, ' ', ' '));
        })
    })();

    (function () {
        $body.on('click', '.js-item-add', function () {
            var $tgl = $(this);
            var $item = $tgl.parents('.item-grid:first, .item-cart:first');
            $item.toggleClass('added');
            $tgl.toggleClass('item-grid__action--add').toggleClass('item-grid__action--added');
            return false;
        });
    })();

    (function () {
        $('input[data-target]').each(function () {
            var $this = $(this);
            var $target = $this.nearest($this.data('target'));
            var check = function () {
                if ($this.get(0).checked)
                    $target.removeClass('hidden');
                else
                    $target.addClass('hidden');
            }
            check();
            $this.change(check);
        });
    })();

    (function () {
        $('.js-image-preview').each(function () {
            $.uploadPreview({
                input_field: $(this).find('input'),
                preview_box: $(this).find('[data-preview-box]'),
                success_callback: function() {}
            });
        });
    })();

    // Orders step
    (function () {
        var show = function ($hidingStep, $showingStep) {
            if ($hidingStep.is($showingStep) || !$showingStep.is(':visible'))
                return;
            if ($showingStep.is($hidingStep.next()))
                $hidingStep.addClass('is-completed');
            $hidingStep.find('.order-step__inn').slideUp(null, function () {
                var $q = $showingStep.clone().css({ position: 'absolute', visibility: 'hidden', zIndex: -999, opacity: 0 }).insertAfter($showingStep).show();
                $q.find('.order-step__inn').show();
                if (isMobile())
                    scrollToVCenter({ top: $showingStep.offset().top, height: $q.outerHeight() });
                $q.remove();
                $showingStep.find('.order-step__inn').slideDown(null, function () {
                });
                $('.order-step.is-active').removeClass('is-active');
                $showingStep.addClass('is-active');
            });


        }
        $('.js-order-next-step').click(function () {
           var $currentStep = $(this).parents('.order-step:first');
           var $nextStep = $currentStep.next();
           if (!$nextStep.length) {
               $currentStep.addClass('is-completed').find('.order-step__inn').hide();
               scrollToVCenter($('.js-order-total'));
               return false;
           }
            show($currentStep, $nextStep);
           return false;
        });

        $('.js-order-prev-step').click(function () {
            var $currentStep = $(this).parents('.order-step:first');
            var $prevStep = $currentStep.prev();
            show($currentStep, $prevStep);
            return false;
        });

        $('.js-order-step-edit').click(function () {
            var $step = $(this).parents('.order-step:first');
            var $activeStep = $('.order-step.is-active');
            show($activeStep, $step);
            return false;
        });

        var isAnimActive = false;
        $('.js-order-gift-type').change(function () {
            if (isAnimActive)
                return false;
            $('.gift-box__img:not(:first-child)').remove();
            var $currentImg = $('.gift-box__img');
            var duration = 400;
            var imgSrc = $(this).parent().find('img').attr('src');
            var $newImg = $currentImg.clone().addClass(!isMobile() ? 'fadeInDown' : 'fadeInLeft').attr('src', imgSrc);
            isAnimActive = true;
            $currentImg.css({
                position: 'absolute',
                left: $currentImg.position().left,
                top: $currentImg.position().top
            });
            $newImg.insertBefore($currentImg).css('animation-duration', duration + 'ms');
            $currentImg.addClass(!isMobile() ? 'fadeOutDown' : 'fadeOutRight').css('animation-duration', duration + 'ms');
            setTimeout(function () {
                $newImg.removeClass('fadeInDown').removeClass('fadeOutDown').removeClass('fadeOutRight').removeClass('fadeInLeft');
                $currentImg.remove();
                isAnimActive = false;
            }, duration);
        });

        $('.js-gift-toggle').change(function () {
            if (this.checked)
                $('.order-step__inn:eq(1)').slideUp();
        });

        $('.js-gift-card-toggle').change(function () {
            var $tr = $('.js-gift-card-triangle');
            var $p = $(this).parents('.switcher:first');
            var $label = $p.find('.switcher__label');
            $tr.css('left', $p.position().left + $label.position().left + $label.width() / 2 - ($tr.width() / 2));
        });

        $('.js-input-length').on('input', function () {
            var $this = $(this);
            var maxLength = $this.attr('maxlength');
            var $left = $this.parent().parent().find('[data-symb-left]');
            $left.html(maxLength - $this.val().length);
        });
    })();

    // Plugins init
    (function () {
        // Odometer
        $('.js-odometer').each(function () {
            new Odometer({
                el: this,
                value: this.innerHTML.replace(/\D/, ''),
                format: '( ddd)',
                theme: 'default',
                duration: 100
            });
        });

        // Switchery
        $('.js-switchery').each(function () {
            var sw = new Switchery(this, {
                size: 'small',
                jackSecondaryColor: '#b8b8b8',
                color: '#2268d2'
            });
        })

        // Select2
        $('.select').each(function () {
            var state = function (state) {
                var icon = $(state.element).data('icon');
                return icon ? $('<span>' + '<svg class="icon icon-' + icon + '"><use xmlns:xlink="http://www.w3.org/1999/xlink" xlink:href="assets/img/sprite.svg#icon-' + icon + '"></use></svg>' + state.text + '</span>') : state.text;
            };
            $(this).select2({
                minimumResultsForSearch: Infinity,
                width: '100%',
                templateResult: state,
                templateSelection: state
            });
        });

        // Custom scroll
        $('.js-custom-scroll').perfectScrollbar();

        // Ellipsis text overflow height
        $('.js-dotdotdot').dotdotdot({ ellipsis: '... '});
        $('.js-dotdotdot').trigger("update.dot");

        // Button waves
        Waves.attach('.btn', ['waves-light']);
        Waves.init();

        // Countdown
        $('.js-countdown').each(function() {
            var $this = $(this), finalDate = $(this).data('countdown');
            $this.countdown(finalDate, function(event) {
                $this.html(event.strftime(
                    //'%D д. ' +
                    '%H<i class="countdown-dots tick">:</i>' +
                    '%M<i class="countdown-dots tick">:</i>' +
                    '%S'
                ));
                setTimeout(function () { $this.find('.countdown-dots').removeClass('tick') }, 100);
            });
        });

        // Tooltip
        $('.js-tooltip').each(function () {
           var $this = $(this);
           var t = tippy(this, {
               arrow: true,
               animation: 'perspective',
               theme: 'light'
           });
        });

        new Toggle('.js-toggle');

        AOS.init({
            duration: 700,
            delay: 100,
            offset: 100
        });
    })();

    initItemGallery($('.item'), { openOnClick: true, imageZoom: true });

    setTimeout(function () {
        $('.loader').fadeOut();
    }, 200);
});
