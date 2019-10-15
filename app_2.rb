require 'bundler'
Bundler.require

require_relative 'lib/game'
require_relative 'lib/player'

# D'abord on define les joueurs, un humain donc moi, et 2 autres qui sont des bots, puis on lance une boucle while
puts "_____________________________________________________________________________________________
       |Bienvenu sur 'ILS VEULENT TOUS MA POO'!|
       |Le but du jeu est d'être le dernier survivant!|
      _____________________________________________________________________________________________"

puts "Quel est ton prénom?"

name_player = gets.chomp

human_player1 = HumanPlayer.new(name_player)

enemies = []

enemies << player1 = Player.new("Josiane")
enemies << player2 = Player.new("José")

while human_player1.life_points > 0 && (enemies[0].life_points > 0 || enemies[1].life_points > 0)
#tant que le user humain soit vivant et qu'un des ennemies soit vivant on relance la boucle
        puts "voici l'état de chaque joueur: 
        #{human_player1.show_state}
        #{player1.show_state}
        #{player2.show_state}"

        puts "Quelle action veux-tu effectuer ? 
        a- chercher une meilleure arme
        s- chercher à se soigner"

        puts "attaquer un joueur en vue :
        0 - #{player1.show_state}
        1 - #{player2.show_state}"

        option_user = gets.chomp.to_s
        if option_user == "a"
            human_player1.search_weapon
        elsif option_user == "s"
            human_player1.search_health_pack
        elsif option_user == "0"
            human_player1.attacks(enemies[0])
        elsif option_user == "1"
            human_player1.attacks(enemies[1])
        end

        puts "Les autres joueurs t'attaquent ! appuie entrée!!"

        gets.chomp

        enemies.each do |x| # les bots vont m'attaquer s'ils sont encore vivants
            if x.life_points > 0
             x.attacks(human_player1)
            else
                puts "#{x.name} est mort il ne peut plus t'attaquer"

            end
        end
end


puts "GAME OVER!!"

if human_player1.life_points > 0
    puts "BRAVO ! TU AS GAGNE !"
else
    puts "Loser ! Tu as perdu !"
end


