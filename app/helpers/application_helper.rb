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
    raw("<button class='btn btn-default'><i class='fa fa-lg fa-trash-o'></i></button>")
  end

  def plus_button
    raw("<button class='btn btn-default'><i class='fa fa-lg fa-plus'></i></button>")
  end

  def edit_button
    raw("<i class='fa fa-pencil'></i>")
  end

end
