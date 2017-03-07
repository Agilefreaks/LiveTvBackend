# frozen_string_literal: true
module TestHelpers
  module_function

  def app
    Livetv::Application.app
  end

  def rom
    Livetv::Container['persistence.rom']
  end

  def db_connection
    rom.gateways[:default].connection
  end
end
