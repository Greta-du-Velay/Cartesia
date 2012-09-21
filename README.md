Cartesia
========

Cartesia is a tool that helps to manage employees' training in a company. It is aimed to human resources managers. After identifying business critical needs, the HR manager defines learning objectives and evaluates employees' progression. The tool produces visual reports with the collected data.

Cartesia is a free software tool developed by the [BeCome's project partneship](http://become.ning.com/) and coded in Ruby on Rails by [Greta du Velay](http://cri.velay.greta.fr/). It relies on ProcessingJS, so it runs only on modern browsers, including current versions of Firefox, Safari, Chrome, Opera, and Internet Explorer (version 9+).

Requirements
------------

Cartesia installs as any Rails 3 application. The following Gems are required:

- rails (>= 3.0.7)
- sqlite3-ruby and sqlite3 (if you use a sqlite database backend)
- mysql (if you use a mysql database backend)
- haml
- haml-rails
- devise (>= 1.3.4)
- cancan
- navigasmic
- formtastic
- http_accept_language
- faker

And ruby language of course!

Everything should install easily with 'bundle'.

License
-------

This program is free software: you can redistribute it and/or modify it under the terms of the GNU General Public License as published by the Free Software Foundation, either version 3 of the License, or (at your option) any later version.
