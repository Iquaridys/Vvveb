import(common.tpl) 

[data-v-user-*] = <?php echo($this->user['@@__data-v-user-(*)__@@'] ?? '');?>
