
                    <div class="catalog-items__header">
                        <div class="catalog-items__header-left">
                            <div class="catalog-items__title title h1">
                                ~~$tree[$node].title~
                            </div>
                            <span class="catalog-items__count">(товаров: ~~$pager.count_rows~)</span>
                        </div>
                        <div class="catalog-items__header-right">
                            <div class="catalog-items__actions">
                                <div class="catalog-items__actions-filter">
                                    <button type="button" class="catalog-items__filter-btn btn btn--icon btn--vinous js-catalog-filters-toggle">
                                        <i  class="ticon ticon-filter "></i>
                                    </button>
                                </div>
                                <div class="catalog-items__actions-sort">
                                    <div class="sort js-sort">
                                        <div class="sort__inn">
                                            <div class="sort__label">
                                                Сортировать:
                                            </div>
                                            <div class="sort__value dropdown">
                                                <div class="sort__item js-dropdown-toggle js-sort-label">
                                                    По популярности <i class="ticon ticon-desc "></i>
                                                </div>
                                                <div class="dropdown__block sort__dropdown">
                                                    <ul class="sort__list">
                                                        <li>
                                                            <label class="sort__item js-sort-item is-active">
                                                                <input type="radio" name="sort">
                                                                <span> По популярности <i  class="ticon ticon-desc "></i> </span></label>
                                                        </li>
                                                        <li>
                                                            <label class="sort__item js-sort-item">
                                                                <input type="radio" name="sort">
                                                                <span>По популярности <i  class="ticon ticon-asc "></i> </span></label>
                                                        </li>
                                                        <li>
                                                            <label class="sort__item js-sort-item">
                                                                <input type="radio" name="sort">
                                                                <span>По дате <i  class="ticon ticon-desc "></i> </span></label>
                                                        </li>
                                                        <li>
                                                            <label class="sort__item js-sort-item">
                                                                <input type="radio" name="sort">
                                                                <span>По дате <i  class="ticon ticon-asc "></i> </span></label>
                                                        </li>
                                                    </ul>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <form autocomplete="off" class="catalog-items__filters js-catalog-filters">
                        <a href="#" class="catalog-items__filters-close close-btn js-filters-close"></a>
                        <div class="catalog-items__filters-inn">
                            <div class="catalog-items__filters-label">
                                Фильтры:
                            </div>
                            <div class="catalog-items__filters-list">
                                <div class="catalog-items__filters-items">
                                    <div class="catalog-items__filters-item">
                                        <div class="catalog-items__filters-row js-filter-label">
                                            Цена
                                        </div>
                                        <div class="filter js-filter">
                                            <div class="filter__inn">
                                                <div class="filter__label js-filter-toggle">
                                                    Цена
                                                </div>
                                            </div>
                                            <div class="filter__dropdown filter__dropdown--lg">
                                                <div class="input-range">
                                                    <div class="input-range__label">
                                                        от
                                                    </div>
                                                    <div>
                                                        <input data-type="from" type="text" class="input-range__input">
                                                    </div>
                                                    <div class="input-range__label">
                                                        до
                                                    </div>
                                                    <div>
                                                        <input data-type="to" type="text" class="input-range__input">
                                                    </div>
                                                    <div class="input-range__label">
                                                        руб.
                                                    </div>
                                                </div>
                                                <input data-step="1000" data-min="1000" data-max="1000000" class="js-range-slider" type="text" />
                                                <button type="submit" class="btn btn--sm btn--pink js-filter-append">
                                                    Применить
                                                </button>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="catalog-items__filters-item">
                                        <div class="catalog-items__filters-row js-filter-label">
                                            Бренд
                                        </div>
                                        <div class="filter js-filter">
                                            <div class="filter__inn">
                                                <div data-many='["бренд", "бренда", "брендов"]' class="filter__label js-filter-toggle">
                                                    Бренд
                                                </div>
                                            </div>
                                            <div class="filter__dropdown">
                                                <div class="filter__scroll js-custom-scroll">
                                                    <div class="filter__checkboxes">
                                                        <div>
                                                            <label class="checkbox checkbox--sm">
                                                                <input type="checkbox" >
                                                                <div>
                                                                    <div class="checkbox__i">
                                                                        <i></i>
                                                                    </div>
                                                                    <div>
                                                                        David Jones
                                                                    </div>
                                                                </div> </label>
                                                        </div>
                                                        <div>
                                                            <label class="checkbox checkbox--sm">
                                                                <input type="checkbox" >
                                                                <div>
                                                                    <div class="checkbox__i">
                                                                        <i></i>
                                                                    </div>
                                                                    <div>
                                                                        Casio
                                                                    </div>
                                                                </div> </label>
                                                        </div>
                                                        <div>
                                                            <label class="checkbox checkbox--sm">
                                                                <input type="checkbox" >
                                                                <div>
                                                                    <div class="checkbox__i">
                                                                        <i></i>
                                                                    </div>
                                                                    <div>
                                                                        Salomon
                                                                    </div>
                                                                </div> </label>
                                                        </div>
                                                        <div>
                                                            <label class="checkbox checkbox--sm">
                                                                <input type="checkbox" >
                                                                <div>
                                                                    <div class="checkbox__i">
                                                                        <i></i>
                                                                    </div>
                                                                    <div>
                                                                        Coccinelle
                                                                    </div>
                                                                </div> </label>
                                                        </div>
                                                        <div>
                                                            <label class="checkbox checkbox--sm">
                                                                <input type="checkbox" >
                                                                <div>
                                                                    <div class="checkbox__i">
                                                                        <i></i>
                                                                    </div>
                                                                    <div>
                                                                        Tommy Hilfiger
                                                                    </div>
                                                                </div> </label>
                                                        </div>
                                                        <div>
                                                            <label class="checkbox checkbox--sm">
                                                                <input type="checkbox" >
                                                                <div>
                                                                    <div class="checkbox__i">
                                                                        <i></i>
                                                                    </div>
                                                                    <div>
                                                                        Jennyfer
                                                                    </div>
                                                                </div> </label>
                                                        </div>
                                                        <div>
                                                            <label class="checkbox checkbox--sm">
                                                                <input type="checkbox" >
                                                                <div>
                                                                    <div class="checkbox__i">
                                                                        <i></i>
                                                                    </div>
                                                                    <div>
                                                                        RELYGHT Piquadro
                                                                    </div>
                                                                </div> </label>
                                                        </div>
                                                        <div>
                                                            <label class="checkbox checkbox--sm">
                                                                <input type="checkbox" >
                                                                <div>
                                                                    <div class="checkbox__i">
                                                                        <i></i>
                                                                    </div>
                                                                    <div>
                                                                        Baudet
                                                                    </div>
                                                                </div> </label>
                                                        </div>
                                                        <div>
                                                            <label class="checkbox checkbox--sm">
                                                                <input type="checkbox" >
                                                                <div>
                                                                    <div class="checkbox__i">
                                                                        <i></i>
                                                                    </div>
                                                                    <div>
                                                                        Fred Perry
                                                                    </div>
                                                                </div> </label>
                                                        </div>
                                                        <div>
                                                            <label class="checkbox checkbox--sm">
                                                                <input type="checkbox" >
                                                                <div>
                                                                    <div class="checkbox__i">
                                                                        <i></i>
                                                                    </div>
                                                                    <div>
                                                                        David Jones
                                                                    </div>
                                                                </div> </label>
                                                        </div>
                                                        <div>
                                                            <label class="checkbox checkbox--sm">
                                                                <input type="checkbox" >
                                                                <div>
                                                                    <div class="checkbox__i">
                                                                        <i></i>
                                                                    </div>
                                                                    <div>
                                                                        Casio
                                                                    </div>
                                                                </div> </label>
                                                        </div>
                                                        <div>
                                                            <label class="checkbox checkbox--sm">
                                                                <input type="checkbox" >
                                                                <div>
                                                                    <div class="checkbox__i">
                                                                        <i></i>
                                                                    </div>
                                                                    <div>
                                                                        Salomon
                                                                    </div>
                                                                </div> </label>
                                                        </div>
                                                        <div>
                                                            <label class="checkbox checkbox--sm">
                                                                <input type="checkbox" >
                                                                <div>
                                                                    <div class="checkbox__i">
                                                                        <i></i>
                                                                    </div>
                                                                    <div>
                                                                        Coccinelle
                                                                    </div>
                                                                </div> </label>
                                                        </div>
                                                        <div>
                                                            <label class="checkbox checkbox--sm">
                                                                <input type="checkbox" >
                                                                <div>
                                                                    <div class="checkbox__i">
                                                                        <i></i>
                                                                    </div>
                                                                    <div>
                                                                        Tommy Hilfiger
                                                                    </div>
                                                                </div> </label>
                                                        </div>
                                                        <div>
                                                            <label class="checkbox checkbox--sm">
                                                                <input type="checkbox" >
                                                                <div>
                                                                    <div class="checkbox__i">
                                                                        <i></i>
                                                                    </div>
                                                                    <div>
                                                                        Jennyfer
                                                                    </div>
                                                                </div> </label>
                                                        </div>
                                                        <div>
                                                            <label class="checkbox checkbox--sm">
                                                                <input type="checkbox" >
                                                                <div>
                                                                    <div class="checkbox__i">
                                                                        <i></i>
                                                                    </div>
                                                                    <div>
                                                                        RELYGHT Piquadro
                                                                    </div>
                                                                </div> </label>
                                                        </div>
                                                        <div>
                                                            <label class="checkbox checkbox--sm">
                                                                <input type="checkbox" >
                                                                <div>
                                                                    <div class="checkbox__i">
                                                                        <i></i>
                                                                    </div>
                                                                    <div>
                                                                        Baudet
                                                                    </div>
                                                                </div> </label>
                                                        </div>
                                                        <div>
                                                            <label class="checkbox checkbox--sm">
                                                                <input type="checkbox" >
                                                                <div>
                                                                    <div class="checkbox__i">
                                                                        <i></i>
                                                                    </div>
                                                                    <div>
                                                                        Fred Perry
                                                                    </div>
                                                                </div> </label>
                                                        </div>
                                                    </div>
                                                </div>
                                                <button type="submit" class="btn btn--sm btn--pink js-filter-append">
                                                    Применить
                                                </button>
                                            </div>
                                        </div>
                                    </div>

                                </div>
                            </div>
                            <div class="catalog-items__filters-clear">
                                <a href="#" class="js-filters-clear">Очистить фильтры</a>
                            </div>
                        </div>
                    </form>
                    <div class="catalog-items__checkboxes">
                        <label class="checkbox checkbox--sm">
                            <input type="checkbox" >
                            <div>
                                <div class="checkbox__i">
                                    <i></i>
                                </div>
                                <div>
                                    Новинки
                                </div>
                            </div> </label><label class="checkbox checkbox--sm">
                            <input type="checkbox" >
                            <div>
                                <div class="checkbox__i">
                                    <i></i>
                                </div>
                                <div>
                                    Распродажа
                                </div>
                            </div> </label><label class="checkbox checkbox--sm">
                            <input type="checkbox" >
                            <div>
                                <div class="checkbox__i">
                                    <i></i>
                                </div>
                                <div>
                                    Товар дня
                                </div>
                            </div> </label>
                    </div>



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
                                      <a href="~~$u.href~&s=~~$u.s~&gn=~~$u.gn~" class="pagination__link">~~$u.content~</a>
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
                                          <a href="~~$pager.next.href~&s=~~$pager.next.s~&gn=~~$pager.next.gn~" class="next-btn">Следующая</a>
                                      </div>
                                  </div>
                              </div>
                          </div>
                          <a href="~~$pager.next.href~&s=~~$pager.next.s~&gn=~~$pager.next.gn~" class="next-btn">Следующая</a>
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


