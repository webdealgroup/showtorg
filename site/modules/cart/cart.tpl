<!DOCTYPE html>
<html lang="ru">

  <head>
  ~~include file="tpl/head.tpl"~
  </head>

  <body>
  <!--div class="loader">
    <div class="loader__inn">
      <img alt="" src="/assets/img/loader.svg">
    </div>
  </div-->
  ~~include file="tpl/m-nav.tpl"~
  ~~include file="tpl/location-select.tpl"~
  ~~include file="tpl/fast-view.tpl"~
  ~~include file="tpl/md-login.tpl"~

    </div> <a href="#" class="up-btn js-up-btn">Наверх</a>
    <div class="l-main js-main">
      <header class="header js-header">
        <div class="header__inn">
          <div class="topbar">
            <div class="l-wrapper">
              <div class="topbar__inn">
                <div class="topbar__location dropdown"> <a class="topbar__link topbar__link--dropdown js-dropdown-location js-dropdown-toggle" href="#">
    <i  class="ticon ticon-location "></i>
 <span class="js-positioned">Москва</span></a>
                  <div class="dropdown__block location-dropdown">
                    <div class="location-dropdown__label"> Вы действительно находитесь в г. Москва?</div>
                    <div class="block-table block-table--fixed">
                      <div> <a class="location-dropdown__link js-dropdown-close" href="#">Да, все верно</a> </div>
                      <div class="text-right"> <a class="location-dropdown__link js-location-select-toggle" href="#">Нет, сменить город</a> </div>
                    </div>
                  </div>
                </div>
                <div class="topbar__contacts"> <span class="topbar__phone">+7 495 104 70 03 (9:00 - 21:00)</span> <a class="topbar__link topbar__link--dropdown" href="#"><span>Связаться с нами</span></a> </div>
                <div class="topbar__delivery"> <a class="topbar__link" href="#">
    <i  class="ticon ticon-truck "></i>
 <span>Бесплатная доставка при первой покупке</span></a> </div>
                <div class="topbar__day-item"> <a class="topbar__link" href="#">
    <i  class="ticon ticon-discount "></i>
 <span>Товар дня</span></a> </div>
                <div class="topbar__cabinet dropdown bonus"> <a class="topbar__link topbar__link--dropdown  js-dropdown-toggle  js-bonus-target" href="#">
    <i  class="ticon ticon-user "></i>
 <span class="js-positioned">Мой кабинет</span></a>
                  <div class="bonus__block"> Дарим 500 руб. при регистрации <a href="#" class="bonus__close js-bonus-close">Закрыть</a> </div>
                  <div class="dropdown__block cabinet-dropdown">
                    <div class="cabinet-dropdown__login"> <a href="#login" class="cabinet-dropdown__login-btn btn btn--pink js-login-tab-toggle">Вход</a> <a href="#login" class="cabinet-dropdown__link js-register-tab-toggle">Создать учетную запись</a> </div>
                    <div class="cabinet-dropdown__search">
                      <div class="cabinet-dropdown__search-label">Отследить заказ</div>
                      <form autocomplete="off" class="search"> <input type="search" class="search__input js-order-search" placeholder="Введите номер заказа"> </form>
                    </div>
                  </div>
                </div>
              </div>
            </div>
          </div>
          <div class="header__wrapper">
            <div class="l-wrapper">
              <div class="header__row">
                <div class="header__nav-toggle"> <a href="#" class="hamburger hamburger--spin js-nav-toggle"><span>Каталог</span></a> </div>
                <div class="header__logo-mobile">
                  <a href=".">
                    <div class="logo logo--no-icon">
                      <div class="logo__inn">
                        <div class="logo__text"><img alt="adwall" src="assets/img/logo-text.svg"></div>
                      </div>
                    </div>
                  </a>
                </div>
                <div class="header__logo">
                  <a href=".">
                    <div class="header__logo-default">
                      <div class="logo ">
                        <div class="logo__inn">
                          <div class="logo__icon">
                            <div class="adwall"> <span class="adwall__dot"></span> <span class="adwall__dot"></span> <span class="adwall__dot"></span> <span class="adwall__dot"></span> <span class="adwall__dot"></span> <span class="adwall__dot"></span> <span class="adwall__dot"></span>                              <span class="adwall__dot"></span> <span class="adwall__dot"></span> </div>
                          </div>
                          <div class="logo__text"><img alt="adwall" src="assets/img/logo-text.svg"></div>
                        </div>
                      </div>
                    </div>
                    <div class="header__logo-small">
                      <div class="logo logo--sm">
                        <div class="logo__inn">
                          <div class="logo__icon">
                            <div class="adwall"> <span class="adwall__dot"></span> <span class="adwall__dot"></span> <span class="adwall__dot"></span> <span class="adwall__dot"></span> <span class="adwall__dot"></span> <span class="adwall__dot"></span> <span class="adwall__dot"></span>                              <span class="adwall__dot"></span> <span class="adwall__dot"></span> </div>
                          </div>
                          <div class="logo__text"><img alt="adwall" src="assets/img/logo-text.svg"></div>
                        </div>
                      </div>
                    </div>
                  </a>
                </div>
                <div class="header__switchers">
                  <div class="toggler toggler--sm">
                    <ul class="toggler__list">
                      <li class="toggler__item"><a class="toggler__link" href="#">
    <i  class="ticon ticon-male "></i>
 Муж.</a></li>
                      <li class="is-active toggler__item"><a class="toggler__link" href="#">
    <i  class="ticon ticon-female "></i>
 Жен.</a></li>
                    </ul>
                  </div>
                </div>
                <div class="header__search js-search">
                  <form autocomplete="off" class="search"> <input type="text" class="search__input" placeholder="Поиск товара или бренда"> <button type="submit" class="search__submit"></button> <a href="#" class="search__close js-search-close"></a> </form>
                </div>
                <div class="header__btn header__srch"> <a class="js-search-toggle" href="#">
                            
    <i  class="ticon ticon-loupe "></i>

                        </a> </div>
                <div class="header__btn header__favorite"> <a class="js-favs" href="#">
                            
    <i  class="ticon ticon-favorite-fill "></i>

                            <span class="header__favorite-count">99</span>
                        </a> </div>
                <div class="header__btn header__cart dropdown"> <a class="js-dropdown-toggle js-cart" href="#">
                            
    <i  class="ticon ticon-cart "></i>

                            <span class="header__cart-count">39</span>
                        </a>
                  <div class="dropdown__block cart-dropdown">
                    <div class="cart-dropdown__items">
                      <div class="item-cart">
                        <div class="item-cart__inn">
                          <div class="item-cart__photo">
                            <div class="item-cart__img"><a href="#"><img src="assets/img/items/1.png"></a></div>
                          </div>
                          <div class="item-cart__info"> <a href="#" class="item-cart__name">David Jones</a> <span class="item-cart__price price">9 000 р.</span> </div>
                          <div class="item-cart__remove"> <a href="#" class="remove-btn js-item-remove"><i></i></a> </div>
                        </div>
                      </div>
                      <div class="item-cart">
                        <div class="item-cart__inn">
                          <div class="item-cart__photo">
                            <div class="item-cart__img"><a href="#"><img src="assets/img/items/2.png"></a></div>
                          </div>
                          <div class="item-cart__info"> <a href="#" class="item-cart__name">Casio</a> <span class="item-cart__price price">4 990 р.</span> </div>
                          <div class="item-cart__remove"> <a href="#" class="remove-btn js-item-remove"><i></i></a> </div>
                        </div>
                      </div>
                      <div class="item-cart">
                        <div class="item-cart__inn">
                          <div class="item-cart__photo">
                            <div class="item-cart__img"><a href="#"><img src="assets/img/items/3.png"></a></div>
                          </div>
                          <div class="item-cart__info"> <a href="#" class="item-cart__name">Salomon</a> <span class="item-cart__price price">3 500 р.</span> </div>
                          <div class="item-cart__remove"> <a href="#" class="remove-btn js-item-remove"><i></i></a> </div>
                        </div>
                      </div>
                    </div>
                    <div class="cart-dropdown__footer">
                      <div class="cart-dropdown__total">Итого: 9 999 р.</div> <a href="#" class="cart-dropdown__btn btn btn--pink">Перейти в корзину</a> </div>
                  </div>
                </div>
                <div class="header__btn header__cabinet dropdown"> <a class="js-dropdown-toggle" href="#"> 
    <i  class="ticon ticon-user "></i>
 </a>
                  <div class="dropdown__block cabinet-dropdown">
                    <div class="cabinet-dropdown__login"> <a href="#login" class="cabinet-dropdown__login-btn btn btn--pink js-login-tab-toggle">Вход</a> <a href="#login" class="cabinet-dropdown__link js-register-tab-toggle">Создать учетную запись</a> </div>
                    <div class="cabinet-dropdown__search">
                      <div class="cabinet-dropdown__search-label">Отследить заказ</div>
                      <form autocomplete="off" class="search"> <input type="search" class="search__input js-order-search" placeholder="Введите номер заказа"> </form>
                    </div>
                  </div>
                </div>
              </div>
            </div>
          </div>
          <nav class="nav js-nav">
            <div class="l-wrapper">
              <div class="nav__bar js-nav-bar"></div>
              <ul class="nav__list">
                <li class="nav__item js-catalog-toggle"><a class="nav__link nav__link--sub" href="#"><span>Сумки</span></a></li>
                <li class="nav__item js-catalog-toggle"><a class="nav__link nav__link--sub" href="#"><span>Часы</span></a></li>
                <li class="nav__item js-catalog-toggle"><a class="nav__link nav__link--sub" href="#"><span>Парфюмерия</span></a></li>
                <li class="nav__item js-catalog-toggle"><a class="nav__link nav__link--sub" href="#"><span>Ремни</span></a></li>
                <li class="nav__item js-catalog-toggle"><a class="nav__link nav__link--sub" href="#"><span>Кошельки</span></a></li>
                <li class="nav__item js-catalog-toggle"><a class="nav__link nav__link--sub" href="#"><span>Очки</span></a></li>
                <li class="nav__item js-catalog-toggle"><a class="nav__link nav__link--sub" href="#"><span>Чемоданы</span></a></li>
                <li class="nav__item js-catalog-toggle"><a class="nav__link nav__link--sub" href="#"><span>Рюкзаки</span></a></li>
                <li class="nav__item js-catalog-toggle"><a class="nav__link nav__link--sub" href="#"><span>Ручки</span></a></li>
                <li class="nav__item js-catalog-toggle"><a class="nav__link nav__link--sub" href="#"><span>Другой товар</span></a></li>
              </ul>
            </div>
          </nav>
          <div class="catalog js-catalog">
            <div class="catalog__inn">
              <div class="l-wrapper">
                <div class="catalog__content"> <a href="#" class="catalog__close close-btn js-catalog-close">Закрыть</a>
                  <div class="catalog__title">Женские часы</div>
                  <div class="catalog__content-inn">
                    <div class="catalog__categories">
                      <ul class="categories-menu">
                        <li class="categories-menu__item">
                          <div class="categories-menu__item-inn"><a href="#" class="categories-menu__link">Клатчи</a>
                            <div class="categories-menu__count">99</div>
                          </div>
                        </li>
                        <li class="categories-menu__item">
                          <div class="categories-menu__item-inn"><a href="#" class="categories-menu__link">Сумки на плечо</a>
                            <div class="categories-menu__count">99</div>
                          </div>
                        </li>
                        <li class="categories-menu__item">
                          <div class="categories-menu__item-inn"><a href="#" class="categories-menu__link">Портфели и деловые сумки</a>
                            <div class="categories-menu__count">99</div>
                          </div>
                        </li>
                        <li class="categories-menu__item">
                          <div class="categories-menu__item-inn"><a href="#" class="categories-menu__link">Дизайнерские сумки</a>
                            <div class="categories-menu__count">99</div>
                          </div>
                        </li>
                        <li class="categories-menu__item">
                          <div class="categories-menu__item-inn"><a href="#" class="categories-menu__link">Сумки деловые</a>
                            <div class="categories-menu__count">99</div>
                          </div>
                        </li>
                        <li class="categories-menu__item">
                          <div class="categories-menu__item-inn"><a href="#" class="categories-menu__link">Сумки пляжные</a>
                            <div class="categories-menu__count">99</div>
                          </div>
                        </li>
                        <li class="categories-menu__item categories-menu__item--sub">
                          <div class="categories-menu__item-inn"><a href="#" class="categories-menu__link">Рюкзаки и мешки</a>
                            <div class="categories-menu__count">99</div>
                          </div>
                          <ul class="categories-menu__sub">
                            <li class="categories-menu__item">
                              <div class="categories-menu__item-inn"><a href="#" class="categories-menu__link">Мешки для обуви</a>
                                <div class="categories-menu__count">99</div>
                              </div>
                            </li>
                            <li class="categories-menu__item">
                              <div class="categories-menu__item-inn"><a href="#" class="categories-menu__link">Рюкзаки</a>
                                <div class="categories-menu__count">99</div>
                              </div>
                            </li>
                            <li class="categories-menu__item">
                              <div class="categories-menu__item-inn"><a href="#" class="categories-menu__link">Из кожи</a>
                                <div class="categories-menu__count">99</div>
                              </div>
                            </li>
                            <li class="categories-menu__item">
                              <div class="categories-menu__item-inn"><a href="#" class="categories-menu__link">Рюкзаки для мальчиков</a>
                                <div class="categories-menu__count">99</div>
                              </div>
                            </li>
                          </ul>
                        </li>
                        <li class="categories-menu__item categories-menu__item--sub">
                          <div class="categories-menu__item-inn"><a href="#" class="categories-menu__link">Саквояжи и дорожные сумки</a>
                            <div class="categories-menu__count">99</div>
                          </div>
                          <ul class="categories-menu__sub">
                            <li class="categories-menu__item">
                              <div class="categories-menu__item-inn"><a href="#" class="categories-menu__link">Дорожные сумки</a>
                                <div class="categories-menu__count">99</div>
                              </div>
                            </li>
                            <li class="categories-menu__item">
                              <div class="categories-menu__item-inn"><a href="#" class="categories-menu__link">Саквояж</a>
                                <div class="categories-menu__count">99</div>
                              </div>
                            </li>
                            <li class="categories-menu__item">
                              <div class="categories-menu__item-inn"><a href="#" class="categories-menu__link">Чемоданы</a>
                                <div class="categories-menu__count">99</div>
                              </div>
                            </li>
                            <li class="categories-menu__item">
                              <div class="categories-menu__item-inn"><a href="#" class="categories-menu__link">Чехлы для чемоданов</a>
                                <div class="categories-menu__count">99</div>
                              </div>
                            </li>
                          </ul>
                        </li>
                        <li class="categories-menu__item">
                          <div class="categories-menu__item-inn"><a href="#" class="categories-menu__link">Сумочки</a>
                            <div class="categories-menu__count">99</div>
                          </div>
                        </li>
                        <li class="categories-menu__item">
                          <div class="categories-menu__item-inn"><a href="#" class="categories-menu__link">Сумки через плечо</a>
                            <div class="categories-menu__count">99</div>
                          </div>
                        </li>
                        <li class="categories-menu__item">
                          <div class="categories-menu__item-inn"><a href="#" class="categories-menu__link">Мешки для всего</a>
                            <div class="categories-menu__count">99</div>
                          </div>
                        </li>
                      </ul>
                    </div>
                    <div class="catalog__brands">
                      <ul class="categories-menu">
                        <li class="categories-menu__title">Бренды</li>
                        <li class="categories-menu__item"><a href="#" class="categories-menu__link">Adidas</a>
                          <div class="categories-menu__count">99</div>
                        </li>
                        <li class="categories-menu__item"><a href="#" class="categories-menu__link">Adis</a>
                          <div class="categories-menu__count">99</div>
                        </li>
                        <li class="categories-menu__item"><a href="#" class="categories-menu__link">Adriatica</a>
                          <div class="categories-menu__count">99</div>
                        </li>
                        <li class="categories-menu__item"><a href="#" class="categories-menu__link">Aigner</a>
                          <div class="categories-menu__count">99</div>
                        </li>
                        <li class="categories-menu__item"><a href="#" class="categories-menu__link">Alfex</a>
                          <div class="categories-menu__count">99</div>
                        </li>
                        <li class="categories-menu__item"><a href="#" class="categories-menu__link">AVI-8</a>
                          <div class="categories-menu__count">99</div>
                        </li>
                        <li class="categories-menu__item"><a href="#" class="categories-menu__link">Avon</a>
                          <div class="categories-menu__count">99</div>
                        </li>
                        <li class="categories-menu__item"><a href="#" class="categories-menu__link">Bakugan</a>
                          <div class="categories-menu__count">99</div>
                        </li>
                        <li class="categories-menu__item"><a href="#" class="categories-menu__link">Ballast</a>
                          <div class="categories-menu__count">99</div>
                        </li>
                        <li class="categories-menu__item"><a href="#" class="categories-menu__link categories-menu__link--more">Все бренды</a></li>
                      </ul>
                    </div>
                    <div class="catalog__best">
                      <div class="hot-items">
                        <div class="hot-items__inn">
                          <div class="hot-items__header">
                            <div class="hot-items__title">Лучшее предложение</div>
                          </div>
                          <div class="item-hot js-item">
                            <div class="item-hot__inn">
                              <div class="item-hot__photo"> <a href="#"><img alt="Jennyfer" class="item-hot__img js-item-main-img" src="assets/img/items/6.png"></a> </div>
                              <div class="item-hot__info"> <a href="#" class="item-hot__name">Jennyfer</a> <span class="item-hot__category">Ремень</span>
                                <div class="item-hot__prices item-hot__prices--inline">
                                  <div class="item-hot__prices-new"><span class="price price--hot">120 000 р.</span></div>
                                  <div class="item-hot__prices-old"><span class="price price--old">999 999 руб.</span> </div>
                                </div>
                                <div class="item-hot__actions">
                                  <div><a href="#" class="cart-btn js-cart-add "></a></div>
                                  <div><a href="#" class="fav-btn js-fav-add "></a> </div>
                                </div>
                              </div>
                            </div>
                          </div>
                        </div>
                      </div>
                    </div>
                  </div>
                </div>
              </div>
              <div class="catalog__bottom">
                <div class="l-wrapper">
                  <div class="hot-items">
                    <div class="hot-items__inn">
                      <div class="hot-items__header">
                        <div class="hot-items__title">Горячие предложения</div>
                        <div class="hot-items__more"> <a href="#" class="link link--ul">Все горячие предложения</a> </div>
                      </div>
                      <div class="hot-items__list">
                        <div class="hot-items__item">
                          <div class="item-hot js-item">
                            <div class="item-hot__inn">
                              <div class="item-hot__photo"> <a href="#"><img alt="David Jones" class="item-hot__img js-item-main-img" src="assets/img/items/1.png"></a> </div>
                              <div class="item-hot__info"> <a href="#" class="item-hot__name">David Jones</a> <span class="item-hot__category">Сумка дорожная</span>
                                <div class="item-hot__prices ">
                                  <div class="item-hot__prices-new"><span class="price price--hot">9 000 р.</span></div>
                                  <div class="item-hot__prices-old"><span class="price price--old">999 999 руб.</span> </div>
                                </div>
                                <div class="item-hot__actions">
                                  <div><a href="#" class="cart-btn js-cart-add "></a></div>
                                  <div><a href="#" class="fav-btn js-fav-add "></a> </div>
                                </div>
                              </div>
                            </div>
                          </div>
                        </div>
                        <div class="hot-items__item">
                          <div class="item-hot js-item">
                            <div class="item-hot__inn">
                              <div class="item-hot__photo"> <a href="#"><img alt="Casio" class="item-hot__img js-item-main-img" src="assets/img/items/2.png"></a> </div>
                              <div class="item-hot__info"> <a href="#" class="item-hot__name">Casio</a> <span class="item-hot__category">Часы</span>
                                <div class="item-hot__prices ">
                                  <div class="item-hot__prices-new"><span class="price price--hot">4 990 р.</span></div>
                                  <div class="item-hot__prices-old"><span class="price price--old">999 999 руб.</span> </div>
                                </div>
                                <div class="item-hot__actions">
                                  <div><a href="#" class="cart-btn js-cart-add is-active"></a></div>
                                  <div><a href="#" class="fav-btn js-fav-add "></a> </div>
                                </div>
                              </div>
                            </div>
                          </div>
                        </div>
                        <div class="hot-items__item">
                          <div class="item-hot js-item">
                            <div class="item-hot__inn">
                              <div class="item-hot__photo"> <a href="#"><img alt="Salomon" class="item-hot__img js-item-main-img" src="assets/img/items/3.png"></a> </div>
                              <div class="item-hot__info"> <a href="#" class="item-hot__name">Salomon</a> <span class="item-hot__category">Сумка поясная</span>
                                <div class="item-hot__prices ">
                                  <div class="item-hot__prices-new"><span class="price price--hot">3 500 р.</span></div>
                                  <div class="item-hot__prices-old"><span class="price price--old">999 999 руб.</span> </div>
                                </div>
                                <div class="item-hot__actions">
                                  <div><a href="#" class="cart-btn js-cart-add "></a></div>
                                  <div><a href="#" class="fav-btn js-fav-add is-active"></a> </div>
                                </div>
                              </div>
                            </div>
                          </div>
                        </div>
                        <div class="hot-items__item">
                          <div class="item-hot js-item">
                            <div class="item-hot__inn">
                              <div class="item-hot__photo"> <a href="#"><img alt="Coccinelle" class="item-hot__img js-item-main-img" src="assets/img/items/4.png"></a> </div>
                              <div class="item-hot__info"> <a href="#" class="item-hot__name">Coccinelle</a> <span class="item-hot__category">Сумка</span>
                                <div class="item-hot__prices ">
                                  <div class="item-hot__prices-new"><span class="price price--hot">45 000 р.</span></div>
                                  <div class="item-hot__prices-old"><span class="price price--old">999 999 руб.</span> </div>
                                </div>
                                <div class="item-hot__actions">
                                  <div><a href="#" class="cart-btn js-cart-add "></a></div>
                                  <div><a href="#" class="fav-btn js-fav-add "></a> </div>
                                </div>
                              </div>
                            </div>
                          </div>
                        </div>
                      </div>
                    </div>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
      </header>
      <div class="l-content">
        <div class="l-wrapper">
          <div class="p-cart">
            <div class="back-link"> <a href="#" class="link">Вернуться к покупкам</a> </div>
            <div class="l-order">
              <div class="l-order__inn">
                <div class="l-order__main">
                  <div class="title h1">Ваша корзина</div>
                  <div class="item-click item-click--row item-click--border "> <a href="#" class="remove-btn item-click__remove js-item-remove"><i></i></a>
                    <div class="item-click__inn">
                      <div class="item-click__photo"><a href="#"> <img class="item-click__img" src="assets/img/items/1.png"> </a> </div>
                      <div class="item-click__info">
                        <div class="item-click__row">
                          <div>
                            <div class="item-click__id">#34234232</div> <a href="#" class="item-click__name">Часы Casio</a>
                            <div class="item-click__chars">
                              <div class="table-chars">
                                <div class="table-chars__cell">
                                  <dl><dt>Цвет</dt>
                                    <dd>красный</dd>
                                  </dl>
                                  <dl><dt>Размер</dt>
                                    <dd>XL</dd>
                                  </dl>
                                </div>
                              </div>
                            </div>
                          </div>
                          <div class="item-click__num">
                            <div class="item-count js-item-count js-item-cart-count" data-price="4990" data-max="11"> <button type="button" data-el="minus" class="item-count__minus">-</button>
                              <div class="item-count__num"><span data-el="num">1</span> шт.</div> <button type="button" data-el="plus" class="item-count__plus">+</button> </div>
                          </div>
                          <div class="item-click__price">
                            <div class="price"><span class="js-item-click-price js-odometer">4 990</span> р.</div>
                          </div>
                        </div>
                      </div>
                    </div>
                  </div>
                  <div class="item-click item-click--row item-click--border "> <a href="#" class="remove-btn item-click__remove js-item-remove"><i></i></a>
                    <div class="item-click__inn">
                      <div class="item-click__photo"><a href="#"> <img class="item-click__img" src="assets/img/items/2.png"> </a> </div>
                      <div class="item-click__info">
                        <div class="item-click__row">
                          <div>
                            <div class="item-click__id">#34234232</div> <a href="#" class="item-click__name">Сумка поясная Salomon</a>
                            <div class="item-click__chars">
                              <div class="table-chars">
                                <div class="table-chars__cell">
                                  <dl><dt>Цвет</dt>
                                    <dd>красный</dd>
                                  </dl>
                                  <dl><dt>Размер</dt>
                                    <dd>XL</dd>
                                  </dl>
                                </div>
                              </div>
                            </div>
                          </div>
                          <div class="item-click__num">
                            <div class="item-count js-item-count js-item-cart-count" data-price="3500" data-max="11"> <button type="button" data-el="minus" class="item-count__minus">-</button>
                              <div class="item-count__num"><span data-el="num">1</span> шт.</div> <button type="button" data-el="plus" class="item-count__plus">+</button> </div>
                          </div>
                          <div class="item-click__price">
                            <div class="price"><span class="js-item-click-price js-odometer">3 500</span> р.</div>
                          </div>
                        </div>
                      </div>
                    </div>
                  </div>
                  <div class="item-click item-click--row item-click--border "> <a href="#" class="remove-btn item-click__remove js-item-remove"><i></i></a>
                    <div class="item-click__inn">
                      <div class="item-click__photo"><a href="#"> <img class="item-click__img" src="assets/img/items/3.png"> </a> </div>
                      <div class="item-click__info">
                        <div class="item-click__row">
                          <div>
                            <div class="item-click__id">#34234232</div> <a href="#" class="item-click__name">Сумка Coccinelle</a>
                            <div class="item-click__chars">
                              <div class="table-chars">
                                <div class="table-chars__cell">
                                  <dl><dt>Цвет</dt>
                                    <dd>красный</dd>
                                  </dl>
                                  <dl><dt>Размер</dt>
                                    <dd>XL</dd>
                                  </dl>
                                </div>
                              </div>
                            </div>
                          </div>
                          <div class="item-click__num">
                            <div class="item-count js-item-count js-item-cart-count" data-price="45000" data-max="11"> <button type="button" data-el="minus" class="item-count__minus">-</button>
                              <div class="item-count__num"><span data-el="num">1</span> шт.</div> <button type="button" data-el="plus" class="item-count__plus">+</button> </div>
                          </div>
                          <div class="item-click__price">
                            <div class="price"><span class="js-item-click-price js-odometer">45 000</span> р.</div>
                          </div>
                        </div>
                      </div>
                    </div>
                  </div>
                  <div class="item-click item-click--row item-click--border "> <a href="#" class="remove-btn item-click__remove js-item-remove"><i></i></a>
                    <div class="item-click__inn">
                      <div class="item-click__photo"><a href="#"> <img class="item-click__img" src="assets/img/items/4.png"> </a> </div>
                      <div class="item-click__info">
                        <div class="item-click__row">
                          <div>
                            <div class="item-click__id">#34234232</div> <a href="#" class="item-click__name">Ремень Tommy Hilfiger</a>
                            <div class="item-click__chars">
                              <div class="table-chars">
                                <div class="table-chars__cell">
                                  <dl><dt>Цвет</dt>
                                    <dd>красный</dd>
                                  </dl>
                                  <dl><dt>Размер</dt>
                                    <dd>XL</dd>
                                  </dl>
                                </div>
                              </div>
                            </div>
                          </div>
                          <div class="item-click__num">
                            <div class="item-count js-item-count js-item-cart-count" data-price="99000" data-max="11"> <button type="button" data-el="minus" class="item-count__minus">-</button>
                              <div class="item-count__num"><span data-el="num">1</span> шт.</div> <button type="button" data-el="plus" class="item-count__plus">+</button> </div>
                          </div>
                          <div class="item-click__price">
                            <div class="price"><span class="js-item-click-price js-odometer">99 000</span> р.</div>
                          </div>
                        </div>
                      </div>
                    </div>
                  </div>
                  <div class="item-click item-click--row item-click--border item-click--sold-out"> <a href="#" class="remove-btn item-click__remove js-item-remove"><i></i></a>
                    <div class="item-click__inn">
                      <div class="item-click__photo"><a href="#"> <img class="item-click__img" src="assets/img/items/5.png"> </a> </div>
                      <div class="item-click__info">
                        <div class="item-click__row">
                          <div>
                            <div class="item-click__id">#34234232</div> <a href="#" class="item-click__name">Ремень Jennyfer</a>
                            <div class="item-click__chars">
                              <div class="table-chars">
                                <div class="table-chars__cell">
                                  <dl><dt>Цвет</dt>
                                    <dd>красный</dd>
                                  </dl>
                                  <dl><dt>Размер</dt>
                                    <dd>XL</dd>
                                  </dl>
                                </div>
                              </div>
                            </div>
                          </div>
                          <div class="item-click__num">
                            <div class="item-count js-item-count js-item-cart-count" data-price="120000" data-max="11"> <button type="button" data-el="minus" class="item-count__minus">-</button>
                              <div class="item-count__num"><span data-el="num">1</span> шт.</div> <button type="button" data-el="plus" class="item-count__plus">+</button> </div>
                          </div>
                          <div class="item-click__price">
                            <div class="price"><span class="js-item-click-price js-odometer">120 000</span> р.</div>
                          </div>
                        </div>
                      </div>
                    </div>
                  </div>
                </div>
                <div class="l-order__aside">
                  <div class="bg-block">
                    <div class="bg-block__group p-cart__total">
                      <div class="p-cart__total-label">Итого 4 товара без учета <span>доставки:</span></div>
                      <div class="price">58 560 р.</div> <a href="#" class="btn btn--vinous btn--lg">Оформить заказ</a> </div>
                    <div class="bg-block__group"> <a href="#" onclick="$('.promo-input').show(); $(this).remove(); return false;" class="link">
    <i  class="ticon ticon-discount-2 text-red"></i>
 <span>У меня есть промокод на скидку</span></a>
                      <div class="promo-input">
                        <div class="promo-input__label">Введите промокод</div>
                        <div class="promo-input__inn">
                          <div class="promo-input__left"> <input type="text" class="promo-input__input" placeholder="Промокод"> </div>
                          <div class="promo-input__right"> <button class="promo-input__btn" type="submit">ОК</button> </div>
                        </div>
                      </div>
                    </div>
                  </div>
                  <div class="bg-block">
                    <div class="bg-block__group">
                      <div class="bonus-box">
                        <div class="bonus-box__text">Бонусных рублей за заказ: <span>3 457</span></div> <a href="#" class="link"><span>Зачем нужны бонусные рубли?</span></a> </div>
                    </div>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
        <div class="items items--highlight">
          <div class="l-wrapper">
            <div class="items__header">
              <div class="items__title">
                <div class="title h1">Рекомендуемые товары</div>
              </div>
            </div>
            <div class="items-carousel carousel">
              <div class="swiper-container js-items-carousel">
                <div class="swiper-wrapper">
                  <div class="swiper-slide">
                    <div class="items-carousel__item">
                      <div class="items__list">
                        <div class="items__cell">
                          <div class="item-grid  js-item  js-item-grid item-grid--simple">
                            <div data-size="big" data-theme="discount" title="Успей купить!" class="item-badge item-badge--discount js-tooltip"></div>
                            <div class="item-grid__inn">
                              <div class="item-grid__photo"> <a href="#"><img alt="Casio" class="item-grid__img js-item-main-img" src="assets/img/items/2.png"></a> </div> <a href="#" class="item-grid__name">Casio</a>
                              <div class="item-grid__category">Часы</div>
                              <div class="item-grid__meta">
                                <div class="item-grid__meta-left">
                                  <div class="rate">
                                    <div class="rate__inn">
                                      <div class="rate__stars r1"> <i></i><i></i><i></i><i></i><i></i> </div>
                                      <div class="rate__count">(123)</div>
                                    </div>
                                  </div>
                                </div>
                                <div class="item-grid__meta-right"> <a href="#" class="js-fav-add fav-btn "></a> </div>
                              </div>
                              <div class="item-grid__actions">
                                <div class="item-grid__actions-left"> <span class="price price--hot">4 990 р.</span> <span class="price price--old">46 900 р.</span> </div>
                                <div class="item-grid__actions-right"> <a href="#" class="js-cart-add cart-btn is-active"></a> <a href="#" class="js-fav-add fav-btn "></a> </div>
                              </div>
                              <div class="item-grid__fast-view"> <a class="btn btn--pink js-fast-view-toggle" href="#">Быстрый просмотр</a> </div>
                            </div>
                          </div>
                        </div>
                        <div class="items__cell">
                          <div class="item-grid  js-item  js-item-grid item-grid--simple">
                            <div class="item-grid__inn">
                              <div class="item-grid__photo"> <a href="#"><img alt="Salomon" class="item-grid__img js-item-main-img" src="assets/img/items/3.png"></a> </div> <a href="#" class="item-grid__name">Salomon</a>
                              <div class="item-grid__category">Сумка поясная</div>
                              <div class="item-grid__meta">
                                <div class="item-grid__meta-left">
                                  <div class="rate">
                                    <div class="rate__inn">
                                      <div class="rate__stars r4"> <i></i><i></i><i></i><i></i><i></i> </div>
                                      <div class="rate__count">(12)</div>
                                    </div>
                                  </div>
                                </div>
                                <div class="item-grid__meta-right"> <a href="#" class="js-fav-add fav-btn is-active"></a> </div>
                              </div>
                              <div class="item-grid__actions">
                                <div class="item-grid__actions-left"> <span class="price">3 500 р.</span> </div>
                                <div class="item-grid__actions-right"> <a href="#" class="js-cart-add cart-btn "></a> <a href="#" class="js-fav-add fav-btn is-active"></a> </div>
                              </div>
                              <div class="item-grid__fast-view"> <a class="btn btn--pink js-fast-view-toggle" href="#">Быстрый просмотр</a> </div>
                            </div>
                          </div>
                        </div>
                        <div class="items__cell">
                          <div class="item-grid  js-item  js-item-grid item-grid--simple">
                            <div data-size="big" data-theme="new" title="Новое поступление!" class="item-badge item-badge--new js-tooltip"></div>
                            <div class="item-grid__inn">
                              <div class="item-grid__photo"> <a href="#"><img alt="Coccinelle" class="item-grid__img js-item-main-img" src="assets/img/items/4.png"></a> </div> <a href="#" class="item-grid__name">Coccinelle</a>
                              <div class="item-grid__category">Сумка</div>
                              <div class="item-grid__meta">
                                <div class="item-grid__meta-left">
                                  <div class="rate">
                                    <div class="rate__inn">
                                      <div class="rate__stars r1"> <i></i><i></i><i></i><i></i><i></i> </div>
                                      <div class="rate__count">(3)</div>
                                    </div>
                                  </div>
                                </div>
                                <div class="item-grid__meta-right"> <a href="#" class="js-fav-add fav-btn "></a> </div>
                              </div>
                              <div class="item-grid__actions">
                                <div class="item-grid__actions-left"> <span class="price">45 000 р.</span> </div>
                                <div class="item-grid__actions-right"> <a href="#" class="js-cart-add cart-btn "></a> <a href="#" class="js-fav-add fav-btn "></a> </div>
                              </div>
                              <div class="item-grid__fast-view"> <a class="btn btn--pink js-fast-view-toggle" href="#">Быстрый просмотр</a> </div>
                            </div>
                          </div>
                        </div>
                        <div class="items__cell">
                          <div class="item-grid  js-item  js-item-grid item-grid--simple">
                            <div class="item-grid__inn">
                              <div class="item-grid__photo"> <a href="#"><img alt="Tommy Hilfiger" class="item-grid__img js-item-main-img" src="assets/img/items/5.png"></a> </div> <a href="#" class="item-grid__name">Tommy Hilfiger</a>
                              <div class="item-grid__category">Ремень</div>
                              <div class="item-grid__meta">
                                <div class="item-grid__meta-left">
                                  <div class="rate">
                                    <div class="rate__inn">
                                      <div class="rate__stars r2"> <i></i><i></i><i></i><i></i><i></i> </div>
                                      <div class="rate__count">(999)</div>
                                    </div>
                                  </div>
                                </div>
                                <div class="item-grid__meta-right"> <a href="#" class="js-fav-add fav-btn "></a> </div>
                              </div>
                              <div class="item-grid__actions">
                                <div class="item-grid__actions-left"> <span class="price">99 000 р.</span> </div>
                                <div class="item-grid__actions-right"> <a href="#" class="js-cart-add cart-btn "></a> <a href="#" class="js-fav-add fav-btn "></a> </div>
                              </div>
                              <div class="item-grid__fast-view"> <a class="btn btn--pink js-fast-view-toggle" href="#">Быстрый просмотр</a> </div>
                            </div>
                          </div>
                        </div>
                      </div>
                    </div>
                  </div>
                  <div class="swiper-slide">
                    <div class="items-carousel__item">
                      <div class="items__list">
                        <div class="items__cell">
                          <div class="item-grid  js-item  js-item-grid item-grid--simple">
                            <div data-size="big" data-theme="hot" title="Осторожно, горячий товар!" class="item-badge item-badge--hot js-tooltip"></div>
                            <div class="item-grid__inn">
                              <div class="item-grid__photo"> <a href="#"><img alt="Jennyfer" class="item-grid__img js-item-main-img" src="assets/img/items/6.png"></a> </div> <a href="#" class="item-grid__name">Jennyfer</a>
                              <div class="item-grid__category">Ремень</div>
                              <div class="item-grid__meta">
                                <div class="item-grid__meta-left">
                                  <div class="rate">
                                    <div class="rate__inn">
                                      <div class="rate__stars r1"> <i></i><i></i><i></i><i></i><i></i> </div>
                                      <div class="rate__count">(12)</div>
                                    </div>
                                  </div>
                                </div>
                                <div class="item-grid__meta-right"> <a href="#" class="js-fav-add fav-btn "></a> </div>
                              </div>
                              <div class="item-grid__actions">
                                <div class="item-grid__actions-left"> <span class="price">120 000 р.</span> </div>
                                <div class="item-grid__actions-right"> <a href="#" class="js-cart-add cart-btn "></a> <a href="#" class="js-fav-add fav-btn "></a> </div>
                              </div>
                              <div class="item-grid__fast-view"> <a class="btn btn--pink js-fast-view-toggle" href="#">Быстрый просмотр</a> </div>
                            </div>
                          </div>
                        </div>
                        <div class="items__cell">
                          <div class="item-grid  js-item  js-item-grid item-grid--simple">
                            <div class="item-grid__inn">
                              <div class="item-grid__photo"> <a href="#"><img alt="RELYGHT Piquadro" class="item-grid__img js-item-main-img" src="assets/img/items/7.png"></a> </div> <a href="#" class="item-grid__name">RELYGHT Piquadro</a>
                              <div class="item-grid__category">Дорожные сумки</div>
                              <div class="item-grid__meta">
                                <div class="item-grid__meta-left">
                                  <div class="rate">
                                    <div class="rate__inn">
                                      <div class="rate__stars r5"> <i></i><i></i><i></i><i></i><i></i> </div>
                                      <div class="rate__count">(999)</div>
                                    </div>
                                  </div>
                                </div>
                                <div class="item-grid__meta-right"> <a href="#" class="js-fav-add fav-btn "></a> </div>
                              </div>
                              <div class="item-grid__actions">
                                <div class="item-grid__actions-left"> <span class="price">900 р.</span> </div>
                                <div class="item-grid__actions-right"> <a href="#" class="js-cart-add cart-btn "></a> <a href="#" class="js-fav-add fav-btn "></a> </div>
                              </div>
                              <div class="item-grid__fast-view"> <a class="btn btn--pink js-fast-view-toggle" href="#">Быстрый просмотр</a> </div>
                            </div>
                          </div>
                        </div>
                        <div class="items__cell">
                          <div class="item-grid  js-item  js-item-grid item-grid--simple">
                            <div class="item-grid__inn">
                              <div class="item-grid__photo"> <a href="#"><img alt="Baudet" class="item-grid__img js-item-main-img" src="assets/img/items/8.png"></a> </div> <a href="#" class="item-grid__name">Baudet</a>
                              <div class="item-grid__category">Чемоданы</div>
                              <div class="item-grid__meta">
                                <div class="item-grid__meta-left">
                                  <div class="rate">
                                    <div class="rate__inn">
                                      <div class="rate__stars r3"> <i></i><i></i><i></i><i></i><i></i> </div>
                                      <div class="rate__count">(123)</div>
                                    </div>
                                  </div>
                                </div>
                                <div class="item-grid__meta-right"> <a href="#" class="js-fav-add fav-btn "></a> </div>
                              </div>
                              <div class="item-grid__actions">
                                <div class="item-grid__actions-left"> <span class="price">8 700 р.</span> </div>
                                <div class="item-grid__actions-right"> <a href="#" class="js-cart-add cart-btn "></a> <a href="#" class="js-fav-add fav-btn "></a> </div>
                              </div>
                              <div class="item-grid__fast-view"> <a class="btn btn--pink js-fast-view-toggle" href="#">Быстрый просмотр</a> </div>
                            </div>
                          </div>
                        </div>
                        <div class="items__cell">
                          <div class="item-grid  js-item  js-item-grid item-grid--simple">
                            <div class="item-grid__inn">
                              <div class="item-grid__photo"> <a href="#"><img alt="Fred Perry" class="item-grid__img js-item-main-img" src="assets/img/items/9.png"></a> </div> <a href="#" class="item-grid__name">Fred Perry</a>
                              <div class="item-grid__category">Сумка дорожная</div>
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
                                <div class="item-grid__actions-left"> <span class="price">99 000 р.</span> </div>
                                <div class="item-grid__actions-right"> <a href="#" class="js-cart-add cart-btn "></a> <a href="#" class="js-fav-add fav-btn "></a> </div>
                              </div>
                              <div class="item-grid__fast-view"> <a class="btn btn--pink js-fast-view-toggle" href="#">Быстрый просмотр</a> </div>
                            </div>
                          </div>
                        </div>
                      </div>
                    </div>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
        <div class="l-wrapper">
          <div class="items pb-0">
            <div class="items__header">
              <div class="items__title">
                <div class="title h1">Похожие товары</div>
              </div>
            </div>
            <div class="items-carousel carousel">
              <div class="swiper-container js-items-carousel">
                <div class="swiper-wrapper">
                  <div class="swiper-slide">
                    <div class="items-carousel__item">
                      <div class="items__list">
                        <div class="items__cell">
                          <div class="item-grid  js-item  js-item-grid item-grid--simple">
                            <div data-size="big" data-theme="discount" title="Успей купить!" class="item-badge item-badge--discount js-tooltip"></div>
                            <div class="item-grid__inn">
                              <div class="item-grid__photo"> <a href="#"><img alt="Casio" class="item-grid__img js-item-main-img" src="assets/img/items/2.png"></a> </div> <a href="#" class="item-grid__name">Casio</a>
                              <div class="item-grid__category">Часы</div>
                              <div class="item-grid__meta">
                                <div class="item-grid__meta-left">
                                  <div class="rate">
                                    <div class="rate__inn">
                                      <div class="rate__stars r4"> <i></i><i></i><i></i><i></i><i></i> </div>
                                      <div class="rate__count">(12)</div>
                                    </div>
                                  </div>
                                </div>
                                <div class="item-grid__meta-right"> <a href="#" class="js-fav-add fav-btn "></a> </div>
                              </div>
                              <div class="item-grid__actions">
                                <div class="item-grid__actions-left"> <span class="price price--hot">4 990 р.</span> <span class="price price--old">46 900 р.</span> </div>
                                <div class="item-grid__actions-right"> <a href="#" class="js-cart-add cart-btn is-active"></a> <a href="#" class="js-fav-add fav-btn "></a> </div>
                              </div>
                              <div class="item-grid__fast-view"> <a class="btn btn--pink js-fast-view-toggle" href="#">Быстрый просмотр</a> </div>
                            </div>
                          </div>
                        </div>
                        <div class="items__cell">
                          <div class="item-grid  js-item  js-item-grid item-grid--simple">
                            <div class="item-grid__inn">
                              <div class="item-grid__photo"> <a href="#"><img alt="Salomon" class="item-grid__img js-item-main-img" src="assets/img/items/3.png"></a> </div> <a href="#" class="item-grid__name">Salomon</a>
                              <div class="item-grid__category">Сумка поясная</div>
                              <div class="item-grid__meta">
                                <div class="item-grid__meta-left">
                                  <div class="rate">
                                    <div class="rate__inn">
                                      <div class="rate__stars r2"> <i></i><i></i><i></i><i></i><i></i> </div>
                                      <div class="rate__count">(123)</div>
                                    </div>
                                  </div>
                                </div>
                                <div class="item-grid__meta-right"> <a href="#" class="js-fav-add fav-btn is-active"></a> </div>
                              </div>
                              <div class="item-grid__actions">
                                <div class="item-grid__actions-left"> <span class="price">3 500 р.</span> </div>
                                <div class="item-grid__actions-right"> <a href="#" class="js-cart-add cart-btn "></a> <a href="#" class="js-fav-add fav-btn is-active"></a> </div>
                              </div>
                              <div class="item-grid__fast-view"> <a class="btn btn--pink js-fast-view-toggle" href="#">Быстрый просмотр</a> </div>
                            </div>
                          </div>
                        </div>
                        <div class="items__cell">
                          <div class="item-grid  js-item  js-item-grid item-grid--simple">
                            <div data-size="big" data-theme="new" title="Новое поступление!" class="item-badge item-badge--new js-tooltip"></div>
                            <div class="item-grid__inn">
                              <div class="item-grid__photo"> <a href="#"><img alt="Coccinelle" class="item-grid__img js-item-main-img" src="assets/img/items/4.png"></a> </div> <a href="#" class="item-grid__name">Coccinelle</a>
                              <div class="item-grid__category">Сумка</div>
                              <div class="item-grid__meta">
                                <div class="item-grid__meta-left">
                                  <div class="rate">
                                    <div class="rate__inn">
                                      <div class="rate__stars r5"> <i></i><i></i><i></i><i></i><i></i> </div>
                                      <div class="rate__count">(3)</div>
                                    </div>
                                  </div>
                                </div>
                                <div class="item-grid__meta-right"> <a href="#" class="js-fav-add fav-btn "></a> </div>
                              </div>
                              <div class="item-grid__actions">
                                <div class="item-grid__actions-left"> <span class="price">45 000 р.</span> </div>
                                <div class="item-grid__actions-right"> <a href="#" class="js-cart-add cart-btn "></a> <a href="#" class="js-fav-add fav-btn "></a> </div>
                              </div>
                              <div class="item-grid__fast-view"> <a class="btn btn--pink js-fast-view-toggle" href="#">Быстрый просмотр</a> </div>
                            </div>
                          </div>
                        </div>
                        <div class="items__cell">
                          <div class="item-grid  js-item  js-item-grid item-grid--simple">
                            <div class="item-grid__inn">
                              <div class="item-grid__photo"> <a href="#"><img alt="Tommy Hilfiger" class="item-grid__img js-item-main-img" src="assets/img/items/5.png"></a> </div> <a href="#" class="item-grid__name">Tommy Hilfiger</a>
                              <div class="item-grid__category">Ремень</div>
                              <div class="item-grid__meta">
                                <div class="item-grid__meta-left">
                                  <div class="rate">
                                    <div class="rate__inn">
                                      <div class="rate__stars r1"> <i></i><i></i><i></i><i></i><i></i> </div>
                                      <div class="rate__count">(9)</div>
                                    </div>
                                  </div>
                                </div>
                                <div class="item-grid__meta-right"> <a href="#" class="js-fav-add fav-btn "></a> </div>
                              </div>
                              <div class="item-grid__actions">
                                <div class="item-grid__actions-left"> <span class="price">99 000 р.</span> </div>
                                <div class="item-grid__actions-right"> <a href="#" class="js-cart-add cart-btn "></a> <a href="#" class="js-fav-add fav-btn "></a> </div>
                              </div>
                              <div class="item-grid__fast-view"> <a class="btn btn--pink js-fast-view-toggle" href="#">Быстрый просмотр</a> </div>
                            </div>
                          </div>
                        </div>
                      </div>
                    </div>
                  </div>
                  <div class="swiper-slide">
                    <div class="items-carousel__item">
                      <div class="items__list">
                        <div class="items__cell">
                          <div class="item-grid  js-item  js-item-grid item-grid--simple">
                            <div data-size="big" data-theme="hot" title="Осторожно, горячий товар!" class="item-badge item-badge--hot js-tooltip"></div>
                            <div class="item-grid__inn">
                              <div class="item-grid__photo"> <a href="#"><img alt="Jennyfer" class="item-grid__img js-item-main-img" src="assets/img/items/6.png"></a> </div> <a href="#" class="item-grid__name">Jennyfer</a>
                              <div class="item-grid__category">Ремень</div>
                              <div class="item-grid__meta">
                                <div class="item-grid__meta-left">
                                  <div class="rate">
                                    <div class="rate__inn">
                                      <div class="rate__stars r2"> <i></i><i></i><i></i><i></i><i></i> </div>
                                      <div class="rate__count">(999)</div>
                                    </div>
                                  </div>
                                </div>
                                <div class="item-grid__meta-right"> <a href="#" class="js-fav-add fav-btn "></a> </div>
                              </div>
                              <div class="item-grid__actions">
                                <div class="item-grid__actions-left"> <span class="price">120 000 р.</span> </div>
                                <div class="item-grid__actions-right"> <a href="#" class="js-cart-add cart-btn "></a> <a href="#" class="js-fav-add fav-btn "></a> </div>
                              </div>
                              <div class="item-grid__fast-view"> <a class="btn btn--pink js-fast-view-toggle" href="#">Быстрый просмотр</a> </div>
                            </div>
                          </div>
                        </div>
                        <div class="items__cell">
                          <div class="item-grid  js-item  js-item-grid item-grid--simple">
                            <div class="item-grid__inn">
                              <div class="item-grid__photo"> <a href="#"><img alt="RELYGHT Piquadro" class="item-grid__img js-item-main-img" src="assets/img/items/7.png"></a> </div> <a href="#" class="item-grid__name">RELYGHT Piquadro</a>
                              <div class="item-grid__category">Дорожные сумки</div>
                              <div class="item-grid__meta">
                                <div class="item-grid__meta-left">
                                  <div class="rate">
                                    <div class="rate__inn">
                                      <div class="rate__stars r4"> <i></i><i></i><i></i><i></i><i></i> </div>
                                      <div class="rate__count">(27)</div>
                                    </div>
                                  </div>
                                </div>
                                <div class="item-grid__meta-right"> <a href="#" class="js-fav-add fav-btn "></a> </div>
                              </div>
                              <div class="item-grid__actions">
                                <div class="item-grid__actions-left"> <span class="price">900 р.</span> </div>
                                <div class="item-grid__actions-right"> <a href="#" class="js-cart-add cart-btn "></a> <a href="#" class="js-fav-add fav-btn "></a> </div>
                              </div>
                              <div class="item-grid__fast-view"> <a class="btn btn--pink js-fast-view-toggle" href="#">Быстрый просмотр</a> </div>
                            </div>
                          </div>
                        </div>
                        <div class="items__cell">
                          <div class="item-grid  js-item  js-item-grid item-grid--simple">
                            <div class="item-grid__inn">
                              <div class="item-grid__photo"> <a href="#"><img alt="Baudet" class="item-grid__img js-item-main-img" src="assets/img/items/8.png"></a> </div> <a href="#" class="item-grid__name">Baudet</a>
                              <div class="item-grid__category">Чемоданы</div>
                              <div class="item-grid__meta">
                                <div class="item-grid__meta-left">
                                  <div class="rate">
                                    <div class="rate__inn">
                                      <div class="rate__stars r3"> <i></i><i></i><i></i><i></i><i></i> </div>
                                      <div class="rate__count">(123)</div>
                                    </div>
                                  </div>
                                </div>
                                <div class="item-grid__meta-right"> <a href="#" class="js-fav-add fav-btn "></a> </div>
                              </div>
                              <div class="item-grid__actions">
                                <div class="item-grid__actions-left"> <span class="price">8 700 р.</span> </div>
                                <div class="item-grid__actions-right"> <a href="#" class="js-cart-add cart-btn "></a> <a href="#" class="js-fav-add fav-btn "></a> </div>
                              </div>
                              <div class="item-grid__fast-view"> <a class="btn btn--pink js-fast-view-toggle" href="#">Быстрый просмотр</a> </div>
                            </div>
                          </div>
                        </div>
                        <div class="items__cell">
                          <div class="item-grid  js-item  js-item-grid item-grid--simple">
                            <div class="item-grid__inn">
                              <div class="item-grid__photo"> <a href="#"><img alt="Fred Perry" class="item-grid__img js-item-main-img" src="assets/img/items/9.png"></a> </div> <a href="#" class="item-grid__name">Fred Perry</a>
                              <div class="item-grid__category">Сумка дорожная</div>
                              <div class="item-grid__meta">
                                <div class="item-grid__meta-left">
                                  <div class="rate">
                                    <div class="rate__inn">
                                      <div class="rate__stars r3"> <i></i><i></i><i></i><i></i><i></i> </div>
                                      <div class="rate__count">(999)</div>
                                    </div>
                                  </div>
                                </div>
                                <div class="item-grid__meta-right"> <a href="#" class="js-fav-add fav-btn "></a> </div>
                              </div>
                              <div class="item-grid__actions">
                                <div class="item-grid__actions-left"> <span class="price">99 000 р.</span> </div>
                                <div class="item-grid__actions-right"> <a href="#" class="js-cart-add cart-btn "></a> <a href="#" class="js-fav-add fav-btn "></a> </div>
                              </div>
                              <div class="item-grid__fast-view"> <a class="btn btn--pink js-fast-view-toggle" href="#">Быстрый просмотр</a> </div>
                            </div>
                          </div>
                        </div>
                      </div>
                    </div>
                  </div>
                </div>
              </div>
            </div>
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
