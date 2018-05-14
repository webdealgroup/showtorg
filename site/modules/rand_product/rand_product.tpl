                  ~~foreach from=$items item=i~

                  <div class="catalog-items__cell">
                    <div class="item-grid  js-item  js-item-grid ">
                      <div class="item-grid__inn">
                        <div class="item-grid__photo"> <a href="/~~$i.id~"><img alt="David Jones" class="item-grid__img js-item-main-img" src="~~$i.image~"></a>

                        </div> <a href="#" class="item-grid__name">~~$i.param~</a>
                        <div class="item-grid__category">~~$i.name~</div>
                        <!--div class="item-grid__meta">
                          <div class="item-grid__meta-left">
                            <div class="rate">
                              <div class="rate__inn">
                                <div class="rate__stars r4"> <i></i><i></i><i></i><i></i><i></i> </div>
                                <div class="rate__count">(123)</div>
                              </div>
                            </div>
                          </div>
                          <div class="item-grid__meta-right"> <a href="#" class="js-fav-add fav-btn "></a> </div>
                        </div-->
                        <div class="item-grid__actions">
                          <div class="item-grid__actions-left"> <span class="price">~~$i.cost~ р.</span> </div>
                          <div class="item-grid__actions-right"> <a href="#" class="js-cart-add cart-btn "></a> <!--a href="#" class="js-fav-add fav-btn "></a--> </div> 
                        </div>
                        <!--div class="item-grid__fast-view"> <a class="btn btn--pink js-fast-view-toggle" href="#">Быстрый просмотр</a> </div-->
                      </div>
                    </div>
                  </div>

                ~~/foreach~


                                
                                
