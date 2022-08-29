# require_relative metodo que permite incluir otros archivos de ruby utilizando un PATH relativo

require_relative "view/ruby2d" # no es necesario el .rb
require_relative "model/state"

view = View::Ruby2dView.new

initial_state = Model::initial_state

view.render(initial_state)

