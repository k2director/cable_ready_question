class Card < ApplicationRecord
  include CableReady::Broadcaster

  after_create do
    cable_ready['cards'].remove_css_class(
      selector: '#processing',
      name: 'd-none'
    )

    cable_ready['cards'].console_log(message: 'IM WORKING ON IT!')

    cable_ready.broadcast

    sleep 2

    cable_ready['cards'].add_css_class(
      selector: '#processing',
      name: 'd-none'
    )

    cable_ready['cards'].insert_adjacent_html(
      selector: '#container',
      position: 'afterbegin',
      html: ApplicationController.render(self)
    )
    cable_ready.broadcast
  end
end
