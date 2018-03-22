<?php /* Smarty version 2.6.11, created on 2018-03-22 12:29:47
         compiled from rand_product/rand_product.tpl */ ?>
<?php $_smarty_tpl_vars = $this->_tpl_vars;
$this->_smarty_include(array('smarty_include_tpl_file' => "cart/pop_up.tpl", 'smarty_include_vars' => array()));
$this->_tpl_vars = $_smarty_tpl_vars;
unset($_smarty_tpl_vars);
 ?>

<?php $this->assign('numCols', '4');  $this->assign('data', $this->_tpl_vars['items']); ?>



                            <ul class="products-grid odd">
                                
                            <?php $this->assign('col', '0'); ?>
                            <?php unset($this->_sections['element']);
$this->_sections['element']['name'] = 'element';
$this->_sections['element']['loop'] = is_array($_loop=$this->_tpl_vars['data']) ? count($_loop) : max(0, (int)$_loop); unset($_loop);
$this->_sections['element']['show'] = true;
$this->_sections['element']['max'] = $this->_sections['element']['loop'];
$this->_sections['element']['step'] = 1;
$this->_sections['element']['start'] = $this->_sections['element']['step'] > 0 ? 0 : $this->_sections['element']['loop']-1;
if ($this->_sections['element']['show']) {
    $this->_sections['element']['total'] = $this->_sections['element']['loop'];
    if ($this->_sections['element']['total'] == 0)
        $this->_sections['element']['show'] = false;
} else
    $this->_sections['element']['total'] = 0;
if ($this->_sections['element']['show']):

            for ($this->_sections['element']['index'] = $this->_sections['element']['start'], $this->_sections['element']['iteration'] = 1;
                 $this->_sections['element']['iteration'] <= $this->_sections['element']['total'];
                 $this->_sections['element']['index'] += $this->_sections['element']['step'], $this->_sections['element']['iteration']++):
$this->_sections['element']['rownum'] = $this->_sections['element']['iteration'];
$this->_sections['element']['index_prev'] = $this->_sections['element']['index'] - $this->_sections['element']['step'];
$this->_sections['element']['index_next'] = $this->_sections['element']['index'] + $this->_sections['element']['step'];
$this->_sections['element']['first']      = ($this->_sections['element']['iteration'] == 1);
$this->_sections['element']['last']       = ($this->_sections['element']['iteration'] == $this->_sections['element']['total']);
?>
                                <?php if ($this->_tpl_vars['col'] == $this->_tpl_vars['numCols']): ?>
                                    </ul><ul class="products-grid odd"><?php $this->assign('col', '0'); ?>
                                <?php endif; ?>
                                    <li class="item">
                                    
                                        <a href="/?mod_name=item&id=<?php echo $this->_tpl_vars['data'][$this->_sections['element']['index']]['id']; ?>
" title="<?php echo $this->_tpl_vars['data'][$this->_sections['element']['index']]['name']; ?>
"  class="product-image"><img style="display: inline;" class="lazy" src="/imgThumb.php?src=/img/<?php echo $this->_tpl_vars['data'][$this->_sections['element']['index']]['dir']; ?>
/<?php echo $this->_tpl_vars['data'][$this->_sections['element']['index']]['image']; ?>
&max_x=120&max_y=148" alt="<?php echo $this->_tpl_vars['data'][$this->_sections['element']['index']]['name']; ?>
"></a>
                                        <div style="height: 31px; margin-bottom:3px;" class="product-box">
                                            <h2 class="product-name"><a  style="font-weight:bold;"href="/?mod_name=item&id=<?php echo $this->_tpl_vars['data'][$this->_sections['element']['index']]['id']; ?>
" title="<?php echo $this->_tpl_vars['data'][$this->_sections['element']['index']]['name']; ?>
" ><?php echo $this->_tpl_vars['data'][$this->_sections['element']['index']]['name']; ?>
</a></h2>
                                        </div> 
                                        <div style="height: 69px; " class="product-box">
                                            <a style="text-decoration: none;font: 13px/1 Arial,Helvetica,sans-serif;" href="/?mod_name=item&id=<?php echo $this->_tpl_vars['data'][$this->_sections['element']['index']]['id']; ?>
