<!-- js/classie.js -->



( function( window ) {

    'use strict';


    function classReg( className ) {
        return new RegExp("(^|\\s+)" + className + "(\\s+|$)");
    }


    var hasClass, addClass, removeClass;

    if ( 'classList' in document.documentElement ) {
        hasClass = function( elem, c ) {
            return elem.classList.contains( c );
        };
        addClass = function( elem, c ) {
            elem.classList.add( c );
        };
        removeClass = function( elem, c ) {
            elem.classList.remove( c );
        };
    }
    else {
        hasClass = function( elem, c ) {
            return classReg( c ).test( elem.className );
        };
        addClass = function( elem, c ) {
            if ( !hasClass( elem, c ) ) {
                elem.className = elem.className + ' ' + c;
            }
        };
        removeClass = function( elem, c ) {
            elem.className = elem.className.replace( classReg( c ), ' ' );
        };
    }

    function toggleClass( elem, c ) {
        var fn = hasClass( elem, c ) ? removeClass : addClass;
        fn( elem, c );
    }

    var classie = {
        // full names
        hasClass: hasClass,
        addClass: addClass,
        removeClass: removeClass,
        toggleClass: toggleClass,
        // short names
        has: hasClass,
        add: addClass,
        remove: removeClass,
        toggle: toggleClass
    };

// transport
    if ( typeof define === 'function' && define.amd ) {
        // AMD
        define( classie );
    } else if ( typeof exports === 'object' ) {
        // CommonJS
        module.exports = classie;
    } else {
        // browser global
        window.classie = classie;
    }

})( window );


    function mobilecheck() {
        var check = false;
        (function(a){if(/(android|ipad|playbook|silk|bb\d+|meego).+mobile|avantgo|bada\/|blackberry|blazer|compal|elaine|fennec|hiptop|iemobile|ip(hone|od)|iris|kindle|lge |maemo|midp|mmp|netfront|opera m(ob|in)i|palm( os)?|phone|p(ixi|re)\/|plucker|pocket|psp|series(4|6)0|symbian|treo|up\.(browser|link)|vodafone|wap|windows (ce|phone)|xda|xiino/i.test(a)||/1207|6310|6590|3gso|4thp|50[1-6]i|770s|802s|a wa|abac|ac(er|oo|s\-)|ai(ko|rn)|al(av|ca|co)|amoi|an(ex|ny|yw)|aptu|ar(ch|go)|as(te|us)|attw|au(di|\-m|r |s )|avan|be(ck|ll|nq)|bi(lb|rd)|bl(ac|az)|br(e|v)w|bumb|bw\-(n|u)|c55\/|capi|ccwa|cdm\-|cell|chtm|cldc|cmd\-|co(mp|nd)|craw|da(it|ll|ng)|dbte|dc\-s|devi|dica|dmob|do(c|p)o|ds(12|\-d)|el(49|ai)|em(l2|ul)|er(ic|k0)|esl8|ez([4-7]0|os|wa|ze)|fetc|fly(\-|_)|g1 u|g560|gene|gf\-5|g\-mo|go(\.w|od)|gr(ad|un)|haie|hcit|hd\-(m|p|t)|hei\-|hi(pt|ta)|hp( i|ip)|hs\-c|ht(c(\-| |_|a|g|p|s|t)|tp)|hu(aw|tc)|i\-(20|go|ma)|i230|iac( |\-|\/)|ibro|idea|ig01|ikom|im1k|inno|ipaq|iris|ja(t|v)a|jbro|jemu|jigs|kddi|keji|kgt( |\/)|klon|kpt |kwc\-|kyo(c|k)|le(no|xi)|lg( g|\/(k|l|u)|50|54|\-[a-w])|libw|lynx|m1\-w|m3ga|m50\/|ma(te|ui|xo)|mc(01|21|ca)|m\-cr|me(rc|ri)|mi(o8|oa|ts)|mmef|mo(01|02|bi|de|do|t(\-| |o|v)|zz)|mt(50|p1|v )|mwbp|mywa|n10[0-2]|n20[2-3]|n30(0|2)|n50(0|2|5)|n7(0(0|1)|10)|ne((c|m)\-|on|tf|wf|wg|wt)|nok(6|i)|nzph|o2im|op(ti|wv)|oran|owg1|p800|pan(a|d|t)|pdxg|pg(13|\-([1-8]|c))|phil|pire|pl(ay|uc)|pn\-2|po(ck|rt|se)|prox|psio|pt\-g|qa\-a|qc(07|12|21|32|60|\-[2-7]|i\-)|qtek|r380|r600|raks|rim9|ro(ve|zo)|s55\/|sa(ge|ma|mm|ms|ny|va)|sc(01|h\-|oo|p\-)|sdk\/|se(c(\-|0|1)|47|mc|nd|ri)|sgh\-|shar|sie(\-|m)|sk\-0|sl(45|id)|sm(al|ar|b3|it|t5)|so(ft|ny)|sp(01|h\-|v\-|v )|sy(01|mb)|t2(18|50)|t6(00|10|18)|ta(gt|lk)|tcl\-|tdg\-|tel(i|m)|tim\-|t\-mo|to(pl|sh)|ts(70|m\-|m3|m5)|tx\-9|up(\.b|g1|si)|utst|v400|v750|veri|vi(rg|te)|vk(40|5[0-3]|\-v)|vm40|voda|vulc|vx(52|53|60|61|70|80|81|83|85|98)|w3c(\-| )|webc|whit|wi(g |nc|nw)|wmlb|wonu|x700|yas\-|your|zeto|zte\-/i.test(a.substr(0,4)))check = true})(navigator.userAgent||navigator.vendor||window.opera);
        return check;
    }

