module DogGetters
  class RandomDogs

    def get
      begin
        breeds_list.map { |breed| DogGetters::ByBreed.new(breed).get}.
          flatten.
          reject(&remove_invalid_urls).
          shuffle.
          uniq
      rescue
        raise "DOG API Didn't work"
      end
    end

  private

    def remove_invalid_urls
      Proc.new { |url| url == 'found' }
    end

    def breeds_list
      BreedListGetter.new.get.shuffle.last(10)
    end
  end
end
