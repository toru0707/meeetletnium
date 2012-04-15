var Api;

Api = (function() {

  function Api(_base_url) {
    this.baseUrl = _base_url;
    this.http = Ti.Network.createHTTPClient();
  }

  Api.prototype.asyncReq = function(a) {
    var type, url,
      _this = this;
    url = this.baseUrl + a.url;
    type = a.type ? a.type : "GET";
    this.http.open(type, url);
    this.http.onload = function() {
      return a.success_handler(_this.responseText);
    };
    this.http.send();
    return Ti.API.log("async " + type + " from " + url + " is sended.");
  };

  Api.prototype.syncReq = function(a) {
    var result, type, url,
      _this = this;
    url = this.baseUrl + a.url;
    result = null;
    type = a.type ? a.type : "GET";
    this.http.onload = function() {
      return a.success_handler(_this.responseText);
    };
    this.http.open(type, url, false);
    this.http.send();
    Ti.API.log("sync " + type + " from " + url(" is sended."));
    return result;
  };

  Api.prototype.createEvent = function(title, date, city, station, budget, genre, shop, comment, maxNumber, deadline, privateOnly, participants) {
    var e;
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
    };
    Ti.API.log("createEvent api is called. ");
    return this.syncReq({
      url: 'events',
      type: 'POST',
      data: JSON.stringify({
        service: 'create-event',
        event: e
      })
    });
  };

  Api.prototype.createPreEvent = function(title, dates, cities, stations, budgets, genres, shops, comment, maxNumber, deadline, privateOnly, participants) {
    var e;
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
    };
    Ti.API.log("createPreEvent api is called. ");
    return this.syncReq({
      url: 'events',
      type: 'POST',
      data: JSON.stringify({
        service: 'create-pre-event',
        event: e
      })
    });
  };

  Api.prototype.replyPreEvent = function(event_id, dates, cities, stations, budgets, genres, shops, comment) {
    var pp;
    pp = {
      dates: dates,
      cities: cities,
      stations: stations,
      budgets: budgets,
      genres: genres,
      shops: shops,
      comment: comment
    };
    return this.syncReq({
      url: 'events/' + event_id,
      type: 'PUT',
      data: JSON.stringify({
        service: 'reply-event',
        participant: p
      })
    });
  };

  Api.prototype.replyEvent = function(event_id, attend, comment) {
    var p, response;
    p = {
      attend: attend,
      comment: comment
    };
    response = this.syncReq({
      url: 'events/' + event_id,
      type: 'PUT',
      data: JSON.stringify({
        service: 'reply-event',
        participant: p
      })
    });
    return response;
  };

  Api.prototype.cancelEvent = function(event_id) {
    var response;
    response = this.syncReq({
      url: 'events/' + event_id,
      type: 'DELETE',
      data: JSON.stringify({
        service: 'cancel-event'
      })
    });
    return response;
  };

  Api.prototype.deleteEvent = function(event_id) {
    var response;
    response = this.syncReq({
      url: 'events/' + event_id,
      type: 'DELETE',
      data: JSON.stringify({
        service: 'delete-event'
      })
    });
    return response;
  };

  Api.prototype.inviteFriends = function(event_id, friends) {
    var response;
    response = this.syncReq({
      url: 'events/' + event_id,
      type: 'PUT',
      data: JSON.stringify({
        service: 'invite-event',
        friends: friends
      })
    });
    return response;
  };

  Api.prototype.getPublicEvents = function(options, p) {
    var data, include_closed, include_history, only_my_owner, response, url;
    only_my_owner = options.only_my_owner;
    if (!only_my_owner) only_my_owner = false;
    include_closed = options.include_closed;
    if (!include_closed) include_closed = false;
    include_history = options.include_history;
    if (!include_history) include_history = false;
    url = 'events';
    data = {
      service: 'public-events',
      only_my_owner: only_my_owner,
      include_closed: include_closed,
      include_history: include_history
    };
    if (p) {
      response = this.syncReq({
        url: url,
        data: data
      });
      return response;
    }
    return this.asyncReq({
      url: url,
      data: data,
      success_handler: function(data) {
        return p(data);
      }
    });
  };

  Api.prototype.getMyEvents = function(options, p) {
    var data, include_closed, include_history, only_my_owner, response, url;
    only_my_owner = options.only_my_owner;
    if (!only_my_owner) only_my_owner = false;
    include_closed = options.include_closed;
    if (!include_closed) include_closed = false;
    include_history = options.include_history;
    if (!include_history) include_history = false;
    url = 'events';
    data = {
      service: 'my-events',
      only_my_owner: only_my_owner,
      include_closed: include_closed,
      include_history: include_history
    };
    if (!p) {
      response = this.syncReq({
        url: url,
        data: data
      });
      return response;
    }
    return this.asyncReq({
      url: url,
      data: data,
      success_handler: function(data) {
        return p(data);
      }
    });
  };

  Api.prototype.findMyEvents = function(keyword, options, p) {
    var data, include_closed, include_history, only_my_owner, response, url;
    only_my_owner = options.only_my_owner;
    if (!only_my_owner) only_my_owner = false;
    include_closed = options.include_closed;
    if (!include_closed) include_closed = false;
    include_history = options.include_history;
    if (!include_history) include_history = false;
    url = 'events';
    data = {
      service: 'find-events',
      keyword: keyword,
      only_my_owner: only_my_owner,
      include_closed: include_closed,
      include_history: include_history
    };
    if (!p) {
      response = this.syncReq({
        url: url,
        data: data
      });
      return response;
    }
    return this.asyncReq({
      url: url,
      data: data,
      success_handler: function(data) {
        return p(data);
      }
    });
  };

  Api.prototype.getEvent = function(id, p) {
    var response, url;
    url = 'events/' + id;
    if (!p) {
      response = this.syncReq({
        url: url
      });
      return response;
    }
    return this.asyncReq({
      url: url,
      success_handler: function(data) {
        return p(data);
      }
    });
  };

  Api.prototype.getAllGenres = function(p) {
    var response, url;
    url = 'genres';
    if (!p) {
      response = this.syncReq({
        url: url
      });
      return response;
    }
    return this.asyncReq({
      url: url,
      success_handler: function(data) {
        return p(data);
      }
    });
  };

  Api.prototype.getAllBudgets = function(p) {
    var response, url;
    url = 'budgets';
    if (!p) {
      response = this.syncReq({
        url: url
      });
      return response;
    }
    return this.asyncReq({
      url: url,
      success_handler: function(data) {
        return p(data);
      }
    });
  };

  Api.prototype.getAllPrefectures = function(p) {
    var response, url;
    url = 'prefectures';
    if (!p) {
      response = this.syncReq({
        url: url
      });
      return response;
    }
    return this.asyncReq({
      url: url,
      success_handler: function(data) {
        return p(data);
      }
    });
  };

  Api.prototype.getCities = function(prefecture_id, p) {
    var data, response, url;
    url = 'cities';
    data = {
      service: "get-cities",
      prefecture_id: prefecture_id
    };
    if (!p) {
      response = this.syncReq({
        url: url,
        data: data
      });
      return response;
    }
    return this.asyncReq({
      url: url,
      data: data,
      success_handler: function(data) {
        return p(data);
      }
    });
  };

  Api.prototype.findCities = function(name, prefecture_id, p) {
    var data, response, url;
    url = 'cities';
    data = {
      service: 'find-cities',
      name: name,
      prefecture_id: prefecture_id
    };
    if (!p) {
      response = this.syncReq({
        url: url,
        data: data
      });
      return response;
    }
    return this.asyncReq({
      url: url,
      data: data,
      success_handler: function(data) {
        return p(data);
      }
    });
  };

  Api.prototype.getTrains = function(prefecture_id, p) {
    var data, response, url;
    url = 'trains';
    data = {
      prefecture_id: prefecture_id
    };
    if (!p) {
      response = this.syncReq({
        url: url,
        data: data
      });
      return response;
    }
    return this.asyncReq({
      url: url,
      data: data,
      success_handler: function(data) {
        return p(data);
      }
    });
  };

  Api.prototype.getStations = function(train_id, p) {
    var data, response, url;
    url = 'stations';
    data = {
      service: 'get-stations',
      train_id: train_id
    };
    if (!p) {
      response = this.syncReq({
        url: url,
        data: data
      });
      return response;
    }
    return this.asyncReq({
      url: url,
      data: data,
      success_handler: function(data) {
        return p(data);
      }
    });
  };

  Api.prototype.findStations = function(name, p) {
    var data, response, url;
    url = 'stations';
    data = {
      service: 'find-stations',
      name: name
    };
    if (!p) {
      response = this.syncReq({
        url: url,
        data: data
      });
      return response;
    }
    return this.asyncReq({
      url: url,
      data: data,
      success_handler: function(data) {
        return p(data);
      }
    });
  };

  Api.prototype.findShops = function(keyword, prefecture_id, city_id, station_id, genre_id, p) {
    var data, response, url;
    url = 'shops';
    data = {
      service: 'find-shops',
      prefecture_id: prefecture_id,
      city_id: city_id,
      station_id: station_id,
      genre_id: genre_id,
      keyword: keyword
    };
    if (!p) {
      response = this.syncReq({
        url: url,
        data: data
      });
      return response;
    }
    return this.asyncReq({
      url: url,
      data: data,
      success_handler: function(data) {
        return p(data);
      }
    });
  };

  Api.prototype.postNews = function(date, content) {
    return this.syncReq({
      url: 'news',
      type: 'POST',
      data: JSON.stringify({
        service: 'post-news',
        news: {
          date: date,
          content: content
        }
      })
    });
  };

  Api.prototype.getNews = function(p) {
    var data, response, url;
    url = 'news';
    data = {
      service: 'get-news'
    };
    if (!p) {
      response = this.syncReq({
        url: url,
        data: data
      });
      return response;
    }
    return this.asyncReq({
      url: url,
      data: data,
      success_handler: function(data) {
        return p(data);
      }
    });
  };

  Api.prototype.getPrefectures = function(callback) {
    var url;
    url = "prefectures";
    if (callback) {
      return this.asyncReq({
        url: url,
        callback: callback
      });
    }
    return this.syncReq({
      url: url
    });
  };

  Api.prototype.getMyFriends = function(callback) {
    var data, url;
    url = "users/1";
    data = {
      service: 'get-my-friends'
    };
    if (callback) {
      return this.asyncReq({
        akurl: url,
        data: data,
        callback: callback
      });
    }
    return this.syncReq({
      url: url
    });
  };

  return Api;

})();
