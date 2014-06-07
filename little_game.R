battleship <- function(num_guess = 5, cheat = F){
        ship_x <- sample.int(5, size = 1)
        ship_y <- sample.int(5, size = 1)
        if (cheat){
                print(ship_x)
                print(ship_y)
        }
        map =list(c('O', 'O', 'O', 'O', 'O'),
                  c('O', 'O', 'O', 'O', 'O'),
                  c('O', 'O', 'O', 'O', 'O'),
                  c('O', 'O', 'O', 'O', 'O'),
                  c('O', 'O', 'O', 'O', 'O'))
        for (r in map){
                print(r)
        }
        tr <- 0
        while (tr < num_guess){
                x <- as.numeric(readline('Guess the x:'))
                y <- as.numeric(readline('Guess the y:'))
                if (x <= 5 && y <= 5 && x > 0 && y > 0){ 
                        map[[y]][x] <- 'X'
                        for (r in map){
                                print(r)
                        }
                        if (x == ship_x & y == ship_y){
                                cat('Oh NO~~~You shrink my boat!!')
                                break
                        } else{
                                cat('You miss.')
                                tr <- tr + 1
                        }
                        if (tr >= num_guess){
                                cat('You loss.\n')
                                cat("The battleship's x-coordinate is", ship_x, '\n')
                                cat("The battleship's y-coordinate is", ship_y, '\n')
                        }
                } else {
                        cat('Invalid x or y coordinate.')
                }
        }
        
}

battleship(cheat = F, 10)