" title="<?php echo $this->_tpl_vars['data'][$this->_sections['element']['index']]['name']; ?>
" ><?php echo $this->_tpl_vars['data'][$this->_sections['element']['index']]['param']; ?>
</a>
                                        </div>
                                        <div class="extra_wrap">
                                            <div class="price-padd-list">
                                                <div class="price-box">
                                                    <span class="regular-price" id="product-price-3462"><span class="price"><?php echo $this->_tpl_vars['data'][$this->_sections['element']['index']]['cost']; ?>
 руб.</span></span>
                                                </div>
                                                <?php if ($this->_tpl_vars['showing'] == 1): ?>
                                                <div class="price-box">
                                                    <span class="regular-price" id="product-price-3462"><span class="price" style="font-size:12px;">(<?php echo $this->_tpl_vars['data'][$this->_sections['element']['index']]['doll']; ?>
 у.е.)</span></span>
                                                </div>
                                                <?php endif; ?>
                                                <?php if ($this->_tpl_vars['data'][$this->_sections['element']['index']]['qty'] > 0): ?>

                                                <button type="button" title="В наличии" class="button btn-cart">
                                                    <span><span>В наличии</span></span>
                                                </button> 
                                                
                                                <!--button type="button" title="В корзину" class="button btn-cart" onclick="javascript:show_info_fixed(<?php echo $this->_tpl_vars['data'][$this->_sections['element']['index']]['id']; ?>
);return false;">
                                                    <span><span>В корзину</span></span>
                                                </button-->
                                                <?php else: ?>
                                                <button type="button" title="Нет в наличии" class="button btn-cart">
                                                    <span  style="background-position:0 -22px;"><span  style="background-position:100% -22px; color:#c92a2a;">Нет в наличии</span></span>
                                                </button> 
                                                <?php endif; ?>
                                            </div>
                                        </div> 
                        
                                    </li>
                                   <?php $this->assign('col', ($this->_tpl_vars['col']+1)); ?>
                            <?php endfor; endif; ?>
                            <?php $this->assign('remainder', ($this->_tpl_vars['numCols']-$this->_tpl_vars['col'])); ?>
                            <?php unset($this->_sections['emptyElement']);
$this->_sections['emptyElement']['name'] = 'emptyElement';
$this->_sections['emptyElement']['loop'] = is_array($_loop=$this->_tpl_vars['remainder']) ? count($_loop) : max(0, (int)$_loop); unset($_loop);
$this->_sections['emptyElement']['show'] = true;
$this->_sections['emptyElement']['max'] = $this->_sections['emptyElement']['loop'];
$this->_sections['emptyElement']['step'] = 1;
$this->_sections['emptyElement']['start'] = $this->_sections['emptyElement']['step'] > 0 ? 0 : $this->_sections['emptyElement']['loop']-1;
if ($this->_sections['emptyElement']['show']) {
    $this->_sections['emptyElement']['total'] = $this->_sections['emptyElement']['loop'];
    if ($this->_sections['emptyElement']['total'] == 0)
        $this->_sections['emptyElement']['show'] = false;
} else
    $this->_sections['emptyElement']['total'] = 0;
if ($this->_sections['emptyElement']['show']):

            for ($this->_sections['emptyElement']['index'] = $this->_sections['emptyElement']['start'], $this->_sections['emptyElement']['iteration'] = 1;
                 $this->_sections['emptyElement']['iteration'] <= $this->_sections['emptyElement']['total'];
                 $this->_sections['emptyElement']['index'] += $this->_sections['emptyElement']['step'], $this->_sections['emptyElement']['iteration']++):
$this->_sections['emptyElement']['rownum'] = $this->_sections['emptyElement']['iteration'];
$this->_sections['emptyElement']['index_prev'] = $this->_sections['emptyElement']['index'] - $this->_sections['emptyElement']['step'];
$this->_sections['emptyElement']['index_next'] = $this->_sections['emptyElement']['index'] + $this->_sections['emptyElement']['step'];
$this->_sections['emptyElement']['first']      = ($this->_sections['emptyElement']['iteration'] == 1);
$this->_sections['emptyElement']['last']       = ($this->_sections['emptyElement']['iteration'] == $this->_sections['emptyElement']['total']);
?>
                                <li class="item">&nbsp;</li>
                            <?php endfor; endif; ?>
                                                                                                                                
                                    
                            </ul>
                                
                                
                                
                                
                                
                                