class TestStepsController < ApplicationController
  def index
    @test_steps = TestStep.all
  end
end
