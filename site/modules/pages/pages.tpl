<!DOCTYPE html>
<html lang="ru">

<head>
    ~~include file="tpl/head.tpl"~
</head>

<body>
  <div class="loader">
	<div class="loader__inn">
	</div>
  </div>
  ~~include file="tpl/m-nav.tpl"~
  ~~include file="tpl/location-select.tpl"~
  ~~include file="tpl/fast-view.tpl"~
  ~~include file="tpl/md-login.tpl"~
	
  <a href="#" class="up-btn js-up-btn">Наверх</a>
  <div class="l-main js-main">
	  
	~~include file="tpl/header.tpl"~
      
	<div class="l-content">
      <div class="l-wrapper">
        <div class="l-catalog">
          <aside class="l-catalog__aside">
            <div class="border-block">
              <ul class="categories-menu">

                ~~mod mod_name="menu_v" action=""~

			  </ul>
            </div>

            <div class="border-block">
			  <div class="title h4">
			    Подписаться на новинки (Звуковое оборудование)
			  </div>
			  
			  ~~include file="tpl/subscribe-mini.tpl"~
				
            </div>
          </aside>
          <main class="l-catalog__main">
            <div class="catalog-items">
              <div class="catalog-items__ad">
                <div class="iad-banner">
                  <div class="iad-banner__text">
                    Пример баннера
                  </div>
                </div>
              </div>
              <div class="catalog-items__seo">
                <div class="title h2">
                  Звуковое оборудование
                </div>
                <div class="text">

                  ~~$page_arr.content~

                </div>
              </div>
			</div>
          </main>
        </div>
      </div>
    </div>
	
	~~include file="tpl/subscribe.tpl"~
	
	~~include file="tpl/footer.tpl"~
	
  </div>
  <script type="text/javascript" src="/assets/js/libs.js?1508105303"></script>
  <script type="text/javascript" src="/assets/js/lightGallery/js/lightgallery.min.js?1508105303"></script>
  <script type="text/javascript" src="/assets/js/lightGallery/modules/lg-thumbnail.js?1508105303"></script>
  <script type="text/javascript" src="/assets/js/item-count.js?1508105303"></script>
  <script type="text/javascript" src="/assets/js/tabs.js?1508105303"></script>
  <script type="text/javascript" src="/assets/js/toggle.js?1508105303"></script>
  <script type="text/javascript" src="/assets/js/map.js?1508105303"></script>
  <script type="text/javascript" src="/assets/js/helpers.js?1508105303"></script>
  <script type="text/javascript" src="/assets/js/404.js?1508105303"></script>
  <script type="text/javascript" src="/assets/js/app.js?1508105303"></script>

</body>
</html>