require "pagy/extras/headers"
require "pagy/extras/overflow"

Pagy::DEFAULT[:overflow] = :last_page
Pagy::DEFAULT[:items] = 50
