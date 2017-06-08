
# How Docmint renders pages

Docmint separates the content from the design. 
This means that the text, references to media and links to pages are stored in one place 
while the design (html, css, js) is stored in a different place. 

When rendering the page, Docmint makes a list of all `.yaml` files inside the `pages` folder. 
These files hold the content and meta information of the page(s).  
Meta information, such as the name of the theme which is being used for the rendering.
Each theme is a compilation of template files inside a folder of the same name
which can be found inside the `templates` directory.

# Types of pages

There are different kinds of pages available in Docmint. The two major categories are *singlepage*
and *slideshow*. 

Slideshows separate each chunk of the page into individual slides. 
The single page design lists each chunk beneath one another.

# Location of page configurations

Each page is configured by one `yaml` file. These `yaml` files have the file ending `.yaml` 
and are stored in the folder `htdocs` which is located inside the project folder.

## Sub-directories for pages

The config files are all located in the same directory.

# Links in pages

There are different types of links available:

 * relative links within the page (internal links)
 * relative links to static files (downloads)
 * links to external pages (external links)
 * links to anchors within the page (starting with #)
 * links to mail addresses (starting with mailto:)

