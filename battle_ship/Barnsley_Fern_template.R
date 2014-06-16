rm(list = ls())
# 遞迴次數
iter = 10000
# 設定起始點 p 為 (0, 0) 的行向量。(以矩陣表示)
p = matrix(c(0, 0), ncol = 1)

coord = rbind(data.frame(), t(p))
for (i in 1:iter) {
        indicator <- runif(1)
        if (indicator <= 0.05) {
                m = matrix(c(0, 0, 0, 0.16), nrow = 2, ncol = 2)
                const = matrix(c(0, 0), ncol = 1)
        } else if (indicator > 0.05 && indicator <= 0.86){
                m = matrix(c(0.85, -0.04, 0.04, 0.85), nrow = 2, ncol = 2)
                const = matrix(c(0, 1.6), ncol = 1)
        } else if (indicator > 0.86 && indicator <= 0.93) {
                m = matrix(c(0.2, 0.23, -0.26, 0.22), nrow = 2, ncol = 2)
                const = matrix(c(0, 1.6), ncol = 1)
        } else {
                m = matrix(c(-0.15, 0.26, 0.28, 0.24), nrow = 2, ncol = 2)
                const = matrix(c(0, 0.44), ncol = 1)
        }
        p = m %*% p + const
        coord = rbind(coord, t(p))
}

plot(x = coord[, 2], y = coord[, 1], plt = c(0, 10, -5, 5), cex = 0.1, asp = 1)