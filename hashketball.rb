# Write your code here!
require "pry"

def game_hash
  game_hash = {
    home: {
      team_name: "Brooklyn Nets", 
      colors: ["Black", "White"], 
      players: {
        "Alan Anderson" => {number: 0, shoe: 16, points: 22, rebounds: 12, assists: 12 , steals: 3, blocks: 1, slam_dunks: 1},
        "Reggie Evans" => {number: 30, shoe: 14, points: 12, rebounds: 12, assists: 12, steals: 12, blocks: 12, slam_dunks: 7},
        "Brook Lopez" => {number: 11, shoe: 17, points: 17, rebounds: 19, assists: 10, steals: 3, blocks: 1, slam_dunks: 15},
        "Mason Plumlee" => {number: 1, shoe: 19, points: 26, rebounds: 12, assists: 6, steals: 3, blocks: 8, slam_dunks: 5},
        "Jason Terry" => {number: 31, shoe: 15, points: 19, rebounds: 2, assists: 2, steals: 4, blocks: 11, slam_dunks: 1}
        } 
      },
    away: {
      team_name: "Charlotte Hornets", 
      colors: ["Turquoise", "Purple"], 
      players: {
        "Jeff Adrien" => {number: 4, shoe: 18, points: 10, rebounds: 1, assists: 1, steals: 2, blocks: 7, slam_dunks: 2},
        "Bismak Biyombo" => {number: 0, shoe: 16, points: 12, rebounds: 4, assists: 7, steals: 7, blocks: 15, slam_dunks: 10},
        "DeSagna Diop" => {number: 2, shoe: 14, points: 24, rebounds: 12, assists: 12, steals: 4, blocks: 5, slam_dunks: 5},
        "Ben Gordon" => {number: 8, shoe: 15, points: 33, rebounds: 3, assists: 2, steals: 1, blocks: 1, slam_dunks: 0},
        "Brendan Haywood" => {number: 33, shoe: 15, points: 6, rebounds: 12, assists: 12, steals: 22, blocks: 5, slam_dunks: 12}
      }
    }
  }
end


def num_points_scored(player)
score = ""
  game_hash.each do |location, data|
    data.each do |attribute, specs|
      if specs.include?(player)
        binding.pry
      score = specs[:points]
      end
    end
  end
  return score
end

def shoe_size(player)
  game_hash.each do |location, data|
    data.each do |attribute, specs|
      if specs.include?(player)
        return game_hash[location][attribute][player][:shoe]
      end
    end
  end
end

def team_colors(team_name)
  # iterate over game_hash first level
  game_hash.each do |location, data|
    # store the values of both our locations
    results = game_hash[location].values
    # if our values include the team name passed as parameter
    if results.include?(team_name)
      # then we iterate through our data to find if there is the colors attribute
      data.each do |attribute, specs|
        if attribute == :colors 
        return specs
        end
      end
    end
  end
end

team_colors("Brooklyn Nets")

def team_names
  # iterate through game_hash to find team_name 
  game_hash.collect do |location, data|
    data[:team_name]
  end
end

def player_numbers(team)
  player_numbers = []
  game_hash.each do |location, data|
    if game_hash[location].values.include?(team)
      data.each do |attribute, specs|
        # look specifically to players hashes
        if specs.class == Hash
          specs.each do |player, spec|
            spec.each do |stat, num|
              if stat == :number
                player_numbers << num
              end
            end
          end
        end
      end
    end
  end
  player_numbers
end 

player_numbers("Brooklyn Nets")

def player_stats(player)
  game_hash.each do |location, data|
    data.each do |attributes, specs|
      if specs.include?(player)
        return game_hash[location][attributes][player]
      end
    end
  end
end

player_stats("Alan Anderson")

def big_shoe_rebounds
  # First, find the player with the largest shoe size
  shoe_size = 0
  player_found = ""
  game_hash.each do |location, data|
    data.each do |attributes, specs|
      if specs.class == Hash 
        specs.each do |player, infos|
          infos.each do |spec, stat|
            if spec == :shoe
              if stat > shoe_size 
              shoe_size = stat
              player_found = player
              end
            end
          end
        end
        # Then, return that player's number of rebounds
        return game_hash[location][attributes][player_found][:rebounds]
      end
    end
  end
end

big_shoe_rebounds

num_points_scored("Alan Anderson")






