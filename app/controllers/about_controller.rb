class AboutController < ApplicationController
  def show
    @about = About.first ||
             OpenStruct.new(title: 'No content',
                            description: 'Please add content to this about page')
  end
end
