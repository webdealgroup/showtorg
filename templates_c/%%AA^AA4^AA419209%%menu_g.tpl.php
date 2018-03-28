<?php /* Smarty version 2.6.11, created on 2018-03-29 07:19:17
         compiled from menu_g/menu_g.tpl */ ?>


                <li>
                    <a href="/">Главная</a>
                </li>

                <?php $_from = $this->_tpl_vars['menu_g']; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array'); }if (count($_from)):
    foreach ($_from as $this->_tpl_vars['m']):
?>
                <li class="nav__item">
                    <a class="nav__link " href="/?mod_name=page&id=<?php echo $this->_tpl_vars['m']['name']; ?>
"><span><?php echo $this->_tpl_vars['m']['title']; ?>
</span></a>
                </li>
                <?php endforeach; endif; unset($_from); ?>