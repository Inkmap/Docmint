{if isset($e.meta.color)}color: {$e.meta.color};{/if}
 {if isset($e.meta.bgColor)}background-color: #{$e.meta.bgColor};{/if}
 {if isset($e.meta.bgImgUrl)} background-image: url({$e.meta.bgImgUrl}); background-repeat: no-repeat; background-position: center center; 
  -webkit-background-size: {if isset($e.meta.bgImgSize)}{$e.meta.bgImgSize}{else}contain{/if};
  -moz-background-size: {if isset($e.meta.bgImgSize)}{$e.meta.bgImgSize}{else}contain{/if};
  -o-background-size: {if isset($e.meta.bgImgSize)}{$e.meta.bgImgSize}{else}contain{/if};
  background-size: {if isset($e.meta.bgImgSize)}{$e.meta.bgImgSize}{else}contain{/if};{/if}