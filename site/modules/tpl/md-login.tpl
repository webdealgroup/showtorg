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