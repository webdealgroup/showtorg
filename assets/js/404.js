$(function () {
    var d       = document,
        html    = d.documentElement,
        mX      = 0, mY = 0;
    function Flake(collection) {
        this.collection = collection;
        this.counter    = 0;
        this.sign       = Math.random() < 0.5 ? 1 : -1;
        this.options    = { opacity: 1 };

        this.generateView();
        this.position   = { x: this.generatePosition(50, collection.container.clientWidth), y: this.generatePosition(50, collection.container.clientHeight) };
    }

    Flake.prototype.generateView = function () {
        var colors = ['#ED80A8', '#9E1C64', '#CE3262'];
        var speed = 50;
        this.options.color = colors[Math.floor(Math.random() * colors.length)];
        this.options.size = this.collection.calc(35) + (Math.random() * 7 * (Math.random() < 0.5 ? -1 : 1))
        this.options.speed = Math.random() * speed + (speed * 0.3);
    }


    Flake.prototype.generatePosition = function (offset, size) {
        var val = -99999;
        while (this.options.size / 2 > val || size - this.options.size / 2 < val)
            val = Math.round(-1 * offset + Math.random() * (size + 2 * offset));
        return val;
    };

    Flake.prototype.draw = function () {
        var ctx         = this.collection.container.getContext('2d'),
            size        = this.options.size;

        ctx.moveTo(0, 0);
        ctx.beginPath();
        if (this.options.color == '#9E1C64')
            ctx.globalCompositeOperation = "lighter";
        ctx.fillStyle = this.options.color;
        ctx.globalAlpha = this.options.opacity;
        ctx.arc(this.position.x, this.position.y, size / 2, 0, Math.PI * 2);
        ctx.fill();
        ctx.globalAlpha = 1;
        ctx.globalCompositeOperation = "source-over";
        return this;
    };

    Flake.prototype.updatePosition = function () {
        var width = this.collection.container.clientWidth;
        var height = this.collection.container.clientHeight;
        var actualSize = this.options.size;
        var hideHeight = 50;
        this.counter    += this.options.speed / 5000;

        this.position.y += Math.sin(this.counter) / 40 + this.options.speed / 30;

        // Mouse repel
        var mouseXDist      = Math.abs(mX - this.position.x);
        var mouseYDist      = Math.abs(mY - this.position.y);
        var influenceArea   = 30;
        if (mouseXDist < influenceArea && mouseYDist < influenceArea) {
            var maxForce    = 15;
            var dist        = Math.sqrt(mouseXDist * mouseXDist + mouseYDist * mouseYDist);
            if (dist < influenceArea) {
                var influence = maxForce * (1 - (dist / influenceArea));
                if (mY > this.position.y) {
                    this.position.y -= influence;
                    if (mX < this.position.x)
                        this.position.x += influence;
                    else
                        this.position.x -= influence;
                }
                else
                    this.position.y += influence;
            }
        }

        if (this.position.y + actualSize / 2 > height - hideHeight) {
            var diff = (this.position.y + actualSize / 2) - (height - hideHeight);
            this.options.opacity = Math.max(0, 1 - ((1 / hideHeight) * diff));
        }

        if (this.position.y > height + actualSize / 2) {
            this.position.y = -actualSize;
            this.position.x = this.generatePosition(50, this.collection.container.clientWidth);
            this.options.opacity = 1;
        }
        return this;
    };

    var FlakesCollection = {
        container: null,
        pool: [],

        createFlake: function () {
            this.pool.push(new Flake(this));
        },

        calc: function (v) {
            return Math.round((v / 590) * this.container.clientWidth);
        },

        setContainerSize: function () {
            this.container.width = this.container.clientWidth;
            this.container.height = this.container.clientHeight;
        },

        init: function (opts) {
            var self = this,
                resizeTimeout;
            if (!d.querySelector(opts.container))
                return;

            this.container = d.querySelector(opts.container);
            this.ctx = this.container.getContext('2d');
            this.setContainerSize();
            for (var i = 1; i <= opts.n; i++)
                this.createFlake();

            // Get mouse positions
            document.onmousemove = function (event) { var eventDoc, doc, body; event = event || window.event; if (event.pageX == null && event.clientX != null) { eventDoc = (event.target && event.target.ownerDocument) || document; doc = eventDoc.documentElement; body = eventDoc.body; event.pageX = event.clientX + (doc && doc.scrollLeft || body && body.scrollLeft || 0) - (doc && doc.clientLeft || body && body.clientLeft || 0); event.pageY = event.clientY + (doc && doc.scrollTop || body && body.scrollTop  || 0) - (doc && doc.clientTop || body && body.clientTop  || 0 ); } mX = event.pageX - self.container.getBoundingClientRect().left; mY = event.pageY - self.container.getBoundingClientRect().top; }

            window.onresize = function() { clearTimeout(resizeTimeout); resizeTimeout = setTimeout(function() { self.setContainerSize(); }, 100); };

            this.animate();
        },


        animate: function () {
            var self = this,
                ctx = this.ctx,
                i = 0
            requestAnimationFrame(function () {
                self.animate();
            });
            ctx.clearRect(0, 0, this.container.clientWidth, this.container.clientHeight);

            for (;i <= this.pool.length / 2; i++)
                this.pool[i].updatePosition().draw();

            ctx.textBaseline = 'bottom';
            ctx.font = 'bold ' + this.calc(310) + 'px Museo Sans Cyrl';
            ctx.fillStyle = '#9E1C64';
            ctx.fillText('404', 1, this.container.clientHeight + this.calc('60'));

            for (;i < this.pool.length; i++)
                this.pool[i].updatePosition().draw();
        }
    };

    FlakesCollection.init({
        container: '.js-404',
        n: 70
    });
});