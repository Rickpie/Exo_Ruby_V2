Skip to content
Search or jump to…
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
  puts "⭐🌟⭐🌟⭐ BIENVENUE DANS DICEY STAIRWAYS ⭐🌟⭐🌟⭐"
  puts
  puts "ⓘ Parviens à faire monter le scarabée 🪲  au sommet de l'escalier !"
  puts "       Tu lanceras un dé 🎲 à chaque tour :"
  puts "       5️⃣  ou 6️⃣ : Tu montes d'une marche"
  puts "       1️⃣ : Tu descends d'une marche"
  puts "       2️⃣  ou 3️⃣  ou 4️⃣ : Tu restes sur place"
end

###########################################################

def throw_dice
  values_emoji = ["1️⃣","2️⃣","3️⃣","4️⃣","5️⃣","6️⃣"]
  dice_value = rand(1..6)
  puts "┌──────┬───────────────────┐"
  puts "│ 🎲#{values_emoji[dice_value-1]}  │ Tu as fait un #{dice_value} ! │"
  puts "└──────┴───────────────────┘"
  return dice_value
end

###########################################################

def move(dice_value)
  if dice_value == 5 || dice_value == 6 # si le dé fait 5 ou 6
    puts "Tu montes une marche 🔼"
    step = 1
  elsif dice_value == 1 # si le dé fait 1
    puts "Tu descends d'une marche 🔽"
    step = -1
  else # si le dé fait 2, 3, ou 4 
    puts "Il ne se passe rien ⏸️"
    step = 0
  end
end

###########################################################

def show(position)
  x = [" ", " ", " ", " ", " ", " ", " ", " ", " ", " "]
  x[position-1] = "𓆣"

  puts
  puts"                            #{x[9]}   <- 10"
  puts"                         #{x[8]} ███  <- 09"
  puts"                      #{x[7]} █████   <- 08"
  puts"                   #{x[6]} ███████    <- 07"
  puts"                #{x[5]} █████████     <- 06     ┌───────┐"
  puts"             #{x[4]} ███████████      <- 05     │ "+"%02d" % position + "/10 │"
  puts"          #{x[3]} █████████████       <- 04     └───────┘"
  puts"       #{x[2]} ███████████████        <- 03"
  puts"    #{x[1]} █████████████████         <- 02"
  puts" #{x[0]} ███████████████████          <- 01"
  puts"█████████████████████"
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

    puts "ⓘ  Il a fallu #{turns_counter} tours pour monter les escaliers." # affichage final compteur de tours
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

    puts "ⓘ  Il t'a fallu #{turns_counter} tours pour monter les escaliers." # affichage final compteur de tours
    return turns_counter
end

###########################################################

def average_finish_time # on obtient environ 48 de moyenne avec 10000 parties
  games = 100 # nombre de parties à lancer

  total_turns = 0.00
  games.times do
    total_turns = total_turns + game
  end
  average = total_turns/games
  puts "Il a fallu #{average} tours en moyenne pour monter les escaliers avec #{games} échantillons"
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
© 2023 GitHub, Inc.
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
THP_W2D3/03_stairway.rb at master · Demian-Wicky/THP_W2D3