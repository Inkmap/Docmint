<!-- tpl/{$smarty.template} -->
<style type="text/css">
#{if isset($e.meta.id)}{$e.meta.id}{else}map{/if}{literal} {
    width:100%;
    height:{/literal}{$e.meta.mapHeight}{literal};
    background-color: red;
}
{/literal}
</style>
        <div id="{if isset($e.meta.id)}{$e.meta.id}{else}map{/if}"></div>
        {literal}<script>
          function initMap() {
            var loehme = {lat: 52.628331, lng: 13.6707063};
            var loehme = {lat: {/literal}{$e.meta.mapLatitude}{literal}, lng: {/literal}{$e.meta.mapLongitude}{literal}};
            var map = new google.maps.Map(document.getElementById('{/literal}{if isset($e.meta.id)}{$e.meta.id}{else}map{/if}{literal}'), {
              zoom: 16,
              center: {/literal}{$e.meta.mapMarker}{literal}
            });
            var marker = new google.maps.Marker({
              position: {/literal}{$e.meta.mapMarker}{literal},
              map: map
            });
          }
        </script>{/literal}
        <script async defer
        src="https://maps.googleapis.com/maps/api/js?key={$e.meta.apiKey}&callback=initMap">
        </script>

    </span>
<!-- / tpl/{$smarty.template} -->