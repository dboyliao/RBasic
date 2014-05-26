## This mini project is to write a simple script, which is consist
## of friend_info_update function and output one excel file friend_info
friend_info_update <- function(name_list, info_list){
        n_friends <- length(info_list)
        for (i in 1:n_friends){
                name <- name_list[[i]]
                info <- matrix(info_list[[i]], nrow = 1,
                               dimnames = list(NULL, names(info_list[[i]])))
                info <- as.data.frame(info)
                write.table(name, 'friend_info.csv', append = T,
                            sep = ',', row.names = F, col.names = F)
                write.table(info, 'friend_info.csv', append = T,
                            sep = ',', row.names = F, col.names = T)
        }
}

name_list <- list('Dboy', 'Boyo')
info_D <- c(phone = '0912110266', address = 'Kindom Far Far Away',
          email = 'qmalliao@farway.com', B_day= '1987/03/29')

info_B <- c(phone = '0911988987', address = 'Kindom Not So Far Away',
            email = 'boyo@notfaraway.com', B_day= '1988/02/13')

info_list <- list(info_D, info_B)

friend_info_update(name_list, info_list)
