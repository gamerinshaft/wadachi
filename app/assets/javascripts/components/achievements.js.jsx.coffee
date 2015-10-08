Achievements = React.createClass
  componentDidMount: ->
    console.log "Achievements"
  render: ->
    <div className="row">
      hoge
    </div>

If = React.createClass
  render: ->
    if @props.bool
      @props.children
    else
      false

window.Achievements = Achievements