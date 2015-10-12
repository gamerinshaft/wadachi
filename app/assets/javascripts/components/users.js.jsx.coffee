CSSTransitionGroup = React.addons.CSSTransitionGroup
Users = React.createClass
  componentDidMount: ->
    console.log "Users"
    console.log @props.data
  render: ->
    <section className="row" id="users">
      <div className="flex-xs-auto"></div>
      <div className="pane-wrap flex-xs-18 flex-md-19 flex-lg-16">
        <div className="pane frame z1 panel">
          <div className="title tab">
            <i className="fa fa-users"></i>
            Users
            <div className="summary">このサービスを利用しているユーザー一覧</div>
          </div>
          <UserList data={@props.data}></UserList>
        </div>
      </div>
      <div className="flex-xs-auto"></div>
    </section>

UserList = React.createClass
  getInitialState: ->
    data: @props.data
  render: ->
    userNodes = @state.data.map (user)->
      <User key={user.uid} name={user.name} nickname={user.nickname} avatar={user.avatar_url}/>
    <div className="row">{userNodes} </div>

User = React.createClass
  render: ->
    <article className="user flex-xs-3">
      <div className="content aspectwrapper-1by1" style={backgroundImage: 'url(' + @props.avatar + ')'}>
        <div className="aspectcontent">
          <div className="nickname column">
            <div className="flex-xs-auto"></div>
            {@props.nickname}
          </div>
        </div>
      </div>
    </article>

If = React.createClass
  render: ->
    if @props.bool
      @props.children
    else
      false
window.Users = Users

