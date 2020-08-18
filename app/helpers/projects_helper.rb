module ProjectsHelper
  def first_item(order, project)
    order.even? ? img_portfolio(project) : description_portfolio(project, order)
  end

  def second_item(order, project)
    order.odd? ? img_portfolio(project) : description_portfolio(project, order)
  end

  def img_portfolio(project)
    (image_tag project[:image_url], class: 'portfolio-img').html_safe
  end

  def description_portfolio(project, index)
    stacks = project[:stacks].inject('') { |string, el| string + "<span>#{el}</span>" }

    project_link = "<button type='button' class='project-link' data-toggle='modal' data-target='#projectModal#{index}'>\
      See Project\
    </button>".html_safe
    "<div class='project-description'>\
    <h2>#{project[:title]}</h2>\
    <h5><span>#{project[:company]}</span> | <span>#{project[:role]}</span> | <span>#{project[:year]}</h5>\
    <p>#{project[:short_description]}</p>\
    <div class='stacks'>#{stacks}</div>\
    #{project_link}\
    </div>".html_safe
  end

  def modal(project, index)
    project_image = (image_tag project[:image_url], class: 'modal-img').html_safe
    stacks = project[:stacks].inject('') { |string, el| string + "<span>#{el}</span>" }
    repo_link = project[:repo_url] == '' ? (link_to 'See Repo', project[:repo_url], class: 'modal-link').html_safe : ''
    live_link = (link_to 'See live', project[:live_url], class: 'modal-link').html_safe

    "<div class='modal fade' id='projectModal#{index}' tabindex='-1' role='dialog'\
     aria-labelledby='projectModal#{index}Title' aria-hidden='true'>\
      <div class='modal-dialog modal-dialog-centered modal-lg' role='document'>\
        <div class='modal-content'>\
          <div class='modal-header'>\
            <h2 class='modal-title'>#{project[:title]}</h2>\
            <h5><span>#{project[:company]}</span> | <span>#{project[:role]}</span> | <span>#{project[:year]}</h5>\
            <button type='button' class='close' data-dismiss='modal' aria-label='Close'>\
              <span aria-hidden='true'>&times;</span>\
            </button>\
          </div>\
          <div>\
            #{project_image}\
          </div>
          <div class='modal-description'>\
            <p>\
              #{project[:long_description]}\
            </p>\
            <div>\
              #{stacks}\
              <hr>\
              <div>\
                #{repo_link}\
                #{live_link}\
              </div>\
            </div>\
          </div>\
        </div>\
      </div>\
    </div>".html_safe
  end
end
