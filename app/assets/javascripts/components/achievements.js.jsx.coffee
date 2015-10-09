Achievements = React.createClass
  componentDidMount: ->
    console.log "Achievements"
  render: ->
    <section className="row" id="achievements">
      <div className="flex-xs-auto"></div>
      <div className="pane-wrap flex-xs-18 flex-md-19 flex-lg-16">
        <div className="pane frame z1 panel">
          <div className="title tab">
            <i className="fa fa-cubes"></i>
            Achievements
            <div className="summary">あなたと関連が深い実績一覧</div>
          </div>
          <AchievementList achievements={@props.achievements}></AchievementList>
        </div>
      </div>
      <div className="flex-xs-auto"></div>
    </section>

AchievementList = React.createClass
  getInitialState: ->
    achievements: @props.achievements
  render: ->
    achievementNodes = @state.achievements.map (achievement)->
      <Achievement id={achievement.id} key={achievement.id} name={achievement.name} description={achievement.content} percentage={achievement.percentage}/>
    <div className="row">{achievementNodes} </div>

Achievement = React.createClass
  render: ->
    <article className="achievement flex-fluid-xs-33">
      <div className="content">
        <div className="badge"></div>
        <div className="gage" style={width: @props.percentage + "%"}></div>
        <h1>
          {@props.name}
        </h1>
        <div className="description">
          {@props.description}
        </div>
      </div>
    </article>


If = React.createClass
  render: ->
    if @props.bool
      @props.children
    else
      false

window.Achievements = Achievements

