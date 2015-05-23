tracker = require 'pivotaltracker'
client = new tracker.Client '2c2b8e85c26ebd70ead19c9ca248b081'
MyStoriesView = require './my-stories-view'

module.exports =
  activate: (state) ->
    atom.commands.add 'atom-workspace', 'pivotal-tracker:my-stories': => @myStories()

  myStories: ->

    view = new MyStoriesView
    elements = view.getElements()
    root = view.getRoot()

    client.projects.all (err, projects) ->
      if err?
        atom.notifications.addError err.message
      else
        projects.forEach (project) ->
          option = document.createElement 'option'
          option.value = project.id
          option.innerHTML = project.name
          elements.projectSelect.appendChild option

      elements.projectSelect.onchange = selectedProject

      atom.workspace.addRightPanel({item: root})

selectedProject = ->
  projectId = document.getElementById('projectSelect').value

  if projectId isnt ''
    client.project(projectId).stories.all (err, stories) ->
      if err?
        atom.notifications.addError err.message
      else
        debugger