var clickeventtype = mobilecheck() ? 'touchstart' : 'click';

(function() {
    var support = { animations : Modernizr.cssanimations },
        animEndEventNames = { 'WebkitAnimation' : 'webkitAnimationEnd', 'OAnimation' : 'oAnimationEnd', 'msAnimation' : 'MSAnimationEnd', 'animation' : 'animationend' },
        animEndEventName = animEndEventNames[ Modernizr.prefixed( 'animation' ) ],
        onEndAnimation = function( el, callback ) {
            var onEndCallbackFn = function( ev ) {
                if( support.animations ) {
                    if(ev.target != this) return;
                    this.removeEventListener( animEndEventName, onEndCallbackFn);
                }
                if(callback && typeof callback === 'function') {callback.call();}
            };
            if( support.animations ) {
                el.addEventListener(animEndEventName, onEndCallbackFn);
            }
            else {
                onEndCallbackFn();
            }
        };

    [].slice.call(document.querySelectorAll('.button--sonar')).forEach(function(el) {
        el.addEventListener(clickeventtype, function(ev) {
            if( el.getAttribute('data-state') !== 'locked' ) {
                classie.add(el, 'button--active');
                onEndAnimation(el, function() {
                    classie.remove(el, 'button--active');
                });
            }
        });
    });
})();
// </script>
// <script src="js/dynamics.min.js"></script>

    <!-- src="js/main.js" -->
    // <script >

