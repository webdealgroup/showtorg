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
    <div class="modal remodal md-login" data-remodal-id="login">
      <button class="modal__close close-btn" data-remodal-action="close">
        Закрыть
      </button>
      <div class="login-tabs js-tabs">
        <ul class="login-tabs__menu">
          <li class="login-tabs__item is-active">
            <a data-el="tab" href="#login_tab" class="login-tabs__link"><span>Я уже тут</span></a>
          </li>
          <li class="login-tabs__item">
            <a data-el="tab" href="#register_tab" class="login-tabs__link"><span>Хочу к вам</span></a>
          </li>
        </ul>
        <div class="login-tabs__panes">
          <div data-el="pane" id="login_tab" class="login-tabs__pane is-active">
            <div class="md-login__social">
              <a class="md-login__social-item md-login__social-item--vk" href="#"></a><a class="md-login__social-item md-login__social-item--fb" href="#"></a><a class="md-login__social-item md-login__social-item--tw" href="#"></a><a class="md-login__social-item md-login__social-item--gplus"
              href="#"></a>
            </div>
            <div class="md-login__or">
              или
            </div>
            <form autocomplete="off" class="md-login__form">
              <div class="form-row">
                <div class="complex-input complex-input--icon js-complex-input">
                  <label class="complex-input__label">E-mail</label>
                  <div class="complex-input__icon">
                    <i class="ticon ticon-user-1 "></i>
                  </div>
                  <div class="complex-input__input">
                    <input type="email" class="input">
                  </div>
                </div>
              </div>
              <div class="form-row">
                <div class="complex-input complex-input--icon password-input js-complex-input">
                  <label class="complex-input__label">Пароль</label>
                  <div class="complex-input__icon">
                    <i class="ticon ticon-lock "></i>
                  </div>
                  <div class="complex-input__input">
                    <input type="password" class="input js-toggle-password">
                  </div>
                  <div class="password-input__block">
                    <div class="password-input__forgot">
                      <a href="#">Забыли пароль?</a>
                    </div>
                    <a title="Скрыть пароль" href="#" class="toggle-password js-toggle-password-btn"><i></i></a>
                  </div>
                </div>
              </div>
              <div class="form-row">
                <button type="submit" class="btn btn--pink btn--lg">
                  <i style="font-size: 19px;" class="ticon ticon-key "></i>
                  Войти
                </button>
              </div>
            </form>
          </div>
          <div data-el="pane" id="register_tab" class="login-tabs__pane">
            <div class="md-login__social">
              <a class="md-login__social-item md-login__social-item--vk" href="#"></a><a class="md-login__social-item md-login__social-item--fb" href="#"></a><a class="md-login__social-item md-login__social-item--tw" href="#"></a><a class="md-login__social-item md-login__social-item--gplus"
              href="#"></a>
            </div>
            <div class="md-login__or">
              или
            </div>
            <form autocomplete="off" class="md-login__form js-example-form">
              <div class="form-row">
                <div class="form-help">
                  <a href="#" class="form-help__close close-btn js-parent-remove"></a>
                  <p>
                    При регистрации Личного Кабинета, просим Вас указывать реальные данные.
                  </p>
                  <p>
                    Корректное ФИО необходимо для осуществления возврата денежных средств после оплаты.
                  </p>
                  <p>
                    Адрес электронной почты необходим, чтобы Вы всегда были в курсе всех акций и статусов Ваших заказов.
                  </p>
                  <p>
                    Номер телефона необходим, чтобы в день доставки с Вами мог связаться наш курьер. Так же, по Вашему желанию, Вам могут приходить смс уведомления о текущих акциях и специальных предложениях.
                  </p>
                </div>
                <div class="complex-input complex-input--icon is-valid js-complex-input">
                  <label class="complex-input__label">E-mail</label>
                  <div class="complex-input__icon">
                    <i class="ticon ticon-user-1 "></i>
                  </div>
                  <div class="complex-input__input">
                    <input type="email" class="input">
                  </div>
                </div>
                <label class="switcher ">
                  <div class="switcher__inn">
                    <div class="switcher__toggle">
                      <input  type="checkbox" class="js-switchery ">
                    </div>
                    <div class="switcher__label">
                      Подписаться на новости
                    </div>
                  </div> </label>
              </div>
              <div class="form-row">
                <div class="complex-input js-complex-input">
                  <label class="complex-input__label">Фамилия</label>
                  <div class="complex-input__input">
                    <input data-error="Введите фамилию на русском языке" type="text" class="input" name="second_name">
                  </div>
                </div>
              </div>
              <div class="form-row">
                <div class="complex-input js-complex-input">
                  <label class="complex-input__label">Имя</label>
                  <div class="complex-input__input">
                    <input type="text" class="input">
                  </div>
                </div>
              </div>
              <div class="form-row">
                <div class="gender-select">
                  <div class="gender-select__inn">
                    <div class="gender-select__label">
                      Пол:
                    </div>
                    <div class="gender-select__item">
                      <label class="gender-select__checkbox">
                        <input type="radio" name="gender" value="man">
                        <span class="gender-select__checkbox-item"> <i  class="ticon ticon-man "></i> </span> </label>
                    </div>
                    <div class="gender-select__item">
                      <label class="gender-select__checkbox">
                        <input type="radio" name="gender" value="woman">
                        <span class="gender-select__checkbox-item"> <i  class="ticon ticon-woman "></i> </span> </label>
                    </div>
                  </div>
                </div>
              </div>
              <div class="form-row">
                <div class="row">
                  <div class="col-sm-3">
                    <select data-placeholder="День" class="select">
                      <option></option>

                      <option>1</option>

                      <option>2</option>

                      <option>3</option>

                      <option>4</option>

                      <option>5</option>

                      <option>6</option>

                      <option>7</option>

                      <option>8</option>

                      <option>9</option>

                      <option>10</option>

                      <option>11</option>

                      <option>12</option>

                      <option>13</option>

                      <option>14</option>

                      <option>15</option>

                      <option>16</option>

                      <option>17</option>

                      <option>18</option>

                      <option>19</option>

                      <option>20</option>

                      <option>21</option>

                      <option>22</option>

                      <option>23</option>

                      <option>24</option>

                      <option>25</option>

                      <option>26</option>

                      <option>27</option>

                      <option>28</option>

                      <option>29</option>

                      <option>30</option>

                    </select>
                  </div>
                  <div class="col-sm-5">
                    <select data-placeholder="Месяц" class="select">
                      <option></option>

                      <option>Январь</option>

                      <option>Февраль</option>

                      <option>Март</option>

                      <option>Апрель</option>

                      <option>Май</option>

                      <option>Июнь</option>

                      <option>Июль</option>

                      <option>Август</option>

                      <option>Сентябрь</option>

                      <option>Октябрь</option>

                      <option>Ноябрь</option>

                      <option>Декабрь</option>

                    </select>
                  </div>
                  <div class="col-sm-4">
                    <select data-placeholder="Год" class="select">
                      <option></option>

                      <option>1900</option>

                      <option>1901</option>

                      <option>1902</option>

                      <option>1903</option>

                      <option>1904</option>

                      <option>1905</option>

                      <option>1906</option>

                      <option>1907</option>

                      <option>1908</option>

                      <option>1909</option>

                      <option>1910</option>

                      <option>1911</option>

                      <option>1912</option>

                      <option>1913</option>

                      <option>1914</option>

                      <option>1915</option>

                      <option>1916</option>

                      <option>1917</option>

                      <option>1918</option>

                      <option>1919</option>

                      <option>1920</option>

                      <option>1921</option>

                      <option>1922</option>

                      <option>1923</option>

                      <option>1924</option>

                      <option>1925</option>

                      <option>1926</option>

                      <option>1927</option>

                      <option>1928</option>

                      <option>1929</option>

                      <option>1930</option>

                      <option>1931</option>

                      <option>1932</option>

                      <option>1933</option>

                      <option>1934</option>

                      <option>1935</option>

                      <option>1936</option>

                      <option>1937</option>

                      <option>1938</option>

                      <option>1939</option>

                      <option>1940</option>

                      <option>1941</option>

                      <option>1942</option>

                      <option>1943</option>

                      <option>1944</option>

                      <option>1945</option>

                      <option>1946</option>

                      <option>1947</option>

                      <option>1948</option>

                      <option>1949</option>

                      <option>1950</option>

                      <option>1951</option>

                      <option>1952</option>

                      <option>1953</option>

                      <option>1954</option>

                      <option>1955</option>

                      <option>1956</option>

                      <option>1957</option>

                      <option>1958</option>

                      <option>1959</option>

                      <option>1960</option>

                      <option>1961</option>

                      <option>1962</option>

                      <option>1963</option>

                      <option>1964</option>

                      <option>1965</option>

                      <option>1966</option>

                      <option>1967</option>

                      <option>1968</option>

                      <option>1969</option>

                      <option>1970</option>

                      <option>1971</option>

                      <option>1972</option>

                      <option>1973</option>

                      <option>1974</option>

                      <option>1975</option>

                      <option>1976</option>

                      <option>1977</option>

                      <option>1978</option>

                      <option>1979</option>

                      <option>1980</option>

                      <option>1981</option>

                      <option>1982</option>

                      <option>1983</option>

                      <option>1984</option>

                      <option>1985</option>

                      <option>1986</option>

                      <option>1987</option>

                      <option>1988</option>

                      <option>1989</option>

                      <option>1990</option>

                      <option>1991</option>

                      <option>1992</option>

                      <option>1993</option>

                      <option>1994</option>

                      <option>1995</option>

                      <option>1996</option>

                      <option>1997</option>

                      <option>1998</option>

                      <option>1999</option>

                      <option>2000</option>

                      <option>2001</option>

                      <option>2002</option>

                      <option>2003</option>

                      <option>2004</option>

                      <option>2005</option>

                      <option>2006</option>

                      <option>2007</option>

                      <option>2008</option>

                      <option>2009</option>

                      <option>2010</option>

                      <option>2011</option>

                      <option>2012</option>

                      <option>2013</option>

                      <option>2014</option>

                      <option>2015</option>

                      <option>2016</option>

                    </select>
                  </div>
                </div>
              </div>
              <div class="form-row hidden-xs">
                <div class="input-row password-row js-password-row">
                  <div class="input-row__cell input-row__icon">
                    <i class="ticon ticon-asterisk "></i>
                  </div>
                  <div class="input-row__cell input-row__cell--tiny">
                    <input class="input js-toggle-password" type="password">
                  </div>
                  <div class="input-row__cell input-row__cell--tiny">
                    <input class="input js-toggle-password" type="password">
                  </div>
                  <div class="input-row__cell input-row__cell--tiny">
                    <input class="input js-toggle-password" type="password">
                  </div>
                  <div class="input-row__cell input-row__cell--tiny">
                    <input class="input js-toggle-password" type="password">
                  </div>
                  <div class="input-row__cell input-row__cell--tiny">
                    <input class="input js-toggle-password" type="password">
                  </div>
                  <div class="input-row__cell input-row__cell--tiny">
                    <input class="input js-toggle-password" type="password">
                  </div>
                  <div class="input-row__cell input-row__cell--tiny">
                    <input class="input js-toggle-password" type="password">
                  </div>
                  <div class="input-row__cell input-row__cell--tiny">
                    <input class="input js-toggle-password" type="password">
                  </div>
                  <a title="Скрыть пароль" href="#" class="toggle-password js-toggle-password-btn input-row__cell"> <i></i> </a>
                </div>
              </div>
              <div class="form-row xvisible-sm">
                <div class="complex-input js-complex-input">
                  <label class="complex-input__label">Пароль</label>
                  <div class="complex-input__input">
                    <input type="password" class="input">
                  </div>
                </div>
              </div>
              <div class="form-row">
                <div class="input-row">
                  <div class="input-row__cell input-row__icon">
                    <i class="ticon ticon-mobile "></i>
                  </div>
                  <div class="input-row__cell input-row__cell--border text-center" style="width: 80px;">
                    <select class="select">

                      <option>+7</option>

                      <option>+38</option>

                      <option>+375</option>

                    </select>
                  </div>
                  <div class="input-row__cell">
                    <input type="text" class="input js-phone-mask" placeholder="(___) ___-__-__">
                  </div>
                </div>
                <label class="switcher ">
                  <div class="switcher__inn">
                    <div class="switcher__toggle">
                      <input  type="checkbox" class="js-switchery ">
                    </div>
                    <div class="switcher__label">
                      Получать SMS об акциях и спецпредложениях
                    </div>
                  </div> </label>
              </div>
              <div class="form-row">
                <button type="submit" class="btn btn--pink btn--lg">
                  <i style="font-size: 27px;" class="ticon ticon-door "></i>
                  Зарегистрироваться
                </button>
              </div>
              <div class="form-row">
                <div class="text">
                  Я соглашаюсь с условиями <a class="link link--ul" href="#">Публичной оферты</a>
                </div>
              </div>
            </form>
          </div>
        </div>
      </div>
    </div>
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
              <!--div class="border-block">
                <div class="title h2">
                  Популярные товары
                </div>
                <div class="items-carousel carousel">
                  <div class="swiper-container js-items-popular-carousel">
                    <div class="swiper-wrapper">
                      <div class="swiper-slide">
                        <div class="items-carousel__item">
                          <div class="item-hot js-item">
                            <div class="item-hot__inn">
                              <div class="item-hot__photo">
                                <a href="#"><img alt="David Jones" class="item-hot__img js-item-main-img" src="catalogue/images/1051_thumb.jpg"></a>
                              </div>
                              <div class="item-hot__info">
                                <a href="#" class="item-hot__name">PROEL AT235</a><span class="item-hot__category">Переходник RCA<->RCA</span>
                                <div class="item-hot__prices ">
                                  <div class="item-hot__prices-new">
                                    <span class="price price--hot">70 р.</span>
                                  </div>
                                  <div class="item-hot__prices-old">
                                    <span class="price price--old">100 руб.</span>
                                  </div>
                                </div>
                                <div class="item-hot__actions">
                                  <div>
                                    <a href="#" class="cart-btn js-cart-add "></a>
                                  </div>
                                  <div>
                                    <a href="#" class="fav-btn js-fav-add "></a>
                                  </div>
                                </div>
                              </div>
                            </div>
                          </div>
                          <div class="item-hot js-item">
                            <div class="item-hot__inn">
                              <div class="item-hot__photo">
                                <a href="#"><img alt="Casio" class="item-hot__img js-item-main-img" src="catalogue/images/1082_thumb.jpg"></a>
                              </div>
                              <div class="item-hot__info">
                                <a href="#" class="item-hot__name">PROEL AV410</a><span class="item-hot__category">Катушка для кабеля </span>
                                <div class="item-hot__prices ">
                                  <div class="item-hot__prices-new">
                                    <span class="price price--hot">63 644 р.</span>
                                  </div>
                                  <div class="item-hot__prices-old">
                                    <span class="price price--old">70 560 р.</span>
                                  </div>
                                </div>
                                <div class="item-hot__actions">
                                  <div>
                                    <a href="#" class="cart-btn js-cart-add is-active"></a>
                                  </div>
                                  <div>
                                    <a href="#" class="fav-btn js-fav-add "></a>
                                  </div>
                                </div>
                              </div>
                            </div>
                          </div>
                          <div class="item-hot js-item">
                            <div class="item-hot__inn">
                              <div class="item-hot__photo">
                                <a href="#"><img alt="Salomon" class="item-hot__img js-item-main-img" src="catalogue/images/1258_thumb.jpg"></a>
                              </div>
                              <div class="item-hot__info">
                                <a href="#" class="item-hot__name">PROEL EL50</a><span class="item-hot__category">Банкетки, стульчики </span>
                                <div class="item-hot__prices ">
                                  <div class="item-hot__prices-new">
                                    <span class="price price--hot">3 570 р.</span>
                                  </div>
                                  <div class="item-hot__prices-old">
                                    <span class="price price--old">4 600 руб.</span>
                                  </div>
                                </div>
                                <div class="item-hot__actions">
                                  <div>
                                    <a href="#" class="cart-btn js-cart-add "></a>
                                  </div>
                                  <div>
                                    <a href="#" class="fav-btn js-fav-add is-active"></a>
                                  </div>
                                </div>
                              </div>
                            </div>
                          </div>
                        </div>
                      </div>
                      <div class="swiper-slide">
                        <div class="items-carousel__item">
                          <div class="item-hot js-item">
                            <div class="item-hot__inn">
                              <div class="item-hot__photo">
                                <a href="#"><img alt="GE 4515" class="item-hot__img js-item-main-img" src="catalogue/images/8022_thumb.jpg"></a>
                              </div>
                              <div class="item-hot__info">
                                <a href="#" class="item-hot__name">GE 4515</a><span class="item-hot__category">Лампы</span>
                                <div class="item-hot__prices ">
                                  <div class="item-hot__prices-new">
                                    <span class="price price--hot">700 р.</span>
                                  </div>
                                  <div class="item-hot__prices-old">
                                    <span class="price price--old">850 руб.</span>
                                  </div>
                                </div>
                                <div class="item-hot__actions">
                                  <div>
                                    <a href="#" class="cart-btn js-cart-add is-active"></a>
                                  </div>
                                  <div>
                                    <a href="#" class="fav-btn js-fav-add "></a>
                                  </div>
                                </div>
                              </div>
                            </div>
                          </div>
                          <div class="item-hot js-item">
                            <div class="item-hot__inn">
                              <div class="item-hot__photo">
                                <a href="#"><img alt="PROEL AV300" class="item-hot__img js-item-main-img" src="catalogue/images/1080_thumb.jpg"></a>
                              </div>
                              <div class="item-hot__info">
                                <a href="#" class="item-hot__name">PROEL AV300</a><span class="item-hot__category">Катушка для кабеля</span>
                                <div class="item-hot__prices ">
                                  <div class="item-hot__prices-new">
                                    <span class="price price--hot">29 748 р.</span>
                                  </div>
                                  <div class="item-hot__prices-old">
                                    <span class="price price--old">33 000 руб.</span>
                                  </div>
                                </div>
                                <div class="item-hot__actions">
                                  <div>
                                    <a href="#" class="cart-btn js-cart-add "></a>
                                  </div>
                                  <div>
                                    <a href="#" class="fav-btn js-fav-add is-active"></a>
                                  </div>
                                </div>
                              </div>
                            </div>
                          </div>
                          <div class="item-hot js-item">
                            <div class="item-hot__inn">
                              <div class="item-hot__photo">
                                <a href="#"><img alt="PROEL EL700" class="item-hot__img js-item-main-img" src="catalogue/images/1263_thumb.jpg"></a>
                              </div>
                              <div class="item-hot__info">
                                <a href="#" class="item-hot__name">PROEL EL700</a><span class="item-hot__category">Стойка для комбоусилителей</span>
                                <div class="item-hot__prices ">
                                  <div class="item-hot__prices-new">
                                    <span class="price price--hot">5 316 р.</span>
                                  </div>
                                  <div class="item-hot__prices-old">
                                    <span class="price price--old">5 900 руб.</span>
                                  </div>
                                </div>
                                <div class="item-hot__actions">
                                  <div>
                                    <a href="#" class="cart-btn js-cart-add "></a>
                                  </div>
                                  <div>
                                    <a href="#" class="fav-btn js-fav-add "></a>
                                  </div>
                                </div>
                              </div>
                            </div>
                          </div>
                        </div>
                      </div>
                      <div class="swiper-slide">
                        <div class="items-carousel__item">
                          <div class="item-hot js-item">
                            <div class="item-hot__inn">
                              <div class="item-hot__photo">
                                <a href="#"><img alt="PROEL KR08" class="item-hot__img js-item-main-img" src="catalogue/images/1384_thumb.jpg"></a>
                              </div>
                              <div class="item-hot__info">
                                <a href="#" class="item-hot__name">PROEL KR08</a><span class="item-hot__category">Рэк</span>
                                <div class="item-hot__prices ">
                                  <div class="item-hot__prices-new">
                                    <span class="price price--hot">3 081 р.</span>
                                  </div>
                                  <div class="item-hot__prices-old">
                                    <span class="price price--old">3 500 руб.</span>
                                  </div>
                                </div>
                                <div class="item-hot__actions">
                                  <div>
                                    <a href="#" class="cart-btn js-cart-add "></a>
                                  </div>
                                  <div>
                                    <a href="#" class="fav-btn js-fav-add is-active"></a>
                                  </div>
                                </div>
                              </div>
                            </div>
                          </div>
                          <div class="item-hot js-item">
                            <div class="item-hot__inn">
                              <div class="item-hot__photo">
                                <a href="#"><img alt="PROEL SPKA10" class="item-hot__img js-item-main-img" src="catalogue/images/12672_thumb.jpg"></a>
                              </div>
                              <div class="item-hot__info">
                                <a href="#" class="item-hot__name">PROEL SPKA10</a><span class="item-hot__category">Переходник XLR <-> Speakon</span>
                                <div class="item-hot__prices ">
                                  <div class="item-hot__prices-new">
                                    <span class="price price--hot">41 р.</span>
                                  </div>
                                  <div class="item-hot__prices-old">
                                    <span class="price price--old">65 руб.</span>
                                  </div>
                                </div>
                                <div class="item-hot__actions">
                                  <div>
                                    <a href="#" class="cart-btn js-cart-add "></a>
                                  </div>
                                  <div>
                                    <a href="#" class="fav-btn js-fav-add "></a>
                                  </div>
                                </div>
                              </div>
                            </div>
                          </div>
                          <div class="item-hot js-item">
                            <div class="item-hot__inn">
                              <div class="item-hot__photo">
                                <a href="#"><img alt="PROEL SPKA20" class="item-hot__img js-item-main-img" src="catalogue/images/12673_thumb.jpg"></a>
                              </div>
                              <div class="item-hot__info">
                                <a href="#" class="item-hot__name">PROEL SPKA20</a><span class="item-hot__category">Переходник XLR <-> Speakon</span>
                                <div class="item-hot__prices ">
                                  <div class="item-hot__prices-new">
                                    <span class="price price--hot">41 р.</span>
                                  </div>
                                  <div class="item-hot__prices-old">
                                    <span class="price price--old">65 руб.</span>
                                  </div>
                                </div>
                                <div class="item-hot__actions">
                                  <div>
                                    <a href="#" class="cart-btn js-cart-add "></a>
                                  </div>
                                  <div>
                                    <a href="#" class="fav-btn js-fav-add "></a>
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
              </div-->
              <div class="border-block">
                <div class="title h4">
                  Подписаться на новинки (Звуковое оборудование)
                </div>
                <div class="subscribe-mini">
                  <div class="subscribe-mini__left">
                    <input type="text" class="subscribe-mini__input" placeholder="Введите Ваш e-mail">
                  </div>
                  <div class="subscribe-mini__right">
                    <button class="subscribe-mini__btn" type="submit">
                      &rarr;
                    </button>
                  </div>
                </div>
              </div>
            </aside>
            <main class="l-catalog__main">
              <div class="catalog-items">
                <div class="catalog-items__header">
                  <div class="catalog-items__header-left">
                    <div class="catalog-items__title title h1">
                      Каталог
                    </div>
                    <span class="catalog-items__count">786 товаров</span>
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

                  ~~mod mod_name="rand_product" action=""~

                </div>
                <div class="catalog-items__nav">
                  <div class="catalog-items__nav-pagination">
                    <div class="pager">
                      <ul class="pagination">
                        <li class="pagination__item is-active">
                          <a href="#" class="pagination__link">1</a>
                        </li>
                        <li class="pagination__item ">
                          <a href="#" class="pagination__link">2</a>
                        </li>
                        <li class="pagination__item ">
                          <a href="#" class="pagination__link">3</a>
                        </li>
                        <li class="pagination__item pagination__item--dots"></li>
                        <li class="pagination__item">
                          <a href="#" class="pagination__link">20</a>
                        </li>
                      </ul>
                      <div class="pager__info">
                        <div class="pager__info-inn">
                          <div class="pager__info-total">
                            Результаты: 9 из 186
                          </div>
                          <div class="pager__info-btn">
                            <a href="#" class="next-btn">Следующая</a>
                          </div>
                        </div>
                      </div>
                    </div>
                    <a href="#" class="next-btn">Следующая</a>
                  </div>
                  <div class="catalog-items__nav-more">
                    <a href="#" class="more-btn">Показать еще</a>
                  </div>
                  <div class="catalog-items__nav-go">
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
                  </div>
                </div>
                <div class="items items--highlight">
                  <div class="items__header">
                    <div class="items__title">
                      <div class="title h1">
                        Популярные товары
                      </div>
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
                                    <div class="item-grid__photo">
                                      <a href="#"><img alt="PROEL AT235" class="item-grid__img js-item-main-img" src="catalogue/images/1051_thumb.jpg"></a>
                                    </div>
                                    <a href="#" class="item-grid__name">PROEL AT235</a>
                                    <div class="item-grid__category">
                                      Переходник RCA<->RCA
                                    </div>
                                    <div class="item-grid__meta">
                                      <div class="item-grid__meta-left">
                                        <div class="rate">
                                          <div class="rate__inn">
                                            <div class="rate__stars r3">
                                              <i></i><i></i><i></i><i></i><i></i>
                                            </div>
                                            <div class="rate__count">
                                              (999)
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
                                        <span class="price price--hot">70 р.</span><span class="price price--old">105 р.</span>
                                      </div>
                                      <div class="item-grid__actions-right">
                                        <a href="#" class="js-cart-add cart-btn is-active"></a><a href="#" class="js-fav-add fav-btn "></a>
                                      </div>
                                    </div>
                                    <div class="item-grid__fast-view">
                                      <a class="btn btn--pink js-fast-view-toggle" href="#">Быстрый просмотр</a>
                                    </div>
                                  </div>
                                </div>
                              </div>
                              <div class="items__cell">
                                <div class="item-grid  js-item  js-item-grid item-grid--simple">
                                  <div class="item-grid__inn">
                                    <div class="item-grid__photo">
                                      <a href="#"><img alt="PROEL AV200" class="item-grid__img js-item-main-img" src="catalogue/images/1079_thumb.jpg"></a>
                                    </div>
                                    <a href="#" class="item-grid__name">PROEL AV200</a>
                                    <div class="item-grid__category">
                                      Катушка для кабеля
                                    </div>
                                    <div class="item-grid__meta">
                                      <div class="item-grid__meta-left">
                                        <div class="rate">
                                          <div class="rate__inn">
                                            <div class="rate__stars r4">
                                              <i></i><i></i><i></i><i></i><i></i>
                                            </div>
                                            <div class="rate__count">
                                              (9)
                                            </div>
                                          </div>
                                        </div>
                                      </div>
                                      <div class="item-grid__meta-right">
                                        <a href="#" class="js-fav-add fav-btn is-active"></a>
                                      </div>
                                    </div>
                                    <div class="item-grid__actions">
                                      <div class="item-grid__actions-left">
                                        <span class="price">21 318 р.</span>
                                      </div>
                                      <div class="item-grid__actions-right">
                                        <a href="#" class="js-cart-add cart-btn "></a><a href="#" class="js-fav-add fav-btn is-active"></a>
                                      </div>
                                    </div>
                                    <div class="item-grid__fast-view">
                                      <a class="btn btn--pink js-fast-view-toggle" href="#">Быстрый просмотр</a>
                                    </div>
                                  </div>
                                </div>
                              </div>
                              <div class="items__cell">
                                <div class="item-grid  js-item  js-item-grid item-grid--simple">
                                  <div data-size="big" data-theme="new" title="Новое поступление!" class="item-badge item-badge--new js-tooltip"></div>
                                  <div class="item-grid__inn">
                                    <div class="item-grid__photo">
                                      <a href="#"><img alt="PROEL EL700" class="item-grid__img js-item-main-img" src="catalogue/images/1263_thumb.jpg"></a>
                                    </div>
                                    <a href="#" class="item-grid__name">PROEL EL700</a>
                                    <div class="item-grid__category">
                                      Стойка для комбоусилителей
                                    </div>
                                    <div class="item-grid__meta">
                                      <div class="item-grid__meta-left">
                                        <div class="rate">
                                          <div class="rate__inn">
                                            <div class="rate__stars r2">
                                              <i></i><i></i><i></i><i></i><i></i>
                                            </div>
                                            <div class="rate__count">
                                              (999)
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
                                        <span class="price">5 316 р.</span>
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
                              <div class="items__cell">
                                <div class="item-grid  js-item  js-item-grid item-grid--simple">
                                  <div class="item-grid__inn">
                                    <div class="item-grid__photo">
                                      <a href="#"><img alt="PROEL KR08" class="item-grid__img js-item-main-img" src="catalogue/images/1263_thumb.jpg"></a>
                                    </div>
                                    <a href="#" class="item-grid__name">PROEL KR08</a>
                                    <div class="item-grid__category">
                                      Рэк
                                    </div>
                                    <div class="item-grid__meta">
                                      <div class="item-grid__meta-left">
                                        <div class="rate">
                                          <div class="rate__inn">
                                            <div class="rate__stars r3">
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
                                        <span class="price">3 081 р.</span>
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
                                    <div class="item-grid__photo">
                                      <a href="#"><img alt="GE 4515" class="item-grid__img js-item-main-img" src="catalogue/images/8022_thumb.jpg"></a>
                                    </div>
                                    <a href="#" class="item-grid__name">GE 4515</a>
                                    <div class="item-grid__category">
                                      Лампы
                                    </div>
                                    <div class="item-grid__meta">
                                      <div class="item-grid__meta-left">
                                        <div class="rate">
                                          <div class="rate__inn">
                                            <div class="rate__stars r5">
                                              <i></i><i></i><i></i><i></i><i></i>
                                            </div>
                                            <div class="rate__count">
                                              (27)
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
                                        <span class="price">700 р.</span>
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
                              <div class="items__cell">
                                <div class="item-grid  js-item  js-item-grid item-grid--simple">
                                  <div class="item-grid__inn">
                                    <div class="item-grid__photo">
                                      <a href="#"><img alt="PROEL AT210" class="item-grid__img js-item-main-img" src="catalogue/images/12149_thumb.jpg"></a>
                                    </div>
                                    <a href="#" class="item-grid__name">PROEL AT210</a>
                                    <div class="item-grid__category">
                                      Переходник RCA<->RCA
                                    </div>
                                    <div class="item-grid__meta">
                                      <div class="item-grid__meta-left">
                                        <div class="rate">
                                          <div class="rate__inn">
                                            <div class="rate__stars r5">
                                              <i></i><i></i><i></i><i></i><i></i>
                                            </div>
                                            <div class="rate__count">
                                              (12)
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
                                        <span class="price">91 р.</span>
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
                              <div class="items__cell">
                                <div class="item-grid  js-item  js-item-grid item-grid--simple">
                                  <div class="item-grid__inn">
                                    <div class="item-grid__photo">
                                      <a href="#"><img alt="PROEL RSM300" class="item-grid__img js-item-main-img" src="catalogue/images/12438_thumb.jpg"></a>
                                    </div>
                                    <a href="#" class="item-grid__name">PROEL RSM300</a>
                                    <div class="item-grid__category">
                                      Пюпитр
                                    </div>
                                    <div class="item-grid__meta">
                                      <div class="item-grid__meta-left">
                                        <div class="rate">
                                          <div class="rate__inn">
                                            <div class="rate__stars r3">
                                              <i></i><i></i><i></i><i></i><i></i>
                                            </div>
                                            <div class="rate__count">
                                              (27)
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
                                        <span class="price">1 533 р.</span>
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
                              <div class="items__cell">
                                <div class="item-grid  js-item  js-item-grid item-grid--simple">
                                  <div class="item-grid__inn">
                                    <div class="item-grid__photo">
                                      <a href="#"><img alt="PROEL SPKA10" class="item-grid__img js-item-main-img" src="catalogue/images/12672_thumb.jpg"></a>
                                    </div>
                                    <a href="#" class="item-grid__name">PROEL SPKA10</a>
                                    <div class="item-grid__category">
                                      Переходник XLR <-> Speakon
                                    </div>
                                    <div class="item-grid__meta">
                                      <div class="item-grid__meta-left">
                                        <div class="rate">
                                          <div class="rate__inn">
                                            <div class="rate__stars r5">
                                              <i></i><i></i><i></i><i></i><i></i>
                                            </div>
                                            <div class="rate__count">
                                              (27)
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
                                        <span class="price">41 р.</span>
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
                            </div>
                          </div>
                        </div>
                      </div>
                    </div>
                  </div>
                </div>
                <div class="border-block xvisible-sm">
                  <div class="title h4">
                    Подписаться на новинки (сумки)
                  </div>
                  <div class="subscribe-mini">
                    <div class="subscribe-mini__left">
                      <input type="text" class="subscribe-mini__input" placeholder="Введите Ваш e-mail">
                    </div>
                    <div class="subscribe-mini__right">
                      <button class="subscribe-mini__btn" type="submit">
                        &rarr;
                      </button>
                    </div>
                  </div>
                </div>
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
                    <p>
                      Элитные марки каждый сезон выпускают новые оригинальные сумки для женщин. Для пошива премиальных моделей используются долговечные и качественные материалы. В основном это натуральная кожа и нубук, но в молодежных коллекциях также встречаются
                      изделия из цветного текстиля и полимеров.Средняя по размеру сумка с жестким каркасом и сдержанным дизайном – идеальный выбор на каждый день. В этот аксессуар поместятся личные вещи, документы для работы, косметика и многое другое.
                      В коллекциях Hugo и Furla также представлены модели с мягким корпусом, закрывающиеся на «молнию» или магнитную кнопку. Они гармонично сочетаются с одеждой в стиле casual.
                    </p>
                    <p>
                      Любительницы ультрамодных сумок оценят аксессуары от Braccialini. Они украшены объемными аппликациями из кожи, которые складываются в причудливые пейзажи и рисунки. Многие модели дополняются вышивкой и имеют необычную форму (например,
                      в виде сердца, круга или автомобиля).
                    </p>
                    <p>
                      Для тех, кто выбирает молодежный стиль, дизайнеры создают сумки с металлическими клепками, принтами, «потертостями» и контрастными вставками. Они предложены в линиях DKNY, Armani Jeans и Karl Lagerfeld.
                    </p>
                  </div>
                </div>
                <div class="catalog-items__brands">
                  <div class="title h3">
                    Популярные бренды:
                  </div>
                  <div class="brands-links">
                    <div class="brands-links__item">
                      <a href="#" class="brand-link"> <span class="brand-link__name">ADAM HALL</span> <span class="brand-link__count">(999)</span> </a>
                    </div>
                    <div class="brands-links__item">
                      <a href="#" class="brand-link"> <span class="brand-link__name">AKG</span> <span class="brand-link__count">(999)</span> </a>
                    </div>
                    <div class="brands-links__item">
                      <a href="#" class="brand-link"> <span class="brand-link__name">ALTO</span> <span class="brand-link__count">(999)</span> </a>
                    </div>
                    <div class="brands-links__item">
                      <a href="#" class="brand-link"> <span class="brand-link__name">AMPHENOL</span> <span class="brand-link__count">(999)</span> </a>
                    </div>
                    <div class="brands-links__item">
                      <a href="#" class="brand-link"> <span class="brand-link__name">AVID</span> <span class="brand-link__count">(999)</span> </a>
                    </div>
                    <div class="brands-links__item">
                      <a href="#" class="brand-link"> <span class="brand-link__name">BARCELONA</span> <span class="brand-link__count">(999)</span> </a>
                    </div>
                    <div class="brands-links__item">
                      <a href="#" class="brand-link"> <span class="brand-link__name">BEAUMONT</span> <span class="brand-link__count">(999)</span> </a>
                    </div>
                    <div class="brands-links__item">
                      <a href="#" class="brand-link"> <span class="brand-link__name">BEHRINGER</span> <span class="brand-link__count">(999)</span> </a>
                    </div>
                    <div class="brands-links__item">
                      <a href="#" class="brand-link"> <span class="brand-link__name">BOSE</span> <span class="brand-link__count">(999)</span> </a>
                    </div>
                    <div class="brands-links__item">
                      <a href="#" class="brand-link"> <span class="brand-link__name">BOSS</span> <span class="brand-link__count">(999)</span> </a>
                    </div>
                    <div class="brands-links__item">
                      <a href="#" class="brand-link"> <span class="brand-link__name">BSS</span> <span class="brand-link__count">(999)</span> </a>
                    </div>
                    <div class="brands-links__item">
                      <a href="#" class="brand-link"> <span class="brand-link__name">CNB</span> <span class="brand-link__count">(999)</span> </a>
                    </div>
                    <div class="brands-links__item">
                      <a href="#" class="brand-link"> <span class="brand-link__name">CROWN</span> <span class="brand-link__count">(999)</span> </a>
                    </div>
                    <div class="brands-links__item">
                      <a href="#" class="brand-link"> <span class="brand-link__name">D'ADDARIO</span> <span class="brand-link__count">(999)</span> </a>
                    </div>
                    <div class="brands-links__item">
                      <a href="#" class="brand-link"> <span class="brand-link__name">DASLIGHT</span> <span class="brand-link__count">(999)</span> </a>
                    </div>
                    <div class="brands-links__item">
                      <a href="#" class="brand-link"> <span class="brand-link__name">dbx</span> <span class="brand-link__count">(999)</span> </a>
                    </div>
                    <div class="brands-links__item">
                      <a href="#" class="brand-link"> <span class="brand-link__name">DDRUM</span> <span class="brand-link__count">(999)</span> </a>
                    </div>
                    <div class="brands-links__item">
                      <a href="#" class="brand-link"> <span class="brand-link__name">DEAN</span> <span class="brand-link__count">(999)</span> </a>
                    </div>
                    <div class="brands-links__item">
                      <a href="#" class="brand-link"> <span class="brand-link__name">DEAN MARKLEY</span> <span class="brand-link__count">(999)</span> </a>
                    </div>
                    <div class="brands-links__item">
                      <a href="#" class="brand-link"> <span class="brand-link__name">DIAGO</span> <span class="brand-link__count">(999)</span> </a>
                    </div>
                    <div class="brands-links__item">
                      <a href="#" class="brand-link"> <span class="brand-link__name">DIE HARD</span> <span class="brand-link__count">(999)</span> </a>
                    </div>
                    <div class="brands-links__item">
                      <a href="#" class="brand-link"> <span class="brand-link__name">DIGITECH</span> <span class="brand-link__count">(999)</span> </a>
                    </div>
                    <div class="brands-links__item">
                      <a href="#" class="brand-link"> <span class="brand-link__name">DR. PARTS</span> <span class="brand-link__count">(999)</span> </a>
                    </div>
                    <div class="brands-links__item">
                      <a href="#" class="brand-link"> <span class="brand-link__name">EIGHTEEN SOUND</span> <span class="brand-link__count">(999)</span> </a>
                    </div>
                    <div class="brands-links__item">
                      <a href="#" class="brand-link"> <span class="brand-link__name">ES-ACOUSTIC</span> <span class="brand-link__count">(999)</span> </a>
                    </div>
                    <div class="brands-links__item">
                      <a href="#" class="brand-link"> <span class="brand-link__name">EVANS</span> <span class="brand-link__count">(999)</span> </a>
                    </div>
                    <div class="brands-links__item">
                      <a href="#" class="brand-link"> <span class="brand-link__name">FBT</span> <span class="brand-link__count">(999)</span> </a>
                    </div>
                    <div class="brands-links__item">
                      <a href="#" class="brand-link"> <span class="brand-link__name">GATOR</span> <span class="brand-link__count">(999)</span> </a>
                    </div>
                    <div class="brands-links__item">
                      <a href="#" class="brand-link"> <span class="brand-link__name">GE</span> <span class="brand-link__count">(999)</span> </a>
                    </div>
                    <div class="brands-links__item">
                      <a href="#" class="brand-link"> <span class="brand-link__name">GMC</span> <span class="brand-link__count">(999)</span> </a>
                    </div>
                    <div class="brands-links__item">
                      <a href="#" class="brand-link"> <span class="brand-link__name">GREG BENNETT</span> <span class="brand-link__count">(999)</span> </a>
                    </div>
                    <div class="brands-links__item">
                      <a href="#" class="brand-link"> <span class="brand-link__name">GYPSY ROSE</span> <span class="brand-link__count">(999)</span> </a>
                    </div>
                    <div class="brands-links__item">
                      <a href="#" class="brand-link"> <span class="brand-link__name">IMLIGHT</span> <span class="brand-link__count">(999)</span> </a>
                    </div>
                    <div class="brands-links__item">
                      <a href="#" class="brand-link"> <span class="brand-link__name">INTER-M</span> <span class="brand-link__count">(999)</span> </a>
                    </div>
                    <div class="brands-links__item">
                      <a href="#" class="brand-link"> <span class="brand-link__name">INVASION</span> <span class="brand-link__count">(999)</span> </a>
                    </div>
                    <div class="brands-links__item">
                      <a href="#" class="brand-link"> <span class="brand-link__name">INVOLIGHT</span> <span class="brand-link__count">(999)</span> </a>
                    </div>
                    <div class="brands-links__item">
                      <a href="#" class="brand-link"> <span class="brand-link__name">INVOTONE</span> <span class="brand-link__count">(999)</span> </a>
                    </div>
                    <div class="brands-links__item">
                      <a href="#" class="brand-link"> <span class="brand-link__name">JBL</span> <span class="brand-link__count">(999)</span> </a>
                    </div>
                    <div class="brands-links__item">
                      <a href="#" class="brand-link"> <span class="brand-link__name">JEM</span> <span class="brand-link__count">(999)</span> </a>
                    </div>
                    <div class="brands-links__item">
                      <a href="#" class="brand-link"> <span class="brand-link__name">KLARK TEKNIK</span> <span class="brand-link__count">(999)</span> </a>
                    </div>
                    <div class="brands-links__item">
                      <a href="#" class="brand-link"> <span class="brand-link__name">KV2AUDIO</span> <span class="brand-link__count">(999)</span> </a>
                    </div>
                    <div class="brands-links__item">
                      <a href="#" class="brand-link"> <span class="brand-link__name">LEWITT</span> <span class="brand-link__count">(999)</span> </a>
                    </div>
                    <div class="brands-links__item">
                      <a href="#" class="brand-link"> <span class="brand-link__name">LEXICON</span> <span class="brand-link__count">(999)</span> </a>
                    </div>
                    <div class="brands-links__item">
                      <a href="#" class="brand-link"> <span class="brand-link__name">LUNA</span> <span class="brand-link__count">(999)</span> </a>
                    </div>
                    <div class="brands-links__item">
                      <a href="#" class="brand-link"> <span class="brand-link__name">MADRIX</span> <span class="brand-link__count">(999)</span> </a>
                    </div>
                    <div class="brands-links__item">
                      <a href="#" class="brand-link"> <span class="brand-link__name">MARTIN PRO</span> <span class="brand-link__count">(999)</span>
                      <div class="brands-links__item">
                        <a href="#" class="brand-link"> <span class="brand-link__name">MIDAS</span> <span class="brand-link__count">(999)</span> </a>
                      </div>
                      <div class="brands-links__item">
                        <a href="#" class="brand-link"> <span class="brand-link__name">MIGHTY BRIGHT</span> <span class="brand-link__count">(999)</span> </a>
                      </div>
                      <div class="brands-links__item">
                        <a href="#" class="brand-link"> <span class="brand-link__name">NEUMANN</span> <span class="brand-link__count">(999)</span> </a>
                      </div>
                      <div class="brands-links__item">
                        <a href="#" class="brand-link"> <span class="brand-link__name">NEUTRIK</span> <span class="brand-link__count">(999)</span> </a>
                      </div>
                      <div class="brands-links__item">
                        <a href="#" class="brand-link"> <span class="brand-link__name">NUMARK</span> <span class="brand-link__count">(999)</span> </a>
                      </div>
                      <div class="brands-links__item">
                        <a href="#" class="brand-link"> <span class="brand-link__name">ONSTAGE</span> <span class="brand-link__count">(999)</span> </a>
                      </div>
                      <div class="brands-links__item">
                        <a href="#" class="brand-link"> <span class="brand-link__name">OSRAM</span> <span class="brand-link__count">(999)</span> </a>
                      </div>
                      <div class="brands-links__item">
                        <a href="#" class="brand-link"> <span class="brand-link__name">PERRI'S</span> <span class="brand-link__count">(999)</span> </a>
                      </div>
                      <div class="brands-links__item">
                        <a href="#" class="brand-link"> <span class="brand-link__name">PHILIPS</span> <span class="brand-link__count">(999)</span> </a>
                      </div>
                      <div class="brands-links__item">
                        <a href="#" class="brand-link"> <span class="brand-link__name">PIONEER</span> <span class="brand-link__count">(999)</span> </a>
                      </div>
                      <div class="brands-links__item">
                        <a href="#" class="brand-link"> <span class="brand-link__name">PLANET WAVES</span> <span class="brand-link__count">(999)</span> </a>
                      </div>
                      <div class="brands-links__item">
                        <a href="#" class="brand-link"> <span class="brand-link__name">PLATINUM</span> <span class="brand-link__count">(999)</span> </a>
                      </div>
                      <div class="brands-links__item">
                        <a href="#" class="brand-link"> <span class="brand-link__name">POWERSOFT</span> <span class="brand-link__count">(999)</span> </a>
                      </div>
                      <div class="brands-links__item">
                        <a href="#" class="brand-link"> <span class="brand-link__name">PROEL</span> <span class="brand-link__count">(999)</span> </a>
                      </div>
                      <div class="brands-links__item">
                        <a href="#" class="brand-link"> <span class="brand-link__name">PRO-MARK</span> <span class="brand-link__count">(999)</span> </a>
                      </div>
                      <div class="brands-links__item">
                        <a href="#" class="brand-link"> <span class="brand-link__name">RICO</span> <span class="brand-link__count">(999)</span> </a>
                      </div>
                      <div class="brands-links__item">
                        <a href="#" class="brand-link"> <span class="brand-link__name">ROLAND</span> <span class="brand-link__count">(999)</span> </a>
                      </div>
                      <div class="brands-links__item">
                        <a href="#" class="brand-link"> <span class="brand-link__name">RUSH</span> <span class="brand-link__count">(999)</span> </a>
                      </div>
                      <div class="brands-links__item">
                        <a href="#" class="brand-link"> <span class="brand-link__name">SAMICK</span> <span class="brand-link__count">(999)</span> </a>
                      </div>
                      <div class="brands-links__item">
                        <a href="#" class="brand-link"> <span class="brand-link__name">SAMICK JTR</span> <span class="brand-link__count">(999)</span> </a>
                      </div>
                      <div class="brands-links__item">
                        <a href="#" class="brand-link"> <span class="brand-link__name">SCHECTER</span> <span class="brand-link__count">(999)</span> </a>
                      </div>
                      <div class="brands-links__item">
                        <a href="#" class="brand-link"> <span class="brand-link__name">SENNHEISER</span> <span class="brand-link__count">(999)</span> </a>
                      </div>
                      <div class="brands-links__item">
                        <a href="#" class="brand-link"> <span class="brand-link__name">SHOW</span> <span class="brand-link__count">(999)</span> </a>
                      </div>
                      <div class="brands-links__item">
                        <a href="#" class="brand-link"> <span class="brand-link__name">SHURE</span> <span class="brand-link__count">(999)</span> </a>
                      </div>
                      <div class="brands-links__item">
                        <a href="#" class="brand-link"> <span class="brand-link__name">SIERRA</span> <span class="brand-link__count">(999)</span> </a>
                      </div>
                      <div class="brands-links__item">
                        <a href="#" class="brand-link"> <span class="brand-link__name">SOUNDCRAFT</span> <span class="brand-link__count">(999)</span> </a>
                      </div>
                      <div class="brands-links__item">
                        <a href="#" class="brand-link"> <span class="brand-link__name">STEINBERG</span> <span class="brand-link__count">(999)</span> </a>
                      </div>
                      <div class="brands-links__item">
                        <a href="#" class="brand-link"> <span class="brand-link__name">SUNLITE</span> <span class="brand-link__count">(999)</span> </a>
                      </div>
                      <div class="brands-links__item">
                        <a href="#" class="brand-link"> <span class="brand-link__name">SX</span> <span class="brand-link__count">(999)</span> </a>
                      </div>
                      <div class="brands-links__item">
                        <a href="#" class="brand-link"> <span class="brand-link__name">SYLVANIA</span> <span class="brand-link__count">(999)</span> </a>
                      </div>
                      <div class="brands-links__item">
                        <a href="#" class="brand-link"> <span class="brand-link__name">TAMBURO</span> <span class="brand-link__count">(999)</span> </a>
                      </div>
                      <div class="brands-links__item">
                        <a href="#" class="brand-link"> <span class="brand-link__name">TC ELECTRONIC</span> <span class="brand-link__count">(999)</span> </a>
                      </div>
                      <div class="brands-links__item">
                        <a href="#" class="brand-link"> <span class="brand-link__name">TEMPO</span> <span class="brand-link__count">(999)</span> </a>
                      </div>
                      <div class="brands-links__item">
                        <a href="#" class="brand-link"> <span class="brand-link__name">TURBOSOUND</span> <span class="brand-link__count">(999)</span> </a>
                      </div>
                      <div class="brands-links__item">
                        <a href="#" class="brand-link"> <span class="brand-link__name">VALENCIA</span> <span class="brand-link__count">(999)</span> </a>
                      </div>
                      <div class="brands-links__item">
                        <a href="#" class="brand-link"> <span class="brand-link__name">WAVES</span> <span class="brand-link__count">(999)</span> </a>
                      </div>
                      <div class="brands-links__item">
                        <a href="#" class="brand-link"> <span class="brand-link__name">WIKI</span> <span class="brand-link__count">(999)</span> </a>
                      </div>
                      <div class="brands-links__item">
                        <a href="#" class="brand-link"> <span class="brand-link__name">YAMAHA</span> <span class="brand-link__count">(999)</span> </a>
                      </div>
                    </div>
                  </div>
                </div>
            </main>
          </div>
        </div>
      </div>
      <section class="subscribe">
        <div class="l-wrapper">
          <form autocomplete="off" class="subscribe__inn">
            <div class="subscribe__label">
              500 рублей за подписку на распродажи и акции
            </div>
            <div class="subscribe__input">
              <input class="input" placeholder="Введите Ваш e-mail" type="email">
            </div>
            <div class="subscribe__btn">
              <button type="submit" class="btn btn--inline btn--dark">
                Подписаться
              </button>
            </div>
          </form>
        </div>
      </section>
	~~include file="tpl/footer.tpl"~
    </div>
    <script type="text/javascript" src="assets/js/libs.js?1508105303"></script>
    <script type="text/javascript" src="assets/js/lightGallery/js/lightgallery.min.js?1508105303"></script>
    <script type="text/javascript" src="assets/js/lightGallery/modules/lg-thumbnail.js?1508105303"></script>
    <script type="text/javascript" src="assets/js/item-count.js?1508105303"></script>
    <script type="text/javascript" src="assets/js/tabs.js?1508105303"></script>
    <script type="text/javascript" src="assets/js/toggle.js?1508105303"></script>
    <script type="text/javascript" src="assets/js/map.js?1508105303"></script>
    <script type="text/javascript" src="assets/js/helpers.js?1508105303"></script>
    <script type="text/javascript" src="assets/js/404.js?1508105303"></script>
    <script type="text/javascript" src="assets/js/app.js?1508105303"></script>

  </body>

</html>