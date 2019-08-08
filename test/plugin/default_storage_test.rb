require "test_helper"
require "shrine/plugins/default_storage"

describe Shrine::Plugins::DefaultStorage do
  before do
    @attacher = attacher { plugin :default_storage }
    @shrine   = @attacher.shrine_class
  end

  describe "Attacher" do
    describe "#initialize" do
      it "inherits default temporary and permanent storage" do
        @shrine.plugin :default_storage, cache: :other_cache, store: :other_store

        attacher = @shrine::Attacher.new

        assert_equal :other_cache, attacher.cache_key
        assert_equal :other_store, attacher.store_key
      end

      it "still allows overriding storage" do
        @shrine.plugin :default_storage, cache: :other_cache, store: :other_store

        attacher = @shrine::Attacher.new(cache: :cache, store: :store)

        assert_equal :cache, attacher.cache_key
        assert_equal :store, attacher.store_key
      end
    end
  end
end
