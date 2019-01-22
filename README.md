# CV Formatter
Converts one or more CV formatted in XML to HTML.

### Prerequisite
You need *maven* and *java* installed and configured.

### Quick start

* Clone the project.
* Issue the command `mvn clean xml:transform`

This will generate cv_sample.html into `target`

### Style
Additional styles can be added to `style` dir. Default style is `simple`. To use a different style (for instance "my_style"):
* Put `my_style.xsd` in style dir.
* Run `mvn clean xml:transform -Dstyle=my_style`.

### Other parameters
* `in.dir`: input dir, where all cv's in XML are.
* `out.dir`: output dir, where all cv's in HTML are created.
* `style.url`: to override default style url.