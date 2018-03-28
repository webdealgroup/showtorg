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
<div class="m-nav js-m-nav">
    <div class="m-nav__group">
        <a href="#login" class="m-nav__link m-nav__link--icon"> <i  class="ticon ticon-user "></i> Авторизация </a>
    </div>
    <div class="m-nav__group">
        <a href="#" class="m-nav__link m-nav__location js-location-select-toggle"> <span>Город:</span> Москва </a>
    </div>
    <div class="m-nav__group">
        <div class="m-nav__gender">
            <div class="m-nav__gender-cell">
                <a href="#" class="m-nav__gender-link is-active"> <i  class="ticon ticon-man "></i> Мужчинам</a>
            </div>
            <div class="m-nav__gender-cell">
                <a href="#" class="m-nav__gender-link"> <i  class="ticon ticon-woman "></i> Женщинам</a>
            </div>
        </div>
        <div class="m-nav__catalog">
            <div class="m-catalog js-m-catalog">
                <ul class="m-catalog__list">
                    <li class="m-catalog__item m-catalog__item--has-sub">
                        <a data-id="1" href="#" class="m-catalog__link m-catalog__link--icon js-m-catalog-link">
                            <div class="m-catalog__link-icon">
                                <svg class="icon icon-bag-1">
                                    <use xmlns:xlink="http://www.w3.org/1999/xlink" xlink:href="assets/img/sprite.svg#icon-bag-1"></use>
                                </svg>
                            </div> Звуковое оборудование </a>
                    </li>
                    <li class="m-catalog__item m-catalog__item--has-sub">
                        <a data-id="2" href="#" class="m-catalog__link m-catalog__link--icon js-m-catalog-link">
                            <div class="m-catalog__link-icon">
                                <svg class="icon icon-watch">
                                    <use xmlns:xlink="http://www.w3.org/1999/xlink" xlink:href="assets/img/sprite.svg#icon-watch"></use>
                                </svg>
                            </div> Часы </a>
                    </li>
                    <li class="m-catalog__item m-catalog__item--has-sub">
                        <a data-id="3" href="#" class="m-catalog__link m-catalog__link--icon js-m-catalog-link">
                            <div class="m-catalog__link-icon">
                                <svg class="icon icon-perfume">
                                    <use xmlns:xlink="http://www.w3.org/1999/xlink" xlink:href="assets/img/sprite.svg#icon-perfume"></use>
                                </svg>
                            </div> Парфюмерия </a>
                    </li>
                    <li class="m-catalog__item m-catalog__item--has-sub">
                        <a data-id="4" href="#" class="m-catalog__link m-catalog__link--icon js-m-catalog-link">
                            <div class="m-catalog__link-icon">
                                <svg class="icon icon-belt">
                                    <use xmlns:xlink="http://www.w3.org/1999/xlink" xlink:href="assets/img/sprite.svg#icon-belt"></use>
                                </svg>
                            </div> Ремни </a>
                    </li>
                    <li class="m-catalog__item m-catalog__item--has-sub">
                        <a data-id="5" href="#" class="m-catalog__link m-catalog__link--icon js-m-catalog-link">
                            <div class="m-catalog__link-icon">
                                <svg class="icon icon-purse">
                                    <use xmlns:xlink="http://www.w3.org/1999/xlink" xlink:href="assets/img/sprite.svg#icon-purse"></use>
                                </svg>
                            </div> Кошельки </a>
                    </li>
                    <li class="m-catalog__item m-catalog__item--has-sub">
                        <a data-id="6" href="#" class="m-catalog__link m-catalog__link--icon js-m-catalog-link">
                            <div class="m-catalog__link-icon">
                                <svg class="icon icon-glasses">
                                    <use xmlns:xlink="http://www.w3.org/1999/xlink" xlink:href="assets/img/sprite.svg#icon-glasses"></use>
                                </svg>
                            </div> Очки </a>
                    </li>
                    <li class="m-catalog__item m-catalog__item--has-sub">
                        <a data-id="7" href="#" class="m-catalog__link m-catalog__link--icon js-m-catalog-link">
                            <div class="m-catalog__link-icon">
                                <svg class="icon icon-suitcase">
                                    <use xmlns:xlink="http://www.w3.org/1999/xlink" xlink:href="assets/img/sprite.svg#icon-suitcase"></use>
                                </svg>
                            </div> Чемоданы </a>
                    </li>
                    <li class="m-catalog__item m-catalog__item--has-sub">
                        <a data-id="8" href="#" class="m-catalog__link m-catalog__link--icon js-m-catalog-link">
                            <div class="m-catalog__link-icon">
                                <svg class="icon icon-backpack">
                                    <use xmlns:xlink="http://www.w3.org/1999/xlink" xlink:href="assets/img/sprite.svg#icon-backpack"></use>
                                </svg>
                            </div> Рюкзаки </a>
                    </li>
                    <li class="m-catalog__item m-catalog__item--has-sub">
                        <a data-id="9" href="#" class="m-catalog__link m-catalog__link--icon js-m-catalog-link">
                            <div class="m-catalog__link-icon">
                                <svg class="icon icon-pen">
                                    <use xmlns:xlink="http://www.w3.org/1999/xlink" xlink:href="assets/img/sprite.svg#icon-pen"></use>
                                </svg>
                            </div> Ручки </a>
                    </li>
                    <li class="m-catalog__item m-catalog__item--has-sub">
                        <a data-id="10" href="#" class="m-catalog__link m-catalog__link--icon js-m-catalog-link">
                            <div class="m-catalog__link-icon">
                                <svg class="icon icon-hanger">
                                    <use xmlns:xlink="http://www.w3.org/1999/xlink" xlink:href="assets/img/sprite.svg#icon-hanger"></use>
                                </svg>
                            </div> Другой товар </a>
                    </li>
                </ul>
            </div>
        </div>
    </div>
    <div class="m-nav__group">
        <a href="#" class="m-nav__link">Отслеживание заказа</a>
    </div>
    <div class="m-nav__group">
        <a href="#" class="m-nav__link">Товар дня</a>
    </div>
    <div class="m-nav__group">
        <a href="#" class="m-nav__link">Бесплатная доставка</a>
    </div>
    <div class="m-nav__group">
        <a href="#" class="m-nav__link">Онлайн чат</a>
    </div>
    <div class="m-nav__group">
        <a href="#" class="m-nav__phone">+7 495 104 70 03 (9:00 - 21:00)</a>
    </div>
    <div class="m-nav__group">
        <a href="#" class="m-nav__phone">
            <svg  class="icon icon-whatsapp">
                <use xmlns:xlink="http://www.w3.org/1999/xlink" xlink:href="assets/img/sprite.svg#icon-whatsapp"></use>
            </svg>
            <svg  class="icon icon-telegram">
                <use xmlns:xlink="http://www.w3.org/1999/xlink" xlink:href="assets/img/sprite.svg#icon-telegram"></use>
            </svg> 8 968 777 666 2 </a>
    </div>
