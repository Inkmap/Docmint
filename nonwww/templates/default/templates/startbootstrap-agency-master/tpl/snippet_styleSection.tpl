{if isset($e.meta.color)}color: {$e.meta.color};{/if}
 {if isset($e.meta.bgColor)}background-color: {$e.meta.bgColor};{/if}
 {if isset($e.meta.bgImgUrl)} background-image: url({$e.meta.bgImgUrl}) no-repeat center center; 
  -webkit-background-size: cover;
  -moz-background-size: cover;
  -o-background-size: cover;
  background-size: cover;{/if}