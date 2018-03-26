
                  <div class="catalog-items__list">

                      ~~foreach from=$items item=i~
                      <div class="catalog-items__cell">
                          <div class="item-grid  js-item  js-item-grid ">
                              <div class="item-grid__inn">
                                  <div class="item-grid__photo">
                                      <a href="#"><img alt="David Jones" class="item-grid__img js-item-main-img" src="~~$i.image~"></a>
                                      <div class="item-grid__carousel carousel">
                                          <div class="swiper-container js-item-gallery-carousel">
                                              <div class="swiper-wrapper">
                                                  <div class="swiper-slide">
                                                      <div data-color="#337ab7" class="item-grid__carousel-item js-item-carousel-image"><img alt="David Jones" src="~~$i.image~">
                                                      </div>

                                                  </div>

                                              </div>
                                          </div>
                                      </div>
                                  </div>
                                  <a href="#" class="item-grid__name">~~$i.param~</a>
                                  <div class="item-grid__category">
                                      ~~$i.name~
                                  </div>
                                  <div class="item-grid__meta">
                                      <div class="item-grid__meta-left">
                                          <div class="rate">
                                              <div class="rate__inn">
                                                  <div class="rate__stars r4">
                                                      <i></i><i></i><i></i><i></i><i></i>
                                                  </div>
                                                  <div class="rate__count">
                                                      (123)
                                                  </div>
                                              </div>
                                          </div>
                                      </div>
                                      <div class="item-grid__meta-right">
                                          <a href="#" class="js-fav-add fav-btn "></a>
                                      </div>
                                  </div>
                                  <div class="item-grid__actions">
                                      <div class="item-grid__actions-left">
                                          <span class="price">~~$i.cost~ р.</span>
                                      </div>
                                      <div class="item-grid__actions-right">
                                          <a href="#" class="js-cart-add cart-btn "></a><a href="#" class="js-fav-add fav-btn "></a>
                                      </div>
                                  </div>
                                  <div class="item-grid__fast-view">
                                      <a class="btn btn--pink js-fast-view-toggle" href="#">Быстрый просмотр</a>
                                  </div>
                              </div>
                          </div>
                      </div>
                      ~~/foreach~


                  </div>

                  <div class="catalog-items__nav">
                      <div class="catalog-items__nav-pagination">
                          <div class="pager">
                              <ul class="pagination">

                                  ~~foreach from=$pager.urls item=u~
                                  <li class="pagination__item ~~if $u.current == 1~  is-active ~~/if~">
                                      <a href="#" class="pagination__link">~~$u.content~</a>
                                  </li>
                                  ~~/foreach~


                                  <!--li class="pagination__item pagination__item--dots"></li>

                                  <li class="pagination__item">
                                      <a href="#" class="pagination__link">20</a>
                                  </li-->
                              </ul>

                              <div class="pager__info">
                                  <div class="pager__info-inn">
                                      <div class="pager__info-total">
                                          Результаты: ~~$pager.page_long~ из ~~$pager.count_rows~
                                      </div>
                                      <div class="pager__info-btn">
                                          <a href="~~*$pager.next.href~&s=~~$pager.next.s~&gn=~~$pager.next.gn*~" class="next-btn">Следующая</a>
                                      </div>
                                  </div>
                              </div>
                          </div>
                          <a href="~~*$pager.next.href~&s=~~$pager.next.s~&gn=~~$pager.next.gn*~" class="next-btn">Следующая</a>
                      </div>
                      <!--div class="catalog-items__nav-more">
                          <a href="#" class="more-btn">Показать еще</a>
                      </div>
                      <div-- class="catalog-items__nav-go">
                          <form autocomplete="off" class="go-to-page">
                              <div class="go-to-page__inn">
                                  <div class="go-to-page__cell">
                                      <div class="go-to-page__label">
                                          Перейти на страницу:
                                      </div>
                                  </div>
                                  <div class="go-to-page__cell">
                                      <input type="text" class="go-to-page__input">
                                  </div>
                                  <div class="go-to-page__cell">
                                      <button class="go-to-page__btn" type="submit">
                                          ОК
                                      </button>
                                  </div>
                              </div>
                          </form>
                      </div-->
                  </div>


