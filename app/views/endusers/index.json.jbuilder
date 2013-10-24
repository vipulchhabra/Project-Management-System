	json.array!(@endusers) do |enduser|
	  json.extract! enduser, :firstname, :lastname, :empno, :dateofbirth, :address
	  json.url enduser_url(enduser, format: :json)
	end
