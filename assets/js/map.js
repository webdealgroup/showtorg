var Map = {
    map: null,
    _init: false,
    placemark: null,
    init: function () {
        if (this._init)
            return false;
        this.map = new ymaps.Map("map", {
            center: [55.755814, 37.617635],
            zoom: 8,
            controls: ['zoomControl']
        });
        this._init = true;
    },

    suggest: function (onsuccess) {
        $('.js-map-address').each(function () {
            var suggest = new ymaps.SuggestView(this);
            suggest.events.add('select', function (e) {
                var myGeocoder = ymaps.geocode(e.get('item').value);

                if (onsuccess)
                    onsuccess(myGeocoder);
            });
        });
    },

    createPlacemark: function(coords) {
        var p = new ymaps.Placemark(coords, null, {
            preset: 'islands#violetDotIconWithCaption',
            draggable: true
        });
        this.map.geoObjects.add(p);
        return p;
    },

    placemarkToMap: function (coords) {
        var self = this;
        if (this.placemark)
            this.placemark.geometry.setCoordinates(coords, this.map);
        else
            this.placemark = this.createPlacemark(coords, this.map);
        this.map.panTo(coords).then(function () { self.map.setZoom(11); });
    },

    order: function () {
        var self = this;
        var $inputSuggest = $('.js-map-address');
        var getAddress = function(coords) {
            ymaps.geocode(coords).then(function (res) {
                var firstGeoObject = res.geoObjects.get(0);
                $inputSuggest.val(firstGeoObject.properties.get('name')).focus();
                self.placemark.properties.set({
                    iconCaption: firstGeoObject.properties.get('name'),
                });
                //initSuggest();
            });
        };

        this.init();
        this.suggest(function (geocoder) {
            geocoder.then(function (res) {
                self.placemarkToMap(res.geoObjects.get(0).geometry.getCoordinates());
                self.placemark.properties.set('iconCaption', e.get('item').displayName);
            });
        });
        this.map.events.add('click', function (e) {
            var coords = e.get('coords');

            self.placemarkToMap(coords);
            self.placemark.events.add('dragend', function () {
                var p = self.placemark;
                self.map.panTo(p.geometry.getCoordinates());
                getAddress(p.geometry.getCoordinates(), p);
            });
            getAddress(coords);
        });
    }
}