

                  <div class="catalog-items__cell">
                    <div class="item-grid  js-item  js-item-grid ">
                      <div class="item-grid__inn">
                        <div class="item-grid__photo"> <a href="#"><img alt="David Jones" class="item-grid__img js-item-main-img" src="catalogue/images/1051_thumb.jpg"></a>
                          <div class="item-grid__carousel carousel">
                            <div class="swiper-container js-item-gallery-carousel">
                              <div class="swiper-wrapper">
                                <div class="swiper-slide">
                                  <div data-color="#337ab7" class="item-grid__carousel-item js-item-carousel-image"><img alt="David Jones" src="catalogue/images/1051_thumb.jpg"></div>nophoto_thumb
                                </div>
                                <div class="swiper-slide">
                                  <div data-color="#56223f" class="item-grid__carousel-item js-item-carousel-image"><img alt="David Jones" src="catalogue/images/nophoto_thumb.jpg"></div>
                                </div>
                                <div class="swiper-slide">
                                  <div data-color="#FFA800" class="item-grid__carousel-item js-item-carousel-image"><img alt="David Jones" src="catalogue/images/nophoto_thumb.jpg"></div>
                                </div>
                              </div>
                            </div>
                          </div>
                        </div> <a href="#" class="item-grid__name">PROEL AT235</a>
                        <div class="item-grid__category">Переходник RCA<->RCA</div>
                        <div class="item-grid__meta">
                          <div class="item-grid__meta-left">
                            <div class="rate">
                              <div class="rate__inn">
                                <div class="rate__stars r4"> <i></i><i></i><i></i><i></i><i></i> </div>
                                <div class="rate__count">(123)</div>
                              </div>
                            </div>
                          </div>
                          <div class="item-grid__meta-right"> <a href="#" class="js-fav-add fav-btn "></a> </div>
                        </div>
                        <div class="item-grid__actions">
                          <div class="item-grid__actions-left"> <span class="price">70 р.</span> </div>
                          <div class="item-grid__actions-right"> <a href="#" class="js-cart-add cart-btn "></a> <a href="#" class="js-fav-add fav-btn "></a> </div>
                        </div>
                        <div class="item-grid__fast-view"> <a class="btn btn--pink js-fast-view-toggle" href="#">Быстрый просмотр</a> </div>
                      </div>
                    </div>
                  </div>




		~~*assign var="level"  value="2"~
		~~foreach item=i from=$menu~
			~~if $i.level > $level~
				~~section name=loop_up start=$level loop=`$i.level`~
					<ul>
				~~/section~
				~~assign var="level" value=`$i.level`~
			~~elseif $i.level < $level~
				~~section name=loop_down start=$i.level loop=$level~
					</ul>
				~~/section~
				~~assign var="level" value=`$i.level`~
			~~/if~
			<li class="~~if $level == 2~first~~/if~ ~~if $i.mylen == 0 && $level > 2~last~~/if~"><a href="?page=~~$i.id~" title="~~$i.title~" class="~~if $level == 2~first~~/if~">~~$i.title~</a></li>
		~~/foreach*~  
