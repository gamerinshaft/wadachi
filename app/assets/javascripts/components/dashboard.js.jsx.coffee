Dashboard = React.createClass
  componentDidMount: ->
    console.log "Dashboard"
  render: ->
    <div className="row">
      <If bool={@props.flag.show_profile}>
        <ProfileBox user={@props.user} profile={@props.profile} url={"/api/users/" + @props.user.uid + "/profile"} />
      </If>
      <If bool={@props.flag.show_users}>
        <UsersBox />
      </If>
    </div>

If = React.createClass
  render: ->
    if @props.bool
      @props.children
    else
      false
# =============================================
UsersBox = React.createClass
  componentDidMount: ->
    console.log "UsersBox"
  render: ->
    <div className="usersBox flex flex-xs-8">
      <div className="frame z1">
        <h1>ユーザー一覧</h1>
        これはUsersBoxです。
      </div>
    </div>
# =============================================
ProfileBox = React.createClass
  getInitialState: -> image: @props.user.avatar_url, bio: @props.profile.bio
  componentDidMount: ->
  handleEdit: ->
    if $("#profileBox").hasClass("edit")
      $.ajax
        url: @props.url
        type: "PUT"
        dataType: 'json'
        data: profile: @state
      .done (data) =>
        @setState(data: data)
      .fail (xhr, status, err) =>
        console.error @props.url, status, err.toString()
      $("#profileBox").removeClass("edit")
    else
      $("#profileBox").addClass("edit")
  handleBioChange: (e)->
    @setState(bio: e.target.value.replace(/\s+/g, ""))
  render: ->
    <div id="profileBox" className="flex flex-xs-6">
      <div className="frame z1">
        <div className="header">
          <div className="edit" onClick={ @handleEdit }>
            <i className="fa fa-gear"></i>
            <i className="fa fa-times"></i>
          </div>
          <Center>
            <div className="image">
              <img src={@state.image} />
              <div className="mask">
                <Center>
                  <i className="fa fa-camera"></i>
                </Center>
              </div>
            </div>
            <div className="content">
              <div className="bio">
                {@state.bio}
              </div>
              <textarea defaultValue={@state.bio} onChange={@handleBioChange}></textarea>
            </div>
          </Center>
        </div>
        <div className="footer">
          <div className="row">
            <div className="posts data flex-xs-auto">
              <div className="column">
                <div className="name">
                  posts
                </div>
                <div className="value">
                  20
                </div>
              </div>
            </div>
            <div className="follows data flex-xs-auto">
              <div className="column">
                <div className="name">
                  follows
                </div>
                <div className="value">
                  200
                </div>
              </div>
            </div>
            <div className="followers data flex-xs-auto">
              <div className="column">
                <div className="name">
                  followers
                </div>
                <div className="value">
                  30
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
# =============================================
Center = React.createClass
  render: ->
    <div className="row max-h">
      <div className="flex-xs-auto"></div>
      <div className="column">
        <div className="flex-xs-auto"></div>
        {@props.children}
        <div className="flex-xs-auto"></div>
      </div>
      <div className="flex-xs-auto"></div>
    </div>

# =============================================
CommentBox = React.createClass
  render: ->
    <div className="commentBox">
      <h1>Comments</h1>
      <CommentList />
      <CommentForm />
    </div>

CommentList = React.createClass
  render: ->
    <div className="commentList">
      <Comment author="taneichi">たねいちです</Comment>
      <Comment author="nakano">*another*だよ</Comment>
      Hello, world! I am a CommentList.
    </div>
CommentForm = React.createClass
  render: ->
    <div className="commentForm">
      Hello, world! I am a CommentForm.
    </div>
Comment = React.createClass
  render: ->
    <div className="comment">
      <h2 className="commentAuthor">
        {@props.author}
      </h2>
      {@props.children}
    </div>
window.Dashboard = Dashboard