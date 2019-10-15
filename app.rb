require 'bundler'
Bundler.require

require_relative 'lib/game'
require_relative 'lib/player'

player1 = Player.new("Josiane")
player2 = Player.new("José")

### la boucle while lance le combat et si les points de vie est inferieur à 0 on sort de la blucle

while player1.life_points > 0 && player2.life_points > 0


    puts "voici l'état de chaque joueur: \n#{player1.show_state} \n#{player2.show_state}\n\n"
    

    puts "Passons à la phase d'attaque :"


    player1.attacks(player2)

    break if player2.life_points <= 0 

    player2.attacks(player1)

end


