Skip to content
Search or jump toβ¦
Pull requests
Issues
Codespaces
Marketplace
Explore
 
@Rickpie 
Demian-Wicky
/
THP_W2D3
Public
Fork your own copy of Demian-Wicky/THP_W2D3
Code
Issues
Pull requests
Actions
Projects
Security
Insights
THP_W2D3/lib/03_stairway.rb /
@Demian-Wicky
Demian-Wicky update
Latest commit 463f74d on Nov 1, 2021
 History
 1 contributor
134 lines (114 sloc)  4.63 KB

def start_text
  puts
  puts "β­πβ­πβ­ BIENVENUE DANS DICEY STAIRWAYS β­πβ­πβ­"
  puts
  puts "β Parviens Γ  faire monter le scarabΓ©e πͺ²  au sommet de l'escalier !"
  puts "       Tu lanceras un dΓ© π² Γ  chaque tour :"
  puts "       5οΈβ£  ou 6οΈβ£ : Tu montes d'une marche"
  puts "       1οΈβ£ : Tu descends d'une marche"
  puts "       2οΈβ£  ou 3οΈβ£  ou 4οΈβ£ : Tu restes sur place"
end

###########################################################

def throw_dice
  values_emoji = ["1οΈβ£","2οΈβ£","3οΈβ£","4οΈβ£","5οΈβ£","6οΈβ£"]
  dice_value = rand(1..6)
  puts "ββββββββ¬ββββββββββββββββββββ"
  puts "β π²#{values_emoji[dice_value-1]}  β Tu as fait un #{dice_value} ! β"
  puts "ββββββββ΄ββββββββββββββββββββ"
  return dice_value
end

###########################################################

def move(dice_value)
  if dice_value == 5 || dice_value == 6 # si le dΓ© fait 5 ou 6
    puts "Tu montes une marche πΌ"
    step = 1
  elsif dice_value == 1 # si le dΓ© fait 1
    puts "Tu descends d'une marche π½"
    step = -1
  else # si le dΓ© fait 2, 3, ou 4 
    puts "Il ne se passe rien βΈοΈ"
    step = 0
  end
end

###########################################################

def show(position)
  x = [" ", " ", " ", " ", " ", " ", " ", " ", " ", " "]
  x[position-1] = "π£"

  puts
  puts"                            #{x[9]}   <- 10"
  puts"                         #{x[8]} βββ  <- 09"
  puts"                      #{x[7]} βββββ   <- 08"
  puts"                   #{x[6]} βββββββ    <- 07"
  puts"                #{x[5]} βββββββββ     <- 06     βββββββββ"
  puts"             #{x[4]} βββββββββββ      <- 05     β "+"%02d" % position + "/10 β"
  puts"          #{x[3]} βββββββββββββ       <- 04     βββββββββ"
  puts"       #{x[2]} βββββββββββββββ        <- 03"
  puts"    #{x[1]} βββββββββββββββββ         <- 02"
  puts" #{x[0]} βββββββββββββββββββ          <- 01"
  puts"βββββββββββββββββββββ"
  puts
end

###########################################################


def game
  position = 1
  turns_counter = 0
    while position != 10
      dice_value = throw_dice
      step = move(dice_value)
      position = position + step
      if position <= 0                      # pour ne pas pouvoir aller au sous-sol
        position = 1
        puts "TU NE PEUX PAS DESCENDRE PLUS BAS !"
      end
      puts "TU ES SUR LA MARCHE #{position}"
      turns_counter += 1                    # compteur de tours
    end

    puts "β  Il a fallu #{turns_counter} tours pour monter les escaliers." # affichage final compteur de tours
    return turns_counter
end

###########################################################

def real_game
  position = 1
   print "\033[2J\033[H"
  start_text
  show(position)
   gets
   print "\033[2J\033[H"
  turns_counter = 0
    while position != 10
      dice_value = throw_dice
      step = move(dice_value)
      position = position + step
      if position <= 0                      # pour ne pas pouvoir aller au sous-sol
        position = 1
        puts "TU NE PEUX PAS DESCENDRE PLUS BAS !"
      end
      puts "TU ES SUR LA MARCHE #{position}"
      turns_counter += 1                    # compteur de tours
      show(position)
       gets
       print "\033[2J\033[H"
    end

    puts "β  Il t'a fallu #{turns_counter} tours pour monter les escaliers." # affichage final compteur de tours
    return turns_counter
end

###########################################################

def average_finish_time # on obtient environ 48 de moyenne avec 10000 parties
  games = 100 # nombre de parties Γ  lancer

  total_turns = 0.00
  games.times do
    total_turns = total_turns + game
  end
  average = total_turns/games
  puts "Il a fallu #{average} tours en moyenne pour monter les escaliers avec #{games} Γ©chantillons"
  return average
end

###########################################################
#######       RUN ONE OF THOSE THREE FUNCTIONS       ######
###########################################################

real_game            ### runs game turn by turn (with 4K HD GRAPHICS)
#game                 ### runs auto
#average_finish_time

###########################################################
###########################################################
###########################################################
Footer
Β© 2023 GitHub, Inc.
Footer navigation
Terms
Privacy
Security
Status
Docs
Contact GitHub
Pricing
API
Training
Blog
About
THP_W2D3/03_stairway.rb at master Β· Demian-Wicky/THP_W2D3