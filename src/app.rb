# require_relative metodo que permite incluir otros archivos de ruby utilizando un PATH relativo

require_relative "view/ruby2d" # no es necesario el .rb
require_relative "model/state"
require_relative "actions/actions"

class App
  def initialize
    @state = Model::initial_state
  end

  def start
    @view = View::Ruby2dView.new(self)
    # se crea nuevo Tread para corra la actualizacion del timmen
    timer_thread = Thread.new { init_timer(@view) }
    @view.start(@state)
    timer_thread.join
  end

  def init_timer(view)
    loop do
      if @state.game_finished
        puts "GAME OVER"
        puts "Puntaje: #{@state.snake.positions.length}"
        break
      end
      @state = Actions::move_snake(@state)
      view.renderg(@state)
      sleep 0.5
    end
  end

  def send_action(action, params)
    # :change_direction, Model::Direction::DOWN
    new_state = Actions.send(action, @state, params)
    if new_state.hash != @state.hash
      @state = new_state
      @view.render(@state)
    end
  end
end

app = App.new
app.start
