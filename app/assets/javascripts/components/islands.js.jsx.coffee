Islands = React.createClass
  componentDidMount :->
    console.log "island"
  render: ->
    <section className="row" id="islands">
      <div className="flex-xs-auto"></div>
      <div className="pane-wrap flex-xs-18 flex-md-19 flex-lg-16">
        <div className="pane frame z1 panel">
          <div className="title tab">
            <i className="fa fa-cloud"></i>
            Islands
          </div>
          <IslandList pass_islands={@props.pass_islands}></IslandList>
        </div>
      </div>
      <div className="flex-xs-auto"></div>
    </section>

IslandList = React.createClass
  getInitialState: ->
    pass_islands: @props.pass_islands
  render: ->
    islandNodes = @state.pass_islands.map (island)->
      <Island key={island.id} name={island.name}></Island>
    <div className="row">{islandNodes} </div>

Island = React.createClass
  render: ->
    <article className="island flex-fluid-xs-33">
      <div className="content">
        <h1>
          {@props.name}
        </h1>
      </div>
    </article>

window.Islands = Islands