(function(window) {

    'use strict';

    var support = { animations : Modernizr.cssanimations },
        animEndEventNames = { 'WebkitAnimation' : 'webkitAnimationEnd', 'OAnimation' : 'oAnimationEnd', 'msAnimation' : 'MSAnimationEnd', 'animation' : 'animationend' },
        animEndEventName = animEndEventNames[ Modernizr.prefixed( 'animation' ) ],
        onEndAnimation = function( el, callback ) {
            var onEndCallbackFn = function( ev ) {
                if( support.animations ) {
                    if( ev.target != this ) return;
                    this.removeEventListener( animEndEventName, onEndCallbackFn );
                }
                if( callback && typeof callback === 'function' ) { callback.call(); }
            };
            if( support.animations ) {
                el.addEventListener( animEndEventName, onEndCallbackFn );
            }
            else {
                onEndCallbackFn();
            }
        };

    function extend( a, b ) {
        for( var key in b ) {
            if( b.hasOwnProperty( key ) ) {
                a[key] = b[key];
            }
        }
        return a;
    }

    function Stack(el, options) {
        this.el = el;
        this.options = extend( {}, this.options );
        extend( this.options, options );
        this.items = [].slice.call(this.el.children);
        this.itemsTotal = this.items.length;
        if( this.options.infinite && this.options.visible >= this.itemsTotal || !this.options.infinite && this.options.visible > this.itemsTotal || this.options.visible <=0 ) {
            this.options.visible = 1;
        }
        this.current = 0;
        this._init();
    }

    Stack.prototype.options = {
        // stack's perspective value
        perspective: 1000,
        // stack's perspective origin
        perspectiveOrigin : '50% -50%',
        // number of visible items in the stack
        visible : 3,
        // infinite navigation
        infinite : true,
        // callback: when reaching the end of the stack
        onEndStack : function() {return false;},
        // animation settings for the items' movements in the stack when the items rearrange
        // object that is passed to the dynamicsjs animate function (see more at http://dynamicsjs.com/)
        // example:
        // {type: dynamics.spring,duration: 1641,frequency: 557,friction: 459,anticipationSize: 206,anticipationStrength: 392}
        stackItemsAnimation : {
            duration : 500,
            type : dynamics.bezier,
            points : [{'x':0,'y':0,'cp':[{'x':0.25,'y':0.1}]},{'x':1,'y':1,'cp':[{'x':0.25,'y':1}]}]
        },
        // delay for the items' rearrangement / delay before stackItemsAnimation is applied
        stackItemsAnimationDelay : 0,
        // animation settings for the items' movements in the stack before the rearrangement
        // we can set up different settings depending on whether we are approving or rejecting an item
        /*
        stackItemsPreAnimation : {
            reject : {
                // if true, then the settings.properties parameter will be distributed through the items in a non equal fashion
                // for instance, if we set settings.properties = {translateX:100} and we have options.visible = 4,
                // then the second item in the stack will translate 100px, the second one 75px and the third 50px
                elastic : true,
                // object that is passed into the dynamicsjs animate function - second parameter -  (see more at http://dynamicsjs.com/)
                animationProperties : {},
                // object that is passed into the dynamicsjs animate function - third parameter - (see more at http://dynamicsjs.com/)
                animationSettings : {}
            },
            accept : {
                // if true, then the settings.properties parameter will be distributed through the items in a non equal fashion
                // for instance, if we set settings.properties = {translateX:100} and we have options.visible = 4,
                // then the second item on the stack will translate 100px, the second one 75px and the third 50px
                elastic : true,
                // object that is passed into the dynamicsjs animate function - second parameter -  (see more at http://dynamicsjs.com/)
                animationProperties : {},
                // object that is passed into the dynamicsjs animate function (see more at http://dynamicsjs.com/)
                animationSettings : {}
            }
        }
        */
    };

// set the initial styles for the visible items
    Stack.prototype._init = function() {
        // set default styles
        // first, the stack
        this.el.style.WebkitPerspective = this.el.style.perspective = this.options.perspective + 'px';
        this.el.style.WebkitPerspectiveOrigin = this.el.style.perspectiveOrigin = this.options.perspectiveOrigin;

        var self = this;

        // the items
        for(var i = 0; i < this.itemsTotal; ++i) {
            var item = this.items[i];
            if( i < this.options.visible ) {
                item.style.opacity = 1;
                item.style.pointerEvents = 'auto';
                item.style.zIndex = i === 0 ? parseInt(this.options.visible + 1) : parseInt(this.options.visible - i);
                item.style.WebkitTransform = item.style.transform = 'translate3d(0px, 0px, ' + parseInt(-1 * 50 * i) + 'px)';
            }
            else {
                item.style.WebkitTransform = item.style.transform = 'translate3d(0,0,-' + parseInt(this.options.visible * 50) + 'px)';
            }
        }

        classie.add(this.items[this.current], 'stack__item--current');
    };

    Stack.prototype.reject = function(callback) {
        this._next('reject', callback);
    };

    Stack.prototype.accept = function(callback) {
        this._next('accept', callback);
    };

    Stack.prototype.restart = function() {
        this.hasEnded = false;
        this._init();
    };

    Stack.prototype._next = function(action, callback) {
        if( this.isAnimating || ( !this.options.infinite && this.hasEnded ) ) return;
        this.isAnimating = true;

        // current item
        var currentItem = this.items[this.current];
        classie.remove(currentItem, 'stack__item--current');

        // add animation class
        classie.add(currentItem, action === 'accept' ? 'stack__item--accept' : 'stack__item--reject');

        var self = this;
        onEndAnimation(currentItem, function() {
            // reset current item
            currentItem.style.opacity = 0;
            currentItem.style.pointerEvents = 'none';
            currentItem.style.zIndex = -1;
            currentItem.style.WebkitTransform = currentItem.style.transform = 'translate3d(0px, 0px, -' + parseInt(self.options.visible * 50) + 'px)';

            classie.remove(currentItem, action === 'accept' ? 'stack__item--accept' : 'stack__item--reject');

            self.items[self.current].style.zIndex = self.options.visible + 1;
            self.isAnimating = false;

            if( callback ) callback();

            if( !self.options.infinite && self.current === 0 ) {
                self.hasEnded = true;
                // callback
                self.options.onEndStack(self);
            }
        });

        // set style for the other items
        for(var i = 0; i < this.itemsTotal; ++i) {
            if( i >= this.options.visible ) break;

            if( !this.options.infinite ) {
                if( this.current + i >= this.itemsTotal - 1 ) break;
                var pos = this.current + i + 1;
            }
            else {
                var pos = this.current + i < this.itemsTotal - 1 ? this.current + i + 1 : i - (this.itemsTotal - this.current - 1);
            }

            var item = this.items[pos],
                // stack items animation
                animateStackItems = function(item, i) {
                    item.style.pointerEvents = 'auto';
                    item.style.opacity = 1;
                    item.style.zIndex = parseInt(self.options.visible - i);

                    dynamics.animate(item, {
                        translateZ : parseInt(-1 * 50 * i)
                    }, self.options.stackItemsAnimation);
                };

            setTimeout(function(item,i) {
                return function() {
                    var preAnimation;

                    if( self.options.stackItemsPreAnimation ) {
                        preAnimation = action === 'accept' ? self.options.stackItemsPreAnimation.accept : self.options.stackItemsPreAnimation.reject ;
                    }

                    if( preAnimation ) {
                        // items "pre animation" properties
                        var animProps = {};

                        for (var key in preAnimation.animationProperties) {
                            var interval = preAnimation.elastic ? preAnimation.animationProperties[key]/self.options.visible : 0;
                            animProps[key] = preAnimation.animationProperties[key] - Number(i*interval);
                        }

                        // this one remains the same..
                        animProps.translateZ = parseInt(-1 * 50 * (i+1));

                        preAnimation.animationSettings.complete = function() {
                            animateStackItems(item, i);
                        };

                        dynamics.animate(item, animProps, preAnimation.animationSettings);
                    }
                    else {
                        animateStackItems(item, i);
                    }
                };
            }(item,i), this.options.stackItemsAnimationDelay);
        }

        // update current
        this.current = this.current < this.itemsTotal - 1 ? this.current + 1 : 0;
        classie.add(this.items[this.current], 'stack__item--current');
    }

    window.Stack = Stack;

})(window);
// </script>
// <script>

