module ProjectsHelper

  def first_item(order, project)
    order.even? ? img_portfolio(project) : description_portfolio(project)
  end

  def second_item(order, project)
    order.odd? ? img_portfolio(project) : description_portfolio(project)
  end

  def img_portfolio(project)
    (image_tag project[:image_url], class: 'portfolio-img').html_safe
  end

  def description_portfolio(project)
    stacks = project[:stacks].inject(''){ |string, el| string += "<span>#{el}</span>"}
    project_link = (link_to 'See Project', '#', class: 'project-link').html_safe
    "<div class='project-description'>\
    <h2>#{project[:title]}</h2>\
    <h5><span>#{project[:company]}</span> | <span>#{project[:role]}</span> | <span>#{project[:year]}</h5>\
    <p>#{project[:short_description]}</p>\
    <div class='stacks'>#{stacks}</div>\
    #{project_link}\
    </div>".html_safe
  end
end
