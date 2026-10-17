define(['jquery', 'theme_academi/jquery.sudoSlider'], function($) {
    var defaults = {
        autoplay: false,
        interval: 500,
    };
    var Carousel = function(selector, options) {
        var results = $.extend(defaults, options);
        this.initializeslider(selector, results);
    };

    // Initialize the slider.
    Carousel.prototype.initializeslider = function(selector, data) {
        var autostopped = false;
        var sudoSlider = $(selector).sudoSlider({
            prevNext: true,
            prevHtml: '.homepage-carousel .prevBtn.carousel-control',
            nextHtml: '.homepage-carousel .nextBtn.carousel-control',
            speed: 1400,
            ease: 'swing',
            responsive: true,
            updateBefore: true,
            useCSS: true,
            interruptible: false,
            numeric: true,
            pause: (data.autoplay == 'false') ? false : data.interval,
            auto: (data.autoplay == 'true') ? true : false,
            customLink: ".homepage-carouselLink",
            afterAnimation: function(t) {
                $('.homecarousel-slide-item.carousel-item').not('[data-slide="' + t + '"]').removeClass('active');
                $('.homecarousel-slide-item.carousel-item[data-slide="' + t + '"]').addClass('active');
                $('.slide-text').show();
            },
            beforeAnimation: function() {
                animation();
            }
        });

        sudoSlider.mouseenter(function() {
            var auto = sudoSlider.getValue('autoAnimation');
            if (auto) {
                sudoSlider.stopAuto();
            } else {
                autostopped = true;
            }
        }).mouseleave(function() {
            if (!autostopped) {
                sudoSlider.startAuto();
            }
        });

        /**
         * The animated text (title, description, button) of a slide.
         * @param {Number} slide Slide number.
         * @return {jQuery}
         */
        function slideText(slide) {
            return $('.homecarousel-slide-item.carousel-item[data-slide="' + slide + '"]')
                .find('.heading-content [data-animation]');
        }

        /**
         * The overlay box (.content_overlayer) behind a slide's text.
         * @param {Number} slide Slide number.
         * @return {jQuery}
         */
        function slideOverlay(slide) {
            return $('.homecarousel-slide-item.carousel-item[data-slide="' + slide + '"] .slide-text');
        }

        /**
         * Before a slide moves in: keep its text hidden while it slides in. Other slides are left alone.
         * @param {Number} slide Slide number.
         */
        function holdTextAnimation(slide) {
            slideOverlay(slide).removeClass('overlay-in').addClass('slide-text-pending');
            slideText(slide).each(function() {
                $(this).removeClass($(this).attr('data-animation')).addClass('slide-text-pending');
            });
        }

        /**
         * Once the slide is in place: play the text animation, which the styles (carousel.scss) run smoothly
         * and stagger. The animation is restarted by removing its classes and adding them back after a reflow.
         * @param {Number} slide Slide number.
         */
        function playTextAnimation(slide) {
            // The overlay box behind the text fades in first, just before the text.
            var $overlay = slideOverlay(slide);
            $overlay.removeClass('overlay-in');
            if ($overlay.length) {
                void $overlay[0].offsetWidth;
            }
            $overlay.removeClass('slide-text-pending').addClass('overlay-in');
            slideText(slide).each(function() {
                var $item = $(this);
                var animation = $item.attr('data-animation');
                $item.removeClass(animation);
                void this.offsetWidth;
                $item.removeClass('slide-text-pending').addClass(animation);
            });
        }
    };

    return {
        init: function(selector, options) {
            return new Carousel(selector, options);
        }
    };
});
