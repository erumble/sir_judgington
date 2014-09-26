module ApplicationHelper

  def display_base_errors resource
    return '' if (resource.errors.empty?) or (resource.errors[:base].empty?)
    messages = resource.errors[:base].map { |msg| content_tag(:p, msg) }.join
    html = <<-HTML
    <div class="alert alert-error alert-block">
      <button type="button" class="close" data-dismiss="alert">&#215;</button>
      #{messages}
    </div>
    HTML
    html.html_safe
  end

  def trashcan_button
    raw("<span class='fa-stack fa-lg'><i class='fa fa-square-o fa-stack-2x'></i><i class='fa fa-lg fa-trash-o fa-stack-1x'></i></span>")
    # raw("<button class='btn btn-primary'><i class='fa fa-lg fa-trash-o'></i></button>")
  end

  def plus_button
    raw("<span class='fa-stack fa-lg'><i class='fa fa-square-o fa-stack-2x'></i><i class='fa fa-lg fa-plus fa-stack-1x'></i> </span>")
    # raw("<button class='btn btn-primary'><i class='fa fa-lg fa-plus'></i></button>")
  end

  def edit_button
    raw("<i class='fa fa-pencil'></i>")
  end

end
