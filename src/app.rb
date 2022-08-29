# require_relative metodo que permite incluir otros archivos de ruby utilizando un PATH relativo

require_relative "view/ruby2d" # no es necesario el .rb
require_relative "model/state"

class App
  def start
    view = View::Ruby2dView.new
    initial_state = Model::initial_state
    view.render(initial_state)
  end

  def init_timer
    loop do
      sleep 0.5
      # trigger movement
    end
  end
end

