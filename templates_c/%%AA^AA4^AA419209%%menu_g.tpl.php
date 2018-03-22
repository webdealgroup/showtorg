<?php /* Smarty version 2.6.11, created on 2018-03-22 13:28:38
         compiled from menu_g/menu_g.tpl */ ?>
                                <li>
                                    <a href="/">Главная</a>
                                </li>

                                                                                                                            
                                                                                                                            <?php $_from = $this->_tpl_vars['menu_g']; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array'); }$this->_foreach['tmenu'] = array('total' => count($_from), 'iteration' => 0);
if ($this->_foreach['tmenu']['total'] > 0):
    foreach ($_from as $this->_tpl_vars['i']):
        $this->_foreach['tmenu']['iteration']++;
?>
                                <li>
                                    <a href="/?mod_name=page&id=<?php echo $this->_tpl_vars['i']['name']; ?>
"><?php echo $this->_tpl_vars['i']['title']; ?>
</a>
                                </li>

                                                                                                                                                                                                                                                        <?php endforeach; endif; unset($_from); ?>

                                           
                                           
                    