var card_index = 0;
function nextCard(){
    if(card_index >= $("#stack_mawar").find("li").length-1){
        card_index = 0;
    }else{
        card_index++;
    }
}
function getFoucsCard(){
    let focusCards = $("#stack_mawar").find("li");
    return $(focusCards[card_index]).find("span").html();
}

(function() {

    var support = { animations : Modernizr.cssanimations },
        animEndEventNames = { 'WebkitAnimation' : 'webkitAnimationEnd', 'OAnimation' : 'oAnimationEnd', 'msAnimation' : 'MSAnimationEnd', 'animation' : 'animationend' },
        animEndEventName = animEndEventNames[ Modernizr.prefixed( 'animation' ) ],
        onEndAnimation = function( el, callback ) {
            var onEndCallbackFn = function( ev ) {
                if( support.animations ) {
                    if(ev.target != this) return;
                    this.removeEventListener( animEndEventName, onEndCallbackFn);
                }
                if(callback && typeof callback === 'function') {callback.call();}
            };
            if( support.animations ) {
                el.addEventListener(animEndEventName, onEndCallbackFn);
            }
            else {
                onEndCallbackFn();
            }
        };

    function nextSibling(el) {
        var nextSibling = el.nextSibling;
        while(nextSibling && nextSibling.nodeType != 1) {
            nextSibling = nextSibling.nextSibling
        }
        return nextSibling;
    }

    var mawar = new Stack(document.getElementById('stack_mawar'), {
        perspective : 1500,
        perspectiveOrigin : '-150% 50%',
        visible: 4,
        stackItemsAnimation : {
            duration: 1300,
            type: dynamics.spring
        },
        stackItemsPreAnimation : {
            accept : {
                elastic: true,
                animationProperties: {translateX : 100},
                animationSettings: {
                    duration: 200,
                    type: dynamics.easeIn
                }
            },
            reject : {
                elastic: true,
                animationProperties: {translateX : -100},
                animationSettings: {
                    duration: 200,
                    type: dynamics.easeIn
                }
            }
        }
    });


    var buttonClickCallback = function(bttn) {
        var bttn = bttn || this;
        bttn.setAttribute('data-state', 'unlocked');
        nextCard();
    };

    document.querySelector('.button--reject[data-stack = stack_mawar]').addEventListener(clickeventtype, function() {
        mawar.accept(buttonClickCallback.bind(this));
        $(".appover-box div span").html("");
        console.log(this.current);
    });
    document.querySelector('.button--accept[data-stack = stack_mawar]').addEventListener(clickeventtype, function() {
        //  mawar.reject(buttonClickCallback.bind(this));
        console.log(this.current);
        // mawar.anyother(buttonClickCallback.bind(this));
        $(this).addClass("button--active");
        $(".content").css("z-index","90");

        $(".appover-box").css("display","block");

        if($(".appover-box").hasClass("smaller")){
            $(".appover-box").removeClass("smaller");
        }
        $(".appover-box").addClass("bigger");

        var _card_type = getFoucsCard();
        $(".appover-box div span").html(_card_type);
    });
    $(".stack__item").click(function(){

        $(".content").css("z-index","90");

        $(".appover-box").css("display","block");

        if($(".appover-box").hasClass("smaller")){
            $(".appover-box").removeClass("smaller");
        }
        $(".appover-box").addClass("bigger");
        var _card_type = getFoucsCard();
        $(".appover-box div span").html( _card_type);
    }),
        document.querySelector('.appover-box').addEventListener(clickeventtype, function() {

            //  mawar.reject(buttonClickCallback.bind(this));
            // $(".content").css("z-index","99");
            $(".button--accept[data-stack = stack_mawar]").removeClass("button--active");
            $(".appover-box").css("display","block");

            if($(".appover-box").hasClass("bigger")){
                $(".appover-box").removeClass("bigger");
            }
            // $(".appover-box").addClass("hasSureCard");
            $(".appover-box").addClass("smaller");

        });
    $(".appover-box .sure-btn-box .sure_this_card").click(function(){
        var _card_type = getFoucsCard();
        $(".appover-box div span").html(_card_type);
        $(".content").css("z-index","1");

        $(".appover-box").css("display","block");

        if($(".appover-box").hasClass("bigger")){
            $(".appover-box").removeClass("bigger");
        }
        $(".appover-box").addClass("hasSureCard");
        $(this).css("display","none");
    }),

        [].slice.call(document.querySelectorAll('.button--sonar')).forEach(function(bttn) {
            bttn.addEventListener(clickeventtype, function() {
                bttn.setAttribute('data-state', 'locked');
            });
        });

    [].slice.call(document.querySelectorAll('.button--material')).forEach(function(bttn) {
        var radialAction = nextSibling(bttn.parentNode);

        bttn.addEventListener(clickeventtype, function(ev) {
            var boxOffset = radialAction.parentNode.getBoundingClientRect(),
                offset = bttn.getBoundingClientRect();

            radialAction.style.left = Number(offset.left - boxOffset.left) + 'px';
            radialAction.style.top = Number(offset.top - boxOffset.top) + 'px';

            classie.add(radialAction, classie.has(bttn, 'button--reject') ? 'material-circle--reject' : 'material-circle--accept');
            classie.add(radialAction, 'material-circle--active');
            onEndAnimation(radialAction, function() {
                classie.remove(radialAction, classie.has(bttn, 'button--reject') ? 'material-circle--reject' : 'material-circle--accept');
                classie.remove(radialAction, 'material-circle--active');
            });
        });
    });
})();
// </script>