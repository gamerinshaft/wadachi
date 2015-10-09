Passport = React.createClass
  componentDidMount: ->
    console.log "island"
  render: ->
    <section className="row" id="passport">
      <div className="flex-xs-auto"></div>
      <div className="pane-wrap flex-xs-18 flex-md-19 flex-lg-16">
        <div className="pane frame z1 panel">
          <div className="title tab">
            <i className="fa fa-cloud"></i>
            Passport
            <div className="summary">あなたが現在パスポートを発行されている国の一覧</div>
          </div>
          <IslandList data={@props.data} />
        </div>
      </div>
      <div className="flex-xs-auto"></div>
    </section>

IslandList = React.createClass
  getInitialState: ->
    data: @props.data
  render: ->
    islandNodes = @state.data.islands.map (island) ->
      <Island key={island.id} name={island.name} areas={island.areas} />
    <div className="row stretch">{islandNodes} </div>

Island = React.createClass
  render: ->
    <article className="island flex-fluid-xs-33">
      <div className="content z1">
        <div className="name">
          {@props.name}
        </div>
        <AreaList areas={@props.areas}></AreaList>
      </div>
    </article>

AreaList = React.createClass
  render: ->
    areaNodes = @props.areas.map (area) ->
      <li key={area.id}>{area.name}</li>
    <ul>{areaNodes}</ul>
window.Passport = Passport
