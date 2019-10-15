
class Player

    attr_accessor :name, :life_points


    def initialize (name) # on crée un nouveau joueur

        @name = name
        
        @life_points = 10

    end

    def show_state #montre les ponts de vie actuel du joueur.

        if @life_points < 0 
            @life_points = 0
        end
        return "#{@name} a #{@life_points} points de vie"

    end

    def gets_damage(damage) # soustrait les point indiques dans l'argument des point de vie

        @life_points = @life_points - damage
        
        if @life_points <= 0
            puts "le joueur #{@name} a été tué !"
        end
    end

    def attacks(player_2)#l'autre player attaque au player_2

        puts "le joueur #{@name} attaque le joueur #{player_2.name}"
        damage_inflicted = compute_damage
        puts "il lui inflige #{damage_inflicted} points de dommages"
        player_2.gets_damage(damage_inflicted)  
    end

    def compute_damage
        return rand(1..6)
    end

end

class HumanPlayer < Player # Cette class permet a un utilisateur de jouer avec plus de fonctionaliteś

    attr_accessor :weapon_level
    
    def initialize(name) # on crée un nouveau joueur humain cette fois ci
        @name = name

        @life_points = 100

        @weapon_level = 1
    end

    def show_state #montre les ponts de vie actuel du joueur et le niveau de l'arme.

        return "#{@name} a #{@life_points} points de vie et une arme de niveau #{@weapon_level}"  
    end

    
    def compute_damage
        return rand(1..6) * @weapon_level
    end


    def search_weapon # va nous donner le niveau de l'arme trouvée compris de 1 a 6

        weapon_level_found = rand(1..6)
        
        puts "tu as trouvé une arme de nuveau #{weapon_level_found}"

        if @weapon_level < weapon_level_found

            @weapon_level = weapon_level_found

            puts "Youhou ! elle est meilleure que ton arme actuelle : tu la prends."

        else
            @weapon_level = @weapon_level

            puts "Merde... elle n'est pas mieux que ton arme actuelle."
        

        end


    end


    def search_health_pack # partir à la recherche d'un pack de points de vie afin de faire remonter leur niveau de vie.

        health_pack_found = rand(1..6)

        if health_pack_found == 1
            puts "Tu n'as rien trouvé... "
        elsif health_pack_found >= 2 && health_pack_found <= 5
             if @life_points + 50 < 100
                    @life_points += 50
             else
                @life_points = 100
             end

            puts "Bravo, tu as trouvé un pack de +50 points de vie !"
            puts "Ton niveau de points de vie est de #{@life_points}"

        elsif health_pack_found == 6
            if @life_points + 80 < 100
                    @life_points +=  80
            else 
                @life_points = 100
            end

            puts  "Waow, tu as trouvé un pack de +80 points de vie !"
            puts "Ton niveau de points de vie est de #{@life_points}"

        end


    end
end


