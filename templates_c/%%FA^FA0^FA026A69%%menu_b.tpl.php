<?php /* Smarty version 2.6.11, created on 2018-03-22 12:29:50
         compiled from menu_b/menu_b.tpl */ ?>
                                <li>
                                    <a  style="background-position: -110px 15px;"  href="/">Главная</a>
                                </li>

                                                                                                                            
                                                                                                                            <?php $_from = $this->_tpl_vars['menu_g']; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array'); }$this->_foreach['tmenu'] = array('total' => count($_from), 'iteration' => 0);
if ($this->_foreach['tmenu']['total'] > 0):
    foreach ($_from as $this->_tpl_vars['i']):
        $this->_foreach['tmenu']['iteration']++;
?>
                                <li>
                                    <a  style="background-position: -110px 15px;"  href="/?mod_name=page&id=<?php echo $this->_tpl_vars['i']['name']; ?>
"><?php echo $this->_tpl_vars['i']['title']; ?>
</a>
                                </li>

                                                                                                                                                                                                                                                        <?php endforeach; endif; unset($_from); ?>

                                           
                                           
                    