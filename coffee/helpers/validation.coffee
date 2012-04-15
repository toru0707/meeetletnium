class Validation 
  constructor : (@rules) ->

  validate : () ->
    @errors = {}
    for rule in @rules 
      Titanium.API.info('rule:' + rule);
      obj = rule["obj"]
      Titanium.API.info('obj.hintText:' + obj.hintText);
      for v in rule["validators"] 
        Titanium.API.info('v:' + v + ", v[name]:" + v["name"] + ", v[value]:" + v["value"]);
        switch v["name"]
          when "reqd"
            if v["value"] == "true" 
              @errors[obj.hintText] = this.isValidNumber(obj.vaalue)
              Titanium.API.info('@errors[' + obj.hintText + '] :'+@errors[obj.hintText])
            else
              Titanium.API.info('else')


  validateWithItems : (rules) ->
    @rules = rules
    this.validate()

  #test is Valid Number => returns bool
  isValidNumber : (val) ->
      re=/^[-+]?\d+(\.\d+)?$/;
      Titanium.API.info('isValidNumber:' + re.test(val));
      return re.test(val);

  #test for integer
  isInteger : (val) ->
      re= /^[-+]?\d+$/;
      Titanium.API.info('isInteger:' + re.test(val));
      return re.test(val);
   
  #test for real val
  isReal : (val) ->
      re =/^[-+]?\d*\.?\d+$/;
      Titanium.API.info('isReal:' + re.test(val));
      return re.test(val);
   
   
  removeLastEntry : (val) ->
      Titanium.API.info('removeLastEntry:');
      return  val.slice(0,val.toString().length-1);
   
#test for empty
# check to see if input is whitespace only or empty
  isEmpty : ( val ) ->
      if ( null == val || "" == al ) 
          return true;
      return false;
   
#test if reqd
  isPresent : (val) ->
      re = /[^.*]/;
      Titanium.API.info('isPresent:' + re.test(val));
      return re.test(val);
   
#check for value in range
# check to see if value is within min and max
  isWithinRange : (val, min, max) ->
    if (val >= min && val <= max) 
        Titanium.API.info('isWithinRange:true');
        return true;
    else 
        Titanium.API.info('isWithinRange:false');
        return false;
      
   
# check to see if value is within min chars
  isMinChars : (val, min) ->
    if (val.toString().length >= min) 
        Titanium.API.info('isMinChars:true');
        return true;
     else 
        Titanium.API.info('isMinChars:false');
       return false;
      
   
# check to see if value is within max chars
  isWithinMaxChars : (val, max) ->
    if (val.toString().length <= max) 
        Titanium.API.info('isWithinMaxChars:true');
        return true;
     else 
        Titanium.API.info('isWithinMaxChars:false');
        return false;
 
  checkValidation : (obj) ->
    Titanium.API.info('checking validation');
#clear validation
    obj.color = obj.validation.color;

#keep record of validation colors
    if(!obj.validation.color)
        obj.validation.color = obj.color;


#set valuation highlight effect
    setEffect  (obj,isOff) ->
        if (isValid==false)
            return false;
        else
          if(!isOff)
            obj.color = 'Red';
            isValid = false;
          if(isOff)
            obj.color = obj.validation.color;
            isValid = true;
        return isOff;
    
    #eck if reqd
    if(obj.validation.reqd)
        setEffect(obj,isPresent(obj.value));
    

    #validation checks only if Value Present
    if(isPresent(obj.value))
      #eck for double value
      if(obj.validation.isdouble) 
          if (!setEffect(obj,isReal(obj.value)))
              setEffect(obj,isReal(obj.value));
      
    #check if need integer
    if(obj.validation.isinteger) 
        if (!setEffect(obj,isInteger(obj.value)))
            obj.value = removeLastEntry(obj.value);
    #check if need min 
    if(obj.validation.minchars) 
        setEffect(obj,isMinChars(obj.value,obj.validation.minchars));
    #check if max
    if(obj.validation.maxchars) 
        if(!setEffect(obj,isWithinMaxChars(obj.value,obj.validation.maxchars)))
          obj.value = removeLastEntry(obj.value);
#check within range
    if(obj.validation.range)
    
        setEffect(obj,isWithinRange(obj.value,obj.validation.range.min,obj.validation.range.max));
    Ti.API.info('isValid:' + isValid);  

