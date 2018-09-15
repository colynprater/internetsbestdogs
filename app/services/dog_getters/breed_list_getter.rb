module DogGetters

  class BreedListGetter

    def get
      response = HTTParty.get('https://dog.ceo/api/breeds/list/all').body

      JSON.parse(response)['message'].map(&:flatten).flatten
    end
  end
end
