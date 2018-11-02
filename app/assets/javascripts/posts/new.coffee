# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

createMessageAlert = (alert_type, message) ->
  post_form = document.forms[0]
  post_form.insertAdjacentHTML('beforebegin', "<div class=\"alert alert-#{alert_type}\">#{message}</div>")

removeMessageAlert = () ->
  setTimeout(() ->
    document.querySelector('.alert').outerHTML = ''
  , 3000)

WeatherApiEndpoint = (lat, lon) ->
  endpoint = '/weather'
  """
  #{endpoint}?lat=#{lat}&lon=#{lon}
  """

setFormFieldsFromGeolocation = (response_data) ->
  country_name = document.querySelector("option[data-country-code=\"#{response_data.sys.country}\"]").value

  newFormValues = {
    '#post_country': country_name,
    '#post_city': response_data.name
    '#post_latitude': response_data.coord.lat,
    '#post_longitude': response_data.coord.lon,
    '#post_temperature_celsius': response_data.main.temp,
    '#post_weather_condition': response_data.weather[0].main
  }

  for key, value of newFormValues
    document.querySelector(key).value = value

enableWeatherFormFields = () ->
  disabled_elements = ['post_city', 'post_country', 'post_city', 'post_latitude', 'post_longitude',
    'post_temperature_celsius', 'post_weather_condition'];
  disabled_elements.map( (el) ->
    document.getElementById(el).disabled = false
  )

requestWeatherData = (url) ->
  xhttp = new XMLHttpRequest
  xhttp.onreadystatechange = ->
    if @readyState == 4 and @status == 200
      response = JSON.parse(xhttp.responseText)

      if response.data.cod != '400'
        setFormFieldsFromGeolocation(response.data)
        removeMessageAlert()
      else
        enableWeatherFormFields()
    return

  xhttp.open 'GET', url, true
  xhttp.send()
  return

getGeolocation = () ->
  if navigator.geolocation
    navigator.geolocation.getCurrentPosition ((position) ->
      createMessageAlert('primary', 'Locating...')
      requestWeatherData WeatherApiEndpoint(position.coords.latitude, position.coords.longitude)
      return
    ), (error) ->
      createMessageAlert('warning', 'We were unable to locate you. Please fill the fields bellow manually.')
      enableWeatherFormFields()
      return

getGeolocation()