module.exports =
  class myStories
    constructor: ->

      # create root element
      @rootElement = document.createElement('div')

      # select a project label
      projectLabel = document.createElement('h3')
      projectLabel.textContent = 'Please select a project'

      # project selector
      @projectSelect = document.createElement('select')
      @projectSelect.classList.add('form-control')
      @projectSelect.setAttribute('id', 'projectSelect')

      # default option
      defaultOption = document.createElement('option')
      defaultOption.value = ''
      defaultOption.innerHTML = 'Select a project'
      @projectSelect.appendChild(defaultOption)

      # append elements to @rootElement
      @rootElement.appendChild(projectLabel)
      @rootElement.appendChild(@projectSelect)

    destroy: ->
      @rootElement.remove()

    getRoot: ->
      @rootElement

    getElements: ->
      {
        projectSelect: @projectSelect
      }
