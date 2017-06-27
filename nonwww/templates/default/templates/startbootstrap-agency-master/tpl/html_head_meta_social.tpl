    <!-- General Metatags and social -->

    {if isset($page.meta.description)}<meta name="description" content="{$page.meta.description}" />{/if}

    {if isset($page.meta.keywords)}<meta name="keywords" content="{$page.meta.keywords}" />{/if}

    {if isset($page.meta.author)}<meta name="author" content="{$page.meta.author}" />{/if}

    {if isset($page.meta.copyright)}<meta name="copyright" content="{$page.meta.copyright}" />{/if}

    {if isset($page.meta.titleSocial)}<meta name="DC.title" content="{$page.meta.titleSocial}" />{/if}


    <meta property="og:type" content="website" />
    {if isset($page.meta.titleSocial)}<meta property="og:title" content="{$page.meta.titleSocial}" />{/if}

    {if isset($page.meta.siteName)}<meta property="og:site_name" content="{$page.meta.siteName}" />{/if}

    <meta property="og:url" content="{if isset($page.meta.siteUrl)}{$page.meta.siteUrl}/{/if}{$page.meta.url}" />
    {if isset($page.meta.socialImgUrl)}<meta property="og:image" content="{if isset($page.meta.siteUrl)}{$page.meta.siteUrl}/{/if}{$page.meta.socialImgUrl}"/>{/if}

    {if isset($page.meta.description)}<meta property="og:description" content="{$page.meta.description}" />{/if}

    {if isset($page.meta.author)}<meta property="article:author" content="{$page.meta.author}" />{/if}

    {if isset($page.meta.publisher)}<meta property="article:publisher" content="{$page.meta.publisher}" />{/if}


    <!-- twitter card -->
    <meta name="twitter:card" content="summary_large_image" />
    {if isset($page.meta.siteName)}<meta name="twitter:site" content="{$page.meta.siteName}" />{/if}

    {if isset($page.meta.author)}<meta name="twitter:creator" content="{$page.meta.author}" />{/if}

    {if isset($page.meta.titleSocial)}<meta name="twitter:title" content="{$page.meta.titleSocial}" />{/if}

    {if isset($page.meta.description)}<meta name="twitter:description" content="{$page.meta.description}" />{/if}

    {if isset($page.meta.socialImgUrl)}<meta name="twitter:image" content="{if isset($page.meta.siteUrl)}{$page.meta.siteUrl}/{/if}{$page.meta.socialImgUrl}" />{/if}

    {if isset($page.meta.siteUrl)}<meta name="twitter:domain" content="{$page.meta.siteUrl}" />{/if}


    {if isset($page.meta.titleSocial)}<meta itemprop="name" content="{$page.meta.titleSocial}" />{/if}

    {if isset($page.meta.socialImgUrl)}<meta itemprop="image" content="{if isset($page.meta.siteUrl)}{$page.meta.siteUrl}/{/if}{$page.meta.socialImgUrl}" />{/if}

    {if isset($page.meta.description)}<meta itemprop="description" content="{$page.meta.description}" />{/if}