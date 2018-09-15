module DogGetters
  class ByBreed

    def initialize(breed)
      @breed = breed
    end

    def get
      begin
        response = HTTParty.get(dog_breed_url).body
        JSON.parse(response)['message'].last(5)
      rescue
        raise "DOG API Didn't work"
      end
    end

  private

    def dog_breed_url
      "https://dog.ceo/api/breed/#{@breed}/images"
    end
  end
end
