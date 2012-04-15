class Api
  constructor: (_base_url) ->
    @baseUrl = _base_url
    @http = Ti.Network.createHTTPClient()
  
  asyncReq: (a) ->
    url = @baseUrl + a.url
    type = if a.type then a.type else "GET"
    @http.open(type, url)
    @http.onload = () =>
      a.success_handler this.responseText
    @http.send()
    Ti.API.log "async #{type} from #{url} is sended."
 
  syncReq: (a) ->
    url = @baseUrl + a.url 
    result = null
    type = if a.type then a.type else "GET"
    @http.onload = () =>
      a.success_handler this.responseText
    @http.open(type, url, false)
    @http.send()
    Ti.API.log "sync " + type + " from " + url " is sended."
    return result

  createEvent:(title,date,city,station,budget,genre,shop,comment,maxNumber,deadline,privateOnly,participants)->
    e = {
      title: title,
      date: date,
      city: city,
      station: station,
      budget: budget, 
      genre: genre,
      shop: shop,
      comment: comment,
      maxNumber: maxNumber,
      deadline: deadline,
      privateOnly: privateOnly,
      participants: participants
    }
    Ti.API.log "createEvent api is called. " 
    return this.syncReq({url: 'events', type: 'POST', data: JSON.stringify({service: 'create-event', event: e}) })
	
  createPreEvent: (title,dates,cities,stations,budgets,genres,shops,comment,maxNumber,deadline,privateOnly,participants) ->
    e = {
      title: title,
      dates: dates,
      cities: cities,
      stations: stations,
      budgets: budgets, 
      genres: genres,
      shops: shops,
      comment: comment,
      maxNumber: maxNumber,
      deadline: deadline,
      privateOnly: privateOnly,
      participants: participants
    }
    Ti.API.log "createPreEvent api is called. " 
    return this.syncReq({url: 'events', type: 'POST',	data: JSON.stringify({service: 'create-pre-event', event: e})})

  replyPreEvent: (event_id, dates, cities, stations, budgets, genres, shops, comment) ->
    pp = {
        dates: dates,
        cities: cities,
        stations: stations,
        budgets: budgets,
        genres: genres,
        shops: shops,
        comment: comment
    }
    return this.syncReq {
      url: 'events/' + event_id,
      type: 'PUT',
      data: JSON.stringify {service: 'reply-event', participant: p}
    }

  replyEvent: (event_id, attend, comment) ->
    p = {
        attend: attend,
        comment: comment
    }
    response = this.syncReq {
      url: 'events/' + event_id,
      type: 'PUT',
      data: JSON.stringify {service: 'reply-event', participant: p}
    }
    return response

  cancelEvent: (event_id) ->
    response = this.syncReq {
      url: 'events/' + event_id,
      type: 'DELETE',
      data: JSON.stringify {service: 'cancel-event'}
    }
    return response

  deleteEvent: (event_id) ->
    response = this.syncReq {
      url: 'events/' + event_id,
      type: 'DELETE',
      data: JSON.stringify {service: 'delete-event'}
    }
    return response
  
  inviteFriends: (event_id, friends) ->
    response = this.syncReq {
      url: 'events/' + event_id,
      type: 'PUT',
      data: JSON.stringify {service: 'invite-event', friends: friends}
    }
    return response
  
  getPublicEvents: (options, p) ->
    only_my_owner = options.only_my_owner 
    if !only_my_owner
      only_my_owner = false
    include_closed = options.include_closed
    if !include_closed 
      include_closed = false
    include_history = options.include_history
    if !include_history
      include_history = false

    url = 'events'
    data = {
      service: 'public-events', 
      only_my_owner: only_my_owner,
      include_closed: include_closed,
      include_history: include_history}

    if p
      response = this.syncReq({
        url: url,
        data: data
      })
      return response
    
    this.asyncReq {
      url: url,
      data: data,
      success_handler: (data) ->
        p data
    }
  
  getMyEvents: (options, p) ->
    only_my_owner = options.only_my_owner 
    if !only_my_owner
      only_my_owner = false
    include_closed = options.include_closed
    if !include_closed
      include_closed = false
    include_history = options.include_history
    if !include_history
      include_history = false
    
    url = 'events'
    data = {
      service: 'my-events',
      only_my_owner: only_my_owner,
      include_closed: include_closed, 
      include_history: include_history}
    if !p 
      response = this.syncReq {
        url: url,
        data: data
      }
      return response
    
    this.asyncReq {
        url: url,
        data: data,
        success_handler: (data) ->
          p(data)
    }
  
  findMyEvents: (keyword, options, p) ->
    only_my_owner = options.only_my_owner 
    if !only_my_owner
      only_my_owner = false
    include_closed = options.include_closed
    if !include_closed
      include_closed = false
    include_history = options.include_history
    if !include_history
      include_history = false
    
    url = 'events'
    data = {
      service: 'find-events',
      keyword: keyword, 
      only_my_owner: only_my_owner,
      include_closed: include_closed, 
      include_history: include_history}
    if !p
      response = this.syncReq {
        url: url,
        data: data
      }
      return response
    
    this.asyncReq {
        url: url,
        data: data,
        success_handler: (data) ->
          p(data)
    }
  
  getEvent: (id, p) ->
    url = 'events/' + id
    if !p 
      response = this.syncReq({
        url: url
      })
      return response
    this.asyncReq {
      url: url,
      success_handler: (data) ->
        p data
    }
  
  getAllGenres: (p) ->
    url = 'genres'
    if !p
      response = this.syncReq {
        url: url
      }
      return response
    this.asyncReq {
      url: url,
      success_handler: (data) ->
        p data
    }
  
  getAllBudgets: (p) ->
    url = 'budgets'
    if !p
      response = this.syncReq {
        url: url
      }
      return response
    
    this.asyncReq {
      url: url,
      success_handler: (data) ->
        p data
    }

  getAllPrefectures: (p) ->
    url = 'prefectures'
    if !p
      response = this.syncReq {
        url: url
      }
      return response
    this.asyncReq {
      url: url,
      success_handler: (data) ->
        p data
    }

  getCities: (prefecture_id, p) ->
    url = 'cities'
    data = {service: "get-cities", prefecture_id: prefecture_id}
    if !p
      response = this.syncReq {
        url: url,
        data: data
      }
      return response
    this.asyncReq {
      url: url,
      data: data,
      success_handler: (data) ->
        p data
    }
  
  findCities: (name, prefecture_id, p) ->
    url = 'cities'
    data = {service: 'find-cities', name: name, prefecture_id: prefecture_id}
    if !p
      response = this.syncReq {
        url: url,
        data: data
      }
      return response
    
    this.asyncReq {
      url: url,
      data: data,
      success_handler: (data) ->
        p data
    }

  getTrains: (prefecture_id, p) ->
    url = 'trains'
    data = {prefecture_id: prefecture_id}
    if !p
      response = this.syncReq {
        url: url,
        data: data
      }
      return response
    
    this.asyncReq {
      url: url,
      data: data,
      success_handler: (data) ->
        p data
    }

  getStations: (train_id, p) ->
    url = 'stations'
    data = {service: 'get-stations', train_id: train_id}
    if !p
      response = this.syncReq {
        url: url,
        data: data
      }
      return response
    
    this.asyncReq {
      url: url,
      data: data,
      success_handler: (data) ->
        p data
    }
  
  findStations: (name, p) ->
    url = 'stations'
    data = {service: 'find-stations', name: name}
    if !p
      response = this.syncReq {
        url: url,
        data: data
      }
      return response
    
    this.asyncReq {
      url: url,
      data: data,
      success_handler: (data) ->
        p data
    }

  findShops: (keyword, prefecture_id, city_id, station_id, genre_id, p) ->
    url = 'shops'
    data = {
      service: 'find-shops', 
      prefecture_id: prefecture_id, 
      city_id: city_id,
      station_id: station_id,
      genre_id: genre_id,
      keyword: keyword}
    if !p
      response = this.syncReq {
        url: url,
        data: data
      }
      return response
    
    this.asyncReq {
      url: url,
      data: data,
      success_handler: (data) ->
        p data
    }

  postNews: (date, content) ->
    this.syncReq {
      url: 'news',
      type: 'POST',
      data: JSON.stringify {service: 'post-news', news: {date: date, content: content}}
    }
  
  getNews: (p) ->
    url = 'news'
    data = {service: 'get-news'}
    if !p
      response = this.syncReq {
        url: url,
        data: data
      }
      return response
    
    this.asyncReq {
      url: url,
      data: data,
      success_handler: (data) ->
        p data
    }

  getPrefectures: (callback) ->
    url = "prefectures"
    if callback 
      return this.asyncReq {url: url, callback : callback}
    return this.syncReq {url: url}
    
  getMyFriends: (callback) ->
    url = "users/1"
    data = {service : 'get-my-friends'}
    if callback 
      return this.asyncReq {akurl: url, data : data, callback : callback}
    return this.syncReq {url: url}