</div>
<div class="location-select js-location-select">
    <div class="l-wrapper">
        <div class="location-select__inn">
            <div class="location-select__header js-location-header">
                <div class="title h1">
                    Выберите ваш город
                </div>
                <div class="location-select__search">
                    <form autocomplete="off" class="search">
                        <input type="text" class="search__input" placeholder="Введите область, регион или населенный пункт">
                    </form>
                </div>
                <a href="#" class="location-select__close close-btn js-location-close">Закрыть</a>
            </div>
            <div class="location-select__block js-custom-scroll js-location-list">
                <div class="location-select__cells">
                    <ul class="location-select__list">
                        <li>
                            <a class="location-select__link location-select__link--bold" href="#">Москва</a>
                        </li>
                        <li>
                            <a class="location-select__link location-select__link--bold" href="#">Санкт-Петербург</a>
                        </li>
                        <li>
                            <a class="location-select__link location-select__link--bold" href="#">Омск</a>
                        </li>
                        <li>
                            <a class="location-select__link location-select__link--bold" href="#">Новосибирск</a>
                        </li>
                        <li>
                            <a class="location-select__link location-select__link--bold" href="#">Красноярск</a>
                        </li>
                        <li>
                            <a class="location-select__link location-select__link--bold" href="#">Ярославль</a>
                        </li>
                        <li>
                            <a class="location-select__link location-select__link--bold" href="#">Тула</a>
                        </li>
                        <li>
                            <a class="location-select__link location-select__link--bold" href="#">Брянск</a>
                        </li>
                        <li>
                            <a class="location-select__link location-select__link--bold" href="#">Екатеринбург</a>
                        </li>
                        <li>
                            <a class="location-select__link location-select__link--bold" href="#">Челябинск</a>
                        </li>
                        <li>
                            <a class="location-select__link location-select__link--bold" href="#">Нижний Новгород</a>
                        </li>
                        <li>
                            <a class="location-select__link location-select__link--bold" href="#">Краснодар</a>
                        </li>
                        <li>
                            <a class="location-select__link location-select__link--bold" href="#">Ростов-на-Дону</a>
                        </li>
                        <li>
                            <a class="location-select__link location-select__link--bold" href="#">Владивосток</a>
                        </li>
                        <li>
                            <a class="location-select__link location-select__link--bold" href="#">Железногорск</a>
                        </li>
                        <li>
                            <a class="location-select__link location-select__link--bold" href="#">Казань</a>
                        </li>
                        <li>
                            <a class="location-select__link location-select__link--bold" href="#">Сочи</a>
                        </li>
                    </ul>
                    <ul class="location-select__list">
                        <li class="location-select__char">
                            А
                        </li>
                        <li>
                            <a class="location-select__link" href="#">Абакан</a>
                        </li>
                        <li>
                            <a class="location-select__link" href="#">Азов</a>
                        </li>
                        <li>
                            <a class="location-select__link" href="#">Александров</a>
                        </li>
                        <li>
                            <a class="location-select__link" href="#">Алексин</a>
                        </li>
                        <li>
                            <a class="location-select__link" href="#">Альметьевск</a>
                        </li>
                        <li>
                            <a class="location-select__link" href="#">Анапа</a>
                        </li>
                        <li>
                            <a class="location-select__link" href="#">Ангарск</a>
                        </li>
                        <li>
                            <a class="location-select__link" href="#">Анжеро-Судженск</a>
                        </li>
                        <li>
                            <a class="location-select__link" href="#">Апатиты</a>
                        </li>
                        <li>
                            <a class="location-select__link" href="#">Арзамас</a>
                        </li>
                        <li>
                            <a class="location-select__link" href="#">Армавир</a>
                        </li>
                        <li>
                            <a class="location-select__link" href="#">Арсеньев</a>
                        </li>
                        <li>
                            <a class="location-select__link" href="#">Артем</a>
                        </li>
                        <li>
                            <a class="location-select__link" href="#">Архангельск</a>
                        </li>
                        <li>
                            <a class="location-select__link" href="#">Асбест</a>
                        </li>
                        <li>
                            <a class="location-select__link" href="#">Астрахань</a>
                        </li>
                        <li>
                            <a class="location-select__link" href="#">Ачинск</a>
                        </li>
                    </ul>
                    <ul class="location-select__list">
                        <li class="location-select__char">
                            Б
                        </li>
                        <li>
                            <a class="location-select__link" href="#">Балаково</a>
                        </li>
                        <li>
                            <a class="location-select__link" href="#">Балахна</a>
                        </li>
                        <li>
                            <a class="location-select__link" href="#">Балашиха</a>
                        </li>
                        <li>
                            <a class="location-select__link" href="#">Балашов</a>
                        </li>
                        <li>
                            <a class="location-select__link" href="#">Барнаул</a>
                        </li>
                        <li>
                            <a class="location-select__link" href="#">Батайск</a>
                        </li>
                        <li>
                            <a class="location-select__link" href="#">Белгород</a>
                        </li>
                        <li>
                            <a class="location-select__link" href="#">Белебей</a>
                        </li>
                        <li>
                            <a class="location-select__link" href="#">Белово</a>
                        </li>
                        <li>
                            <a class="location-select__link" href="#">Белогорск (Амурская область)</a>
                        </li>
                        <li>
                            <a class="location-select__link" href="#">Белорецк</a>
                        </li>
                        <li>
                            <a class="location-select__link" href="#">Белореченск</a>
                        </li>
                        <li>
                            <a class="location-select__link" href="#">Бердск</a>
                        </li>
                        <li>
                            <a class="location-select__link" href="#">Березники</a>
                        </li>
                        <li>
                            <a class="location-select__link" href="#">Березовский (Свердловская область)</a>
                        </li>
                        <li>
                            <a class="location-select__link" href="#">Бийск</a>
                        </li>
                        <li>
                            <a class="location-select__link" href="#">Биробиджан</a>
                        </li>
                        <li>
                            <a class="location-select__link" href="#">Благовещенск (Амурская область)</a>
                        </li>
                        <li>
                            <a class="location-select__link" href="#">Бор</a>
                        </li>
                        <li>
                            <a class="location-select__link" href="#">Борисоглебск</a>
                        </li>
                        <li>
                            <a class="location-select__link" href="#">Боровичи</a>
                        </li>
                        <li>
                            <a class="location-select__link" href="#">Братск</a>
                        </li>
                        <li>
                            <a class="location-select__link" href="#">Брянск</a>
                        </li>
                        <li>
                            <a class="location-select__link" href="#">Бугульма</a>
                        </li>
                        <li>
                            <a class="location-select__link" href="#">Буденновск</a>
                        </li>
                        <li>
                            <a class="location-select__link" href="#">Бузулук</a>
                        </li>
                        <li>
                            <a class="location-select__link" href="#">Буйнакск</a>
                        </li>
                    </ul>
                    <ul class="location-select__list">
                        <li class="location-select__char">
                            В
                        </li>
                        <li>
                            <a href="#" class="location-select__link">Великие Луки</a>
                        </li>
                        <li>
                            <a href="#" class="location-select__link">Великий Новгород</a>
                        </li>
                        <li>
                            <a href="#" class="location-select__link">Верхняя Пышма</a>
                        </li>
                        <li>
                            <a href="#" class="location-select__link">Видное</a>
                        </li>
                        <li>
                            <a href="#" class="location-select__link">Владивосток</a>
                        </li>
                        <li>
                            <a href="#" class="location-select__link">Владикавказ</a>
                        </li>
                        <li>
                            <a href="#" class="location-select__link">Владимир</a>
                        </li>
                        <li>
                            <a href="#" class="location-select__link">Волгоград</a>
                        </li>
                        <li>
                            <a href="#" class="location-select__link">Волгодонск</a>
                        </li>
                        <li>
                            <a href="#" class="location-select__link">Волжск</a>
                        </li>
                        <li>
                            <a href="#" class="location-select__link">Волжский</a>
                        </li>
                        <li>
                            <a href="#" class="location-select__link">Вологда</a>
                        </li>
                        <li>
                            <a href="#" class="location-select__link">Вольск</a>
                        </li>
                        <li>
                            <a href="#" class="location-select__link">Воркута</a>
                        </li>
                        <li>
                            <a href="#" class="location-select__link">Воронеж</a>
                        </li>
                        <li>
                            <a href="#" class="location-select__link">Воскресенск</a>
                        </li>
                        <li>
                            <a href="#" class="location-select__link">Воткинск</a>
                        </li>
                        <li>
                            <a href="#" class="location-select__link">Всеволожск</a>
                        </li>
                        <li>
                            <a href="#" class="location-select__link">Выборг</a>
                        </li>
                        <li>
                            <a href="#" class="location-select__link">Выкса</a>
                        </li>
                        <li>
                            <a href="#" class="location-select__link">Вязьма</a>
                        </li>
                    </ul>
                    <ul class="location-select__list">
                        <li class="location-select__char">
                            Г
                        </li>
                        <li>
                            <a href="#" class="location-select__link">Гатчина</a>
                        </li>
                        <li>
                            <a href="#" class="location-select__link">Геленджик</a>
                        </li>
                        <li>
                            <a href="#" class="location-select__link">Георгиевск</a>
                        </li>
                        <li>
                            <a href="#" class="location-select__link">Глазов</a>
                        </li>
                        <li>
                            <a href="#" class="location-select__link">Горно-Алтайск</a>
                        </li>
                        <li>
                            <a href="#" class="location-select__link">Грозный</a>
                        </li>
                        <li>
                            <a href="#" class="location-select__link">Губкин</a>
                        </li>
                        <li>
                            <a href="#" class="location-select__link">Гудермес</a>
                        </li>
                        <li>
                            <a href="#" class="location-select__link">Гуково</a>
                        </li>
                        <li>
                            <a href="#" class="location-select__link">Гусь-Хрустальный</a>
                        </li>
                    </ul>
                    <ul class="location-select__list">
                        <li class="location-select__char">
                            Д
                        </li>
                        <li>
                            <a href="#" class="location-select__link">Дербент</a>
                        </li>
                        <li>
                            <a href="#" class="location-select__link">Дзержинск</a>
                        </li>
                        <li>
                            <a href="#" class="location-select__link">Димитровград</a>
                        </li>
                        <li>
                            <a href="#" class="location-select__link">Дмитров</a>
                        </li>
                        <li>
                            <a href="#" class="location-select__link">Долгопрудный</a>
                        </li>
                        <li>
                            <a href="#" class="location-select__link">Домодедово</a>
                        </li>
                        <li>
                            <a href="#" class="location-select__link">Донской</a>
                        </li>
                        <li>
                            <a href="#" class="location-select__link">Дубна</a>
                        </li>
                    </ul>
                    <ul class="location-select__list">
                        <li class="location-select__char">
                            Е
                        </li>
                        <li>
                            <a href="#" class="location-select__link">Евпатория</a>
                        </li>
                        <li>
                            <a href="#" class="location-select__link">Егорьевск</a>
                        </li>
                        <li>
                            <a href="#" class="location-select__link">Ейск</a>
                        </li>
                        <li>
                            <a href="#" class="location-select__link">Екатеринбург</a>
                        </li>
                        <li>
                            <a href="#" class="location-select__link">Елабуга</a>
                        </li>
                        <li>
                            <a href="#" class="location-select__link">Елец</a>
                        </li>
                        <li>
                            <a href="#" class="location-select__link">Ессентуки</a>
                        </li>
                    </ul>
                    <ul class="location-select__list">
                        <li class="location-select__char">
                            Ж
                        </li>
                        <li>
                            <a href="#" class="location-select__link">Железногорск (Красноярский край)</a>
                        </li>
                        <li>
                            <a href="#" class="location-select__link">Железногорск (Курская область)</a>
                        </li>
                        <li>
                            <a href="#" class="location-select__link">Жигулевск</a>
                        </li>
                        <li>
                            <a href="#" class="location-select__link">Жуковский</a>
                        </li>
                    </ul>
                    <ul class="location-select__list">
                        <li class="location-select__char">
                            З
                        </li>
                        <li>
                            <a href="#" class="location-select__link">Заречный</a>
                        </li>
                        <li>
                            <a href="#" class="location-select__link">Зеленогорск</a>
                        </li>
                        <li>
                            <a href="#" class="location-select__link">Зеленодольск</a>
                        </li>
                        <li>
                            <a href="#" class="location-select__link">Златоуст</a>
                        </li>
                    </ul>
                    <ul class="location-select__list">
                        <li class="location-select__char">
                            И
                        </li>
                        <li>
                            <a href="#" class="location-select__link">Иваново</a>
                        </li>
                        <li>
                            <a href="#" class="location-select__link">Ивантеевка</a>
                        </li>
                        <li>
                            <a href="#" class="location-select__link">Ижевск</a>
                        </li>
                        <li>
                            <a href="#" class="location-select__link">Избербаш</a>
                        </li>
                        <li>
                            <a href="#" class="location-select__link">Иркутск</a>
                        </li>
                        <li>
                            <a href="#" class="location-select__link">Искитим</a>
                        </li>
                        <li>
                            <a href="#" class="location-select__link">Ишим</a>
                        </li>
                        <li>
                            <a href="#" class="location-select__link">Ишимбай</a>
                        </li>
                        <li>
                            <a href="#" class="location-select__link">Йошкар-Ола</a>
                        </li>
                    </ul>
                    <ul class="location-select__list">
                        <li class="location-select__char">
                            К
                        </li>
                        <li>
                            <a href="#" class="location-select__link">Казань</a>
                        </li>
                        <li>
                            <a href="#" class="location-select__link">Калининград</a>
                        </li>
                        <li>
                            <a href="#" class="location-select__link">Калуга</a>
                        </li>
                        <li>
                            <a href="#" class="location-select__link">Каменск-Уральский</a>
                        </li>
                        <li>
                            <a href="#" class="location-select__link">Каменск-Шахтинский</a>
                        </li>
                        <li>
                            <a href="#" class="location-select__link">Камышин</a>
                        </li>
                        <li>
                            <a href="#" class="location-select__link">Канск</a>
                        </li>
                        <li>
                            <a href="#" class="location-select__link">Каспийск</a>
                        </li>
                        <li>
                            <a href="#" class="location-select__link">Кемерово</a>
                        </li>
                        <li>
                            <a href="#" class="location-select__link">Керчь</a>
                        </li>
                        <li>
                            <a href="#" class="location-select__link">Кинешма</a>
                        </li>
                        <li>
                            <a href="#" class="location-select__link">Кириши</a>
                        </li>
                        <li>
                            <a href="#" class="location-select__link">Киров (Кировская область)</a>
                        </li>
                        <li>
                            <a href="#" class="location-select__link">Кирово-Чепецк</a>
                        </li>
                        <li>
                            <a href="#" class="location-select__link">Киселевск</a>
                        </li>
                        <li>
                            <a href="#" class="location-select__link">Кисловодск</a>
                        </li>
                        <li>
                            <a href="#" class="location-select__link">Клин</a>
                        </li>
                        <li>
                            <a href="#" class="location-select__link">Клинцы</a>
                        </li>
                        <li>
                            <a href="#" class="location-select__link">Ковров</a>
                        </li>
                        <li>
                            <a href="#" class="location-select__link">Когалым</a>
                        </li>
                        <li>
                            <a href="#" class="location-select__link">Коломна</a>
                        </li>
                        <li>
                            <a href="#" class="location-select__link">Комсомольск-на-Амуре</a>
                        </li>
                        <li>
                            <a href="#" class="location-select__link">Копейск</a>
                        </li>
                        <li>
                            <a href="#" class="location-select__link">Королев</a>
                        </li>
                        <li>
                            <a href="#" class="location-select__link">Кострома</a>
                        </li>
                        <li>
                            <a href="#" class="location-select__link">Котлас</a>
                        </li>
                        <li>
                            <a href="#" class="location-select__link">Красногорск</a>
                        </li>
                        <li>
                            <a href="#" class="location-select__link">Краснодар</a>
                        </li>
                        <li>
                            <a href="#" class="location-select__link">Краснокаменск</a>
                        </li>
                        <li>
                            <a href="#" class="location-select__link">Краснокамск</a>
                        </li>
                        <li>
                            <a href="#" class="location-select__link">Краснотурьинск</a>
                        </li>
                        <li>
                            <a href="#" class="location-select__link">Красноярск</a>
                        </li>
                        <li>
                            <a href="#" class="location-select__link">Кропоткин</a>
                        </li>
                        <li>
                            <a href="#" class="location-select__link">Крымск</a>
                        </li>
                        <li>
                            <a href="#" class="location-select__link">Кстово</a>
                        </li>
                        <li>
                            <a href="#" class="location-select__link">Кузнецк</a>
                        </li>
                        <li>
                            <a href="#" class="location-select__link">Кумертау</a>
                        </li>
                        <li>
                            <a href="#" class="location-select__link">Кунгур</a>
                        </li>
                        <li>
                            <a href="#" class="location-select__link">Курган</a>
                        </li>
                        <li>
                            <a href="#" class="location-select__link">Курск</a>
                        </li>
                        <li>
                            <a href="#" class="location-select__link">Кызыл</a>
                        </li>
                    </ul>
                    <ul class="location-select__list">
                        <li class="location-select__char">
                            Л
                        </li>
                        <li>
                            <a href="#" class="location-select__link">Лабинск</a>
                        </li>
                        <li>
                            <a href="#" class="location-select__link">Лениногорск</a>
                        </li>
                        <li>
                            <a href="#" class="location-select__link">Ленинск-Кузнецкий</a>
                        </li>
                        <li>
                            <a href="#" class="location-select__link">Лесосибирск</a>
                        </li>
                        <li>
                            <a href="#" class="location-select__link">Липецк</a>
                        </li>
                        <li>
                            <a href="#" class="location-select__link">Лиски</a>
                        </li>
                        <li>
                            <a href="#" class="location-select__link">Лобня</a>
                        </li>
                        <li>
                            <a href="#" class="location-select__link">Лысьва</a>
                        </li>
                        <li>
                            <a href="#" class="location-select__link">Лыткарино</a>
                        </li>
                        <li>
                            <a href="#" class="location-select__link">Люберцы</a>
                        </li>
                    </ul>
                    <ul class="location-select__list">
                        <li class="location-select__char">
                            М
                        </li>
                        <li>
                            <a href="#" class="location-select__link">Магадан</a>
                        </li>
                        <li>
                            <a href="#" class="location-select__link">Магнитогорск</a>
                        </li>
                        <li>
                            <a href="#" class="location-select__link">Майкоп</a>
                        </li>
                        <li>
                            <a href="#" class="location-select__link">Махачкала</a>
                        </li>
                        <li>
                            <a href="#" class="location-select__link">Междуреченск</a>
                        </li>
                        <li>
                            <a href="#" class="location-select__link">Мелеуз</a>
                        </li>
                        <li>
                            <a href="#" class="location-select__link">Миасс</a>
                        </li>
                        <li>
                            <a href="#" class="location-select__link">Минеральные Воды</a>
                        </li>
                        <li>
                            <a href="#" class="location-select__link">Минусинск</a>
                        </li>
                        <li>
                            <a href="#" class="location-select__link">Михайловка</a>
                        </li>
                        <li>
                            <a href="#" class="location-select__link">Михайловск (Ставропольский край)</a>
                        </li>
                        <li>
                            <a href="#" class="location-select__link">Мичуринск</a>
                        </li>
                        <li>
                            <a href="#" class="location-select__link">Москва</a>
                        </li>
                        <li>
                            <a href="#" class="location-select__link">Мурманск</a>
                        </li>
                        <li>
                            <a href="#" class="location-select__link">Муром</a>
                        </li>
                        <li>
                            <a href="#" class="location-select__link">Мытищи</a>
                        </li>
                    </ul>
                    <ul class="location-select__list">
                        <li class="location-select__char">
                            Н
                        </li>
                        <li>
                            <a href="#" class="location-select__link">Набережные Челны</a>
                        </li>
                        <li>
                            <a href="#" class="location-select__link">Назарово</a>
                        </li>
                        <li>
                            <a href="#" class="location-select__link">Назрань</a>
                        </li>
                        <li>
                            <a href="#" class="location-select__link">Нальчик</a>
                        </li>
                        <li>
                            <a href="#" class="location-select__link">Наро-Фоминск</a>
                        </li>
                        <li>
                            <a href="#" class="location-select__link">Находка</a>
                        </li>
                        <li>
                            <a href="#" class="location-select__link">Невинномысск</a>
                        </li>
                        <li>
                            <a href="#" class="location-select__link">Нерюнгри</a>
                        </li>
                        <li>
                            <a href="#" class="location-select__link">Нефтекамск</a>
                        </li>
                        <li>
                            <a href="#" class="location-select__link">Нефтеюганск</a>
                        </li>
                        <li>
                            <a href="#" class="location-select__link">Нижневартовск</a>
                        </li>
                        <li>
                            <a href="#" class="location-select__link">Нижнекамск</a>
                        </li>
                        <li>
                            <a href="#" class="location-select__link">Нижний Новгород</a>
                        </li>
                        <li>
                            <a href="#" class="location-select__link">Нижний Тагил</a>
                        </li>
                        <li>
                            <a href="#" class="location-select__link">Новоалтайск</a>
                        </li>
                        <li>
                            <a href="#" class="location-select__link">Новокузнецк</a>
                        </li>
                        <li>
                            <a href="#" class="location-select__link">Новокуйбышевск</a>
                        </li>
                        <li>
                            <a href="#" class="location-select__link">Новомосковск</a>
                        </li>
                        <li>
                            <a href="#" class="location-select__link">Новороссийск</a>
                        </li>
                        <li>
                            <a href="#" class="location-select__link">Новосибирск</a>
                        </li>
                        <li>
                            <a href="#" class="location-select__link">Новотроицк</a>
                        </li>
                        <li>
                            <a href="#" class="location-select__link">Новоуральск</a>
                        </li>
                        <li>
                            <a href="#" class="location-select__link">Новочебоксарск</a>
                        </li>
                        <li>
                            <a href="#" class="location-select__link">Новочеркасск</a>
                        </li>
                        <li>
                            <a href="#" class="location-select__link">Новошахтинск</a>
                        </li>
                        <li>
                            <a href="#" class="location-select__link">Новый Уренгой</a>
                        </li>
                        <li>
                            <a href="#" class="location-select__link">Ногинск</a>
                        </li>
                        <li>
                            <a href="#" class="location-select__link">Норильск</a>
                        </li>
                        <li>
                            <a href="#" class="location-select__link">Ноябрьск</a>
                        </li>
                        <li>
                            <a href="#" class="location-select__link">Нягань</a>
                        </li>
                    </ul>
                    <ul class="location-select__list">
                        <li class="location-select__char">
                            О
                        </li>
                        <li>
                            <a href="#" class="location-select__link">Обнинск</a>
                        </li>
                        <li>
                            <a href="#" class="location-select__link">Одинцово</a>
                        </li>
                        <li>
                            <a href="#" class="location-select__link">Озерск (Челябинская область)</a>
                        </li>
                        <li>
                            <a href="#" class="location-select__link">Октябрьский</a>
                        </li>
                        <li>
                            <a href="#" class="location-select__link">Омск</a>
                        </li>
                        <li>
                            <a href="#" class="location-select__link">Орел</a>
                        </li>
                        <li>
                            <a href="#" class="location-select__link">Оренбург</a>
                        </li>
                        <li>
                            <a href="#" class="location-select__link">Орехово-Зуево</a>
                        </li>
                        <li>
                            <a href="#" class="location-select__link">Орск</a>
                        </li>
                    </ul>
                    <ul class="location-select__list">
                        <li class="location-select__char">
                            П
                        </li>
                        <li>
                            <a href="#" class="location-select__link">Павлово</a>
                        </li>
                        <li>
                            <a href="#" class="location-select__link">Павловский Посад</a>
                        </li>
                        <li>
                            <a href="#" class="location-select__link">Пенза</a>
                        </li>
                        <li>
                            <a href="#" class="location-select__link">Первоуральск</a>
                        </li>
                        <li>
                            <a href="#" class="location-select__link">Пермь</a>
                        </li>
                        <li>
                            <a href="#" class="location-select__link">Петрозаводск</a>
                        </li>
                        <li>
                            <a href="#" class="location-select__link">Петропавловск-Камчатский</a>
                        </li>
                        <li>
                            <a href="#" class="location-select__link">Подольск</a>
                        </li>
                        <li>
                            <a href="#" class="location-select__link">Полевской</a>
                        </li>
                        <li>
                            <a href="#" class="location-select__link">Прокопьевск</a>
                        </li>
                        <li>
                            <a href="#" class="location-select__link">Прохладный</a>
                        </li>
                        <li>
                            <a href="#" class="location-select__link">Псков</a>
                        </li>
                        <li>
                            <a href="#" class="location-select__link">Пушкино</a>
                        </li>
                    </ul>
                </div>
            </div>
        </div>
    </div>
</div>
<div class="fast-view js-fast-view">
    <div class="fast-view__inn">
        <div class="fast-view__container">
            <a href="#" class="close-btn fast-view__close js-fast-view-close"><span>Закрыть</span></a>
            <div class="fast-view__block">
                <div class="fast-view__header">
                    <div class="fast-view__title">
                        <div class="title h2">
                            Стойка для комбоусилителей PROEL EL700
                        </div>
                    </div>
                    <div class="fast-view__soc">
                        <a data-toggle=".js-fast-view-soc" href="#" class="js-toggle"> <i  class="ticon ticon-share "></i> </a>
                        <ul class="soc-share js-fast-view-soc">
                            <li class="soc-share__item">
                                <a href="#" class="soc-share__link soc-share__link--fill soc-share__link--vk"><span>0</span></a>
                            </li>
                            <li class="soc-share__item">
                                <a href="#" class="soc-share__link soc-share__link--fill soc-share__link--fb"><span>234</span></a>
                            </li>
                            <li class="soc-share__item">
                                <a href="#" class="soc-share__link soc-share__link--fill soc-share__link--tw"><span>18</span></a>
                            </li>
                            <li class="soc-share__item">
                                <a href="#" class="soc-share__link soc-share__link--fill soc-share__link--inst"><span>385</span></a>
                            </li>
                        </ul>
                    </div>
                </div>
                <div class="fast-view__main">
                    <div class="fast-view__main-left">
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
                        <div class="fast-view__gallery">
                            <div data-size="big" data-theme="discount" title="Успей купить!" class="item-badge item-badge--discount js-tooltip"></div>
                            <div class="item-gallery">
                                <div class="item-gallery__carousel carousel">
                                    <div>
                                        <div class="swiper-container js-item-gallery">
                                            <div class="swiper-wrapper">
                                                <div class="swiper-slide"><img data-zoom-image="catalogue/images/1263_thumb.jpg" src="catalogue/images/1263_thumb.jpg">
                                                </div>
                                                <div class="swiper-slide"><img data-zoom-image="catalogue/images/nophoto_thumb.jpg" src="catalogue/images/nophoto_thumb.jpg">
                                                </div>
                                                <div class="swiper-slide"><img data-zoom-image="catalogue/images/nophoto_thumb.jpg" src="catalogue/images/nophoto_thumb.jpg">
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="item-gallery__thumbs">
                                    <div class="swiper-container js-item-gallery-thumbs">
                                        <div class="swiper-wrapper">
                                            <div class="swiper-slide"><img src="catalogue/images/1263_thumb.jpg">
                                            </div>
                                            <div class="swiper-slide"><img src="catalogue/images/nophoto_thumb.jpg">
                                            </div>
                                            <div class="swiper-slide"><img src="catalogue/images/nophoto_thumb.jpg">
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="fast-view__main-right">
                        <div class="item-meta">
                            <div class="item-meta__inn">
                                <div class="item-meta__group">
                                    <div class="item-meta__prices">
                                        <span class="price price--hot">5 316 р.</span><span class="price price--old">6 316 р.</span>
                                    </div>
                                    <div class="item-meta__actions">
                                        <div class="item-meta__actions-inn">
                                            <div class="item-meta__actions-cart">
                                                <a href="#" class="btn btn--vinous item-meta__cart"> <i  class="ticon ticon-cart "></i> Добавить в корзину</a>
                                            </div>
                                            <div class="item-meta__actions-fav">
                                                <a href="#" class="btn btn--icon btn--vinous btn--outline item-meta__fav"> <i  class="ticon ticon-favorite "></i> </a>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="item-meta__links">
                                        <div class="item-meta__links-inn">
                                            <div class="item-meta__links-click">
                                                <a href="#" class="link"><span>Оформить в 1 клик</span></a>
                                            </div>
                                            <div class="item-meta__links-delivery">
                                                <a href="#" class="link"> <i  class="ticon ticon-truck "></i> <span>Бесплатная доставка при 1 покупке</span></a>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="item-meta__sizes">
                                        <span class="item-meta__label">Размер</span>
                                        <div class="item-meta__sizes-inn">
                                            <div class="item-meta__sizes-action">
                                                <div class="size-switchers">
                                                    <div class="size-switchers__inn">
                                                        <label class="size-switchers__label">
                                                            <input type="radio" name="size" value="S">
                                                            <span class="size-switchers__item">S</span> </label><label class="size-switchers__label">
                                                            <input type="radio" name="size" value="M">
                                                            <span class="size-switchers__item">M</span> </label><label class="size-switchers__label">
                                                            <input type="radio" name="size" value="L">
                                                            <span class="size-switchers__item">L</span> </label><label class="size-switchers__label">
                                                            <input type="radio" name="size" value="X">
                                                            <span class="size-switchers__item">X</span> </label><label class="size-switchers__label">
                                                            <input type="radio" name="size" value="XL">
                                                            <span class="size-switchers__item">XL</span> </label>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="item-meta__sizes-help">
                                                <a class="link" href="#"><span>Таблица размеров</span></a>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="item-meta__group">
                                    <div class="item-meta__colors">
                                        <div class="item-meta__label">
                                            Цвет
                                        </div>
                                        <div class="color-switchers">
                                            <div class="color-switchers__inn">
                                                <label class="color-switchers__label">
                                                    <input type="radio" name="color" value="#ff343d">
                                                    <span style="background: #ff343d;" class="color-switchers__item">#ff343d</span> </label><label class="color-switchers__label">
                                                    <input type="radio" name="color" value="#1f1f1f">
                                                    <span style="background: #1f1f1f;" class="color-switchers__item">#1f1f1f</span> </label><label class="color-switchers__label">
                                                    <input type="radio" name="color" value="#444fdd">
                                                    <span style="background: #444fdd;" class="color-switchers__item">#444fdd</span> </label><label class="color-switchers__label">
                                                    <input type="radio" name="color" value="#eaeaea">
                                                    <span style="background: #eaeaea;" class="color-switchers__item">#eaeaea</span> </label>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="item-meta__group">
                                    <div class="desc-tabs js-tabs">
                                        <ul class="desc-tabs__menu">
                                            <li data-el="bar" class="desc-tabs__bar"></li>
                                            <li class="desc-tabs__item is-active">
                                                <a data-el="tab" href="#desc_tab_1" class="desc-tabs__link">Описание</a>
                                            </li>
                                            <li class="desc-tabs__item">
                                                <a data-el="tab" href="#desc_tab_2" class="desc-tabs__link">Характеристики</a>
                                            </li>
                                            <li class="desc-tabs__item">
                                                <a data-el="tab" href="#desc_tab_2" class="desc-tabs__link">Доставка</a>
                                            </li>
                                        </ul>
                                        <div class="desc-tabs__content">
                                            <div data-el="pane" id="desc_tab_1" class="desc-tabs__pane is-active">
                                                <div class="text">
                                                    <p>
                                                        PROEL EL700 Стойка для комбоусилителей
                                                    </p>
                                                </div>
                                            </div>
                                            <div data-el="pane" id="desc_tab_2" class="desc-tabs__pane">
                                                <div class="text">
                                                    <p>
                                                        Lorem ipsum dolor sit amet, consectetur adipisicing elit. Aut autem ea esse fugiat hic, minus recusandae repellat sequi sunt voluptas! Aperiam consequuntur deserunt dolores earum enim ex expedita harum molestiae natus quam
                                                        quo repellat sapiente, tempore vero voluptas. A architecto at aut delectus dignissimos distinctio earum, eius eum eveniet exercitationem expedita explicabo fuga iste libero minima molestias nisi odit perspiciatis quaerat
                                                        qui quia quidem recusandae tempora temporibus ut voluptatem voluptatum? Adipisci aliquid amet animi aspernatur consectetur cum cumque deleniti dicta eos et id, iure laudantium magnam mollitia nulla optio perspiciatis quaerat
                                                        sapiente soluta suscipit totam ut voluptatum? Ab adipisci aliquam aliquid assumenda atque autem commodi cumque dicta dolore dolores doloribus eaque error facilis, fuga hic ipsum minima nemo nihil odio officia omnis placeat
                                                        saepe sapiente, similique ullam voluptas voluptatibus voluptatum. Aspernatur consectetur, culpa deleniti doloribus earum eligendi impedit ipsam ipsum itaque, labore, modi nemo officia officiis optio possimus provident quo
                                                        quos rem sint suscipit unde veniam voluptates! Impedit nulla rem temporibus. Ab ad consectetur consequuntur corporis dicta, dolore doloremque eius, est exercitationem iste iure laudantium nobis optio, quia rerum saepe temporibus!
                                                        Adipisci, aliquam animi dolor ducimus earum eius eveniet facere natus odit officia pariatur placeat quos reiciendis reprehenderit sint veritatis.
                                                    </p>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="fast-view__related">
                    <div class="items">
                        <div class="items__header">
                            <div class="items__title">
                                <div class="title h2">
                                    Похожие товары
                                </div>
                            </div>
                        </div>
                        <div class="items__list">
                            <div class="items__cell">
                                <div class="item-grid  js-item  js-item-grid item-grid--simple">
                                    <div class="item-grid__inn">
                                        <div class="item-grid__photo">
                                            <a href="#"><img alt="PROEL KR08" class="item-grid__img js-item-main-img" src="catalogue/images/1384_thumb.jpg"></a>
                                        </div>
                                        <a href="#" class="item-grid__name">PROEL KR08</a>
                                        <div class="item-grid__category">
                                            Рэк
                                        </div>
                                        <div class="item-grid__actions">
                                            <div class="item-grid__actions-left">
                                                <span class="price">3 081 р.</span>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="items__cell">
                                <div class="item-grid  js-item  js-item-grid item-grid--simple">
                                    <div data-size="big" data-theme="discount" title="Успей купить!" class="item-badge item-badge--discount js-tooltip"></div>
                                    <div class="item-grid__inn">
                                        <div class="item-grid__photo">
                                            <a href="#"><img alt="PROEL KR08" class="item-grid__img js-item-main-img" src="catalogue/images/1384_thumb.jpg"></a>
                                        </div>
                                        <a href="#" class="item-grid__name">PROEL KR08</a>
                                        <div class="item-grid__category">
                                            Рэк
                                        </div>
                                        <div class="item-grid__actions">
                                            <div class="item-grid__actions-left">
                                                <span class="price price--hot">3 081 р.</span><span class="price price--old">46 900 р.</span>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="items__cell">
                                <div class="item-grid  js-item  js-item-grid item-grid--simple">
                                    <div class="item-grid__inn">
                                        <div class="item-grid__photo">
                                            <a href="#"><img alt="PROEL KR08" class="item-grid__img js-item-main-img" src="catalogue/images/1384_thumb.jpg"></a>
                                        </div>
                                        <a href="#" class="item-grid__name">PROEL KR08</a>
                                        <div class="item-grid__category">
                                            Рэк
                                        </div>
                                        <div class="item-grid__actions">
                                            <div class="item-grid__actions-left">
                                                <span class="price">3 081 р.</span>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="items__cell">
                                <div class="item-grid  js-item  js-item-grid item-grid--simple">
                                    <div data-size="big" data-theme="new" title="Новое поступление!" class="item-badge item-badge--new js-tooltip"></div>
                                    <div class="item-grid__inn">
                                        <div class="item-grid__photo">
                                            <a href="#"><img alt="PROEL KR08" class="item-grid__img js-item-main-img" src="catalogue/images/1384_thumb.jpg"></a>
                                        </div>
                                        <a href="#" class="item-grid__name">PROEL KR08</a>
                                        <div class="item-grid__category">
                                            Рэк
                                        </div>
                                        <div class="item-grid__actions">
                                            <div class="item-grid__actions-left">
                                                <span class="price">3 081 р.</span>
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
    <header class="header js-header">
        <div class="header__inn">
            <div class="topbar">
                <div class="l-wrapper">
                    <div class="topbar__inn">
                        <div class="topbar__location dropdown">
                            <a class="topbar__link topbar__link--dropdown js-dropdown-location js-dropdown-toggle" href="#"> <i  class="ticon ticon-location "></i> <span class="js-positioned">Москва</span></a>
                            <div class="dropdown__block location-dropdown">
                                <div class="location-dropdown__label">
                                    Вы действительно находитесь в г. Москва?
                                </div>
                                <div class="block-table block-table--fixed">
                                    <div>
                                        <a class="location-dropdown__link js-dropdown-close" href="#">Да, все верно</a>
                                    </div>
                                    <div class="text-right">
                                        <a class="location-dropdown__link js-location-select-toggle" href="#">Нет, сменить город</a>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="topbar__contacts">
                            <span class="topbar__phone">+7 495 104 70 03 (9:00 - 21:00)</span><a class="topbar__link topbar__link--dropdown" href="#"><span>Связаться с нами</span></a>
                        </div>
                        <div class="topbar__delivery">
                            <a class="topbar__link" href="#"> <i  class="ticon ticon-truck "></i> <span>Бесплатная доставка при первой покупке</span></a>
                        </div>
                        <div class="topbar__day-item">
                            <a class="topbar__link" href="#"> <i  class="ticon ticon-discount "></i> <span>Товар дня</span></a>
                        </div>
                        <div class="topbar__cabinet dropdown bonus">
                            <a class="topbar__link topbar__link--dropdown  js-dropdown-toggle  js-bonus-target" href="#"> <i  class="ticon ticon-user "></i> <span class="js-positioned">Мой кабинет</span></a>
                            <div class="bonus__block">
                                Дарим 500 руб. при регистрации <a href="#" class="bonus__close js-bonus-close">Закрыть</a>
                            </div>
                            <div class="dropdown__block cabinet-dropdown">
                                <div class="cabinet-dropdown__login">
                                    <a href="#login" class="cabinet-dropdown__login-btn btn btn--pink js-login-tab-toggle">Вход</a><a href="#login" class="cabinet-dropdown__link js-register-tab-toggle">Создать учетную запись</a>
                                </div>
                                <div class="cabinet-dropdown__search">
                                    <div class="cabinet-dropdown__search-label">
                                        Отследить заказ
                                    </div>
                                    <form autocomplete="off" class="search">
                                        <input type="search" class="search__input js-order-search" placeholder="Введите номер заказа">
                                    </form>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="header__wrapper">
                <div class="l-wrapper">
                    <div class="header__row">
                        <div class="header__nav-toggle">
                            <a href="#" class="hamburger hamburger--spin js-nav-toggle"><span>Каталог</span></a>
                        </div>
                        <div class="header__logo-mobile">
                            <a href=".">
                                <div class="logo logo--no-icon">
                                    <div class="logo__inn">
                                        <div class="logo__text"><img alt="adwall" src="assets/img/logo.png">
                                        </div>
                                    </div>
                                </div> </a>
                        </div>
                        <div class="header__logo">
                            <a href=".">
                                <div class="header__logo-default">
                                    <div class="logo ">
                                        <div class="logo__inn">

                                            <div class="logo__text"><img alt="adwall" src="assets/img/logo.png">
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="header__logo-small">
                                    <div class="logo logo--sm">
                                        <div class="logo__inn">

                                            <div class="logo__text"><img alt="adwall" src="assets/img/logo.png">
                                            </div>
                                        </div>
                                    </div>
                                </div> </a>
                        </div>

                        <div class="header__search js-search">
                            <form autocomplete="off" class="search">
                                <input type="text" class="search__input" placeholder="Поиск товара или бренда">
                                <button type="submit" class="search__submit"></button>
                                <a href="#" class="search__close js-search-close"></a>
                            </form>
                        </div>
                        <div class="header__btn header__srch">
                            <a class="js-search-toggle" href="#"> <i  class="ticon ticon-loupe "></i> </a>
                        </div>
                        <div class="header__btn header__favorite">
                            <a class="js-favs" href="#"> <i  class="ticon ticon-favorite-fill "></i> <span class="header__favorite-count">99</span> </a>
                        </div>
                        <div class="header__btn header__cart dropdown">
                            <a class="js-dropdown-toggle js-cart" href="#"> <i  class="ticon ticon-cart "></i> <span class="header__cart-count">39</span> </a>
                            <div class="dropdown__block cart-dropdown">
                                <div class="cart-dropdown__items">
                                    <div class="item-cart">
                                        <div class="item-cart__inn">
                                            <div class="item-cart__photo">
                                                <div class="item-cart__img">
                                                    <a href="#"><img src="assets/img/items/1.png"></a>
                                                </div>
                                            </div>
                                            <div class="item-cart__info">
                                                <a href="#" class="item-cart__name">David Jones</a><span class="item-cart__price price">9 000 р.</span>
                                            </div>
                                            <div class="item-cart__remove">
                                                <a href="#" class="remove-btn js-item-remove"><i></i></a>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="item-cart">
                                        <div class="item-cart__inn">
                                            <div class="item-cart__photo">
                                                <div class="item-cart__img">
                                                    <a href="#"><img src="assets/img/items/2.png"></a>
                                                </div>
                                            </div>
                                            <div class="item-cart__info">
                                                <a href="#" class="item-cart__name">Casio</a><span class="item-cart__price price">4 990 р.</span>
                                            </div>
                                            <div class="item-cart__remove">
                                                <a href="#" class="remove-btn js-item-remove"><i></i></a>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="item-cart">
                                        <div class="item-cart__inn">
                                            <div class="item-cart__photo">
                                                <div class="item-cart__img">
                                                    <a href="#"><img src="assets/img/items/3.png"></a>
                                                </div>
                                            </div>
                                            <div class="item-cart__info">
                                                <a href="#" class="item-cart__name">Salomon</a><span class="item-cart__price price">3 500 р.</span>
                                            </div>
                                            <div class="item-cart__remove">
                                                <a href="#" class="remove-btn js-item-remove"><i></i></a>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="cart-dropdown__footer">
                                    <div class="cart-dropdown__total">
                                        Итого: 9 999 р.
                                    </div>
                                    <a href="#" class="cart-dropdown__btn btn btn--pink">Перейти в корзину</a>
                                </div>
                            </div>
                        </div>
                        <div class="header__btn header__cabinet dropdown">
                            <a class="js-dropdown-toggle" href="#"> <i  class="ticon ticon-user "></i> </a>
                            <div class="dropdown__block cabinet-dropdown">
                                <div class="cabinet-dropdown__login">
                                    <a href="#login" class="cabinet-dropdown__login-btn btn btn--pink js-login-tab-toggle">Вход</a><a href="#login" class="cabinet-dropdown__link js-register-tab-toggle">Создать учетную запись</a>
                                </div>
                                <div class="cabinet-dropdown__search">
                                    <div class="cabinet-dropdown__search-label">
                                        Отследить заказ
                                    </div>
                                    <form autocomplete="off" class="search">
                                        <input type="search" class="search__input js-order-search" placeholder="Введите номер заказа">
                                    </form>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <nav class="nav js-nav">
                <div class="l-wrapper">
                    <div class="nav__bar js-nav-bar"></div>
                    <ul class="nav__list" style="text-align:left;">

                        ~~mod mod_name="menu_g" action=""~

                    </ul>
                </div>
            </nav>


        </div>
    </header>


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
    <div class="footer">
        <div class="footer__top">
            <div class="l-wrapper">
                <div class="footer__top-inn">
                    <div class="footer__top-left">
                        <div class="footer__copyright">
                            &copy; 2018, ООО "ШОУ ТОРГ"
                            <br>
                            Все права защищены
                        </div>
                        <div class="footer__soc">
                            <ul class="socials">
                                <li class="socials__item">
                                    <a href="#" class="social-round social-round--vk"></a>
                                </li>
                                <li class="socials__item">
                                    <a href="#" class="social-round social-round--fb"></a>
                                </li>
                                <li class="socials__item">
                                    <a href="#" class="social-round social-round--tw"></a>
                                </li>
                                <li class="socials__item">
                                    <a href="#" class="social-round social-round--insta"></a>
                                </li>
                                <li class="socials__item">
                                    <a href="#" class="social-round social-round--ok"></a>
                                </li>
                            </ul>
                        </div>
                        <div class="footer__phone">
                            <svg class="icon icon-whatsapp">
                                <use xmlns:xlink="http://www.w3.org/1999/xlink" xlink:href="assets/img/sprite.svg#icon-whatsapp"></use>
                            </svg>
                            <svg class="icon icon-telegram">
                                <use xmlns:xlink="http://www.w3.org/1999/xlink" xlink:href="assets/img/sprite.svg#icon-telegram"></use>
                            </svg>
                            <a href="tel:89687776662">8 968 777 666 2</a>
                        </div>
                    </div>
                    <div class="footer__top-right">
                        <div class="footer__categories">
                            <div class="footer__categories-cell">
                                <div class="footer__menu">
                                    <div class="footer__menu-title">
                                        Звуковое оборудование
                                    </div>
                                    <ul class="footer__menu-list">
                                        <li class="footer__menu-item">
                                            <a class="link" href="#">Акустические системы</a>
                                        </li>
                                        <li class="footer__menu-item">
                                            <a class="link" href="#">Корпус для акустической системы</a>
                                        </li>
                                        <li class="footer__menu-item">
                                            <a class="link" href="#">Динамики, драйверы, запчасти</a>
                                        </li>
                                        <li class="footer__menu-item">
                                            <a class="link" href="#">Комбо усилители</a>
                                        </li>
                                        <li class="footer__menu-item">
                                            <a class="link" href="#">Микшеры</a>
                                        </li>
                                        <li class="footer__menu-item">
                                            <a class="link" href="#">Обработка звука</a>
                                        </li>
                                        <li class="footer__menu-item">
                                            <a class="link" href="#">Усилители</a>
                                        </li>
                                        <li class="footer__menu-item">
                                            <a class="link" href="#">Портастудия</a>
                                        </li>
                                    </ul>
                                </div>
                            </div>
                            <div class="footer__categories-cell">
                                <div class="footer__menu">
                                    <div class="footer__menu-title">
                                        Световое оборудование
                                    </div>
                                    <ul class="footer__menu-list">
                                        <li class="footer__menu-item">
                                            <a class="link" href="#">Световые приборы</a>
                                        </li>
                                        <li class="footer__menu-item">
                                            <a class="link" href="#">DMX-пульты, контроллеры</a>
                                        </li>
                                        <li class="footer__menu-item">
                                            <a class="link" href="#">Генераторы дыма, снега, мыльных пузырей, конфетти</a>
                                        </li>
                                        <li class="footer__menu-item">
                                            <a class="link" href="#">Жидкости и конфетти для генераторов спецэффектов</a>
                                        </li>
                                        <li class="footer__menu-item">
                                            <a class="link" href="#">Крепежные элементы</a>
                                        </li>
                                        <li class="footer__menu-item">
                                            <a class="link" href="#">Фермы</a>
                                        </li>
                                        <li class="footer__menu-item">
                                            <a class="link" href="#">Шары зеркальные и моторы</a>
                                        </li>
                                        <li class="footer__menu-item">
                                            <a class="link" href="#">Лампы</a>
                                        </li>
                                    </ul>
                                </div>
                            </div>
                            <div class="footer__categories-cell">
                                <div class="footer__menu">
                                    <div class="footer__menu-title">
                                        Информация
                                    </div>
                                    <ul class="footer__menu-list">
                                        <li class="footer__menu-item">
                                            <a class="link" href="#">О компании</a>
                                        </li>
                                        <li class="footer__menu-item">
                                            <a class="link" href="#">Новинки</a>
                                        </li>
                                        <li class="footer__menu-item">
                                            <a class="link" href="#">Акции</a>
                                        </li>
                                        <li class="footer__menu-item">
                                            <a class="link" href="#">Сотрудничество</a>
                                        </li>
                                        <li class="footer__menu-item">
                                            <a class="link" href="#">Контакты</a>
                                        </li>
                                        <li class="footer__menu-item">
                                            <a class="link" href="#">Доставка и оплата</a>
                                        </li>
                                        <li class="footer__menu-item">
                                            <a class="link" href="#">Возврат и гарантия</a>
                                        </li>
                                        <li class="footer__menu-item">
                                            <a class="link" href="#">Оставить отзыв</a>
                                        </li>
                                    </ul>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="footer__bottom">
            <div class="l-wrapper">
                <div class="footer__bottom-inn">

                    <div class="footer__payments">
                        <div>
                            <i class="picon picon-maestro"></i>
                        </div>
                        <div>
                            <i class="picon picon-visa"></i>
                        </div>
                        <div>
                            <i class="picon picon-mastercard"></i>
                        </div>
                        <div>
                            <i class="picon picon-netpay"></i>
                        </div>
                        <div>
                            <i class="picon picon-paypal"></i>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
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