require "rails_helper"

RSpec.describe TeamLevelsController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "/team_levels").to route_to("team_levels#index")
    end

    it "routes to #new" do
      expect(get: "/team_levels/new").to route_to("team_levels#new")
    end

    it "routes to #show" do
      expect(get: "/team_levels/1").to route_to("team_levels#show", id: "1")
    end

    it "routes to #edit" do
      expect(get: "/team_levels/1/edit").to route_to("team_levels#edit", id: "1")
    end


    it "routes to #create" do
      expect(post: "/team_levels").to route_to("team_levels#create")
    end

    it "routes to #update via PUT" do
      expect(put: "/team_levels/1").to route_to("team_levels#update", id: "1")
    end

    it "routes to #update via PATCH" do
      expect(patch: "/team_levels/1").to route_to("team_levels#update", id: "1")
    end

    it "routes to #destroy" do
      expect(delete: "/team_levels/1").to route_to("team_levels#destroy", id: "1")
    end
  end
end
