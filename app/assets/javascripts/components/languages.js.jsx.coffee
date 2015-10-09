Languages = React.createClass
  componentDidMount: ->
    console.log "Languages"
  render: ->
    <section className="row" id="languages">
      <div className="flex-xs-auto"></div>
      <div className="pane-wrap flex-xs-18 flex-md-19 flex-lg-16">
        <div className="pane frame z1 panel">
          <div className="title tab">
            <i className="fa fa-language"></i>
              Languages
            <div className="summary">全ユーザーが今まで書いてるプログラムの総行数です</div>
          </div>
          <LanguageList data={@props.data}/>
        </div>
      </div>
      <div className="flex-xs-auto"></div>
    </section>

LanguageList = React.createClass
  getInitialState: ->
    data: @props.data
  render: ->
    fullpower = @props.data[0][1]
    languageNodes = @state.data.map (language) ->
      percentage = language[1] * 100 / fullpower
      <Language key={language[0]} name={language[0]} power={language[1]} percentage={percentage}/>
    <div className="row stretch">{languageNodes} </div>

Language = React.createClass
  render: ->
    <article className="language flex-xs-20">
      <div className="content">
        <div className="name">
          {@props.name}
        </div>
        <div className="power" style={width: @props.percentage + "%"}>
          {@props.power}
        </div>
      </div>
    </article>

window.Languages = Languages
