<?php /* Smarty version 2.6.11, created on 2018-03-22 12:29:50
         compiled from menu_v/menu_v.tpl */ ?>
﻿ 

                                <ul id="nav">
                                    
                                    <?php $_from = $this->_tpl_vars['menu_v']; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array'); }$this->_foreach['vmenu'] = array('total' => count($_from), 'iteration' => 0);
if ($this->_foreach['vmenu']['total'] > 0):
    foreach ($_from as $this->_tpl_vars['i']):
        $this->_foreach['vmenu']['iteration']++;
?>
                                    <li class="level0 nav-5 level-top parent <?php if ($this->_tpl_vars['page_id'] == $this->_tpl_vars['i']['name']): ?> active <?php endif; ?>">
                                        <a href="/?page=<?php echo $this->_tpl_vars['i']['name']; ?>
" class="level-top"><span><?php echo $this->_tpl_vars['i']['title']; ?>
</span></a>
                                        <?php if ($this->_tpl_vars['i']['submenu'][0]['title'] != ''): ?>
                                        <ul class="level0">
                                        
                                            <?php $_from = $this->_tpl_vars['i']['submenu']; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array'); }$this->_foreach['vsubmenu'] = array('total' => count($_from), 'iteration' => 0);
if ($this->_foreach['vsubmenu']['total'] > 0):
    foreach ($_from as $this->_tpl_vars['s']):
        $this->_foreach['vsubmenu']['iteration']++;
?>
                                            <li class="level1 nav-5-1 first last  <?php if ($this->_tpl_vars['page_id'] == $this->_tpl_vars['s']['id']): ?> active <?php endif; ?>">
                                                <a href="/?page=<?php echo $this->_tpl_vars['s']['name']; ?>
"><span><?php echo $this->_tpl_vars['s']['title']; ?>
</span></a>
                                                
                                                <?php if ($this->_tpl_vars['s']['submenu'][0]['title'] != ''): ?>
                                                <ul class="level2" style="display:block;">
                                                
                                                    <?php $_from = $this->_tpl_vars['s']['submenu']; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array'); }$this->_foreach['vssubmenu'] = array('total' => count($_from), 'iteration' => 0);
if ($this->_foreach['vssubmenu']['total'] > 0):
    foreach ($_from as $this->_tpl_vars['ss']):
        $this->_foreach['vssubmenu']['iteration']++;
?>
                                                    <li class="level3 nav-5-1 first last  <?php if ($this->_tpl_vars['page_id'] == $this->_tpl_vars['ss']['id']): ?> active <?php endif; ?>">
                                                        <a style="color:#828282 !important;" href="/?page=<?php echo $this->_tpl_vars['ss']['name']; ?>
"><span><?php echo $this->_tpl_vars['ss']['title']; ?>
</span></a>
                                                    </li>
                                                    <?php endforeach; endif; unset($_from); ?>
                                                    
                                                </ul>
                                                <?php endif; ?>
                                                
                                                
                                            </li>
                                            <?php endforeach; endif; unset($_from); ?>
                                            
                                        </ul>
                                        <?php endif; ?>
                                    </li>  
                                    <?php endforeach; endif; unset($_from); ?>                                    

                                    
                                </ul>
                            
                            


