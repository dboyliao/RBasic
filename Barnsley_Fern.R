rm(list = ls())

iter = 10000
p = runif(iter)
coord = matrix(c(0, 0), ncol = 1)
df = rbind(data.frame(), t(coord))
dis = c(0.05, 0.81, 0.07)
for (i in 1:iter) {
        if (p[i] <= dis[1]) {
                m = matrix(c(0, 0, 0, 0.16), nrow = 2, ncol = 2)
                const = matrix(c(0, 0), ncol = 1)
        } else if (p[i] > dis[1] && p[i] <= dis[1] + dis[2]) {
                m = matrix(c(0.85, -0.04, 0.04, 0.85), nrow = 2, ncol = 2)
                const = matrix(c(0, 1.6), ncol = 1)
        } else if (p[i] > dis[1] + dis[2] && p[i] <= sum(dis)) {
                m = matrix(c(0.2, 0.23, -0.26, 0.22), nrow = 2, ncol = 2)
                const = matrix(c(0, 1.6), ncol = 1)
        } else {
                m = matrix(c(-0.15, 0.26, 0.28, 0.24), nrow = 2, ncol = 2)
                const = matrix(c(0, 0.44), ncol = 1)
        }
        coord = m %*% coord + const
        df = rbind(df, t(coord))
}

plot(x = df[, 2], y = df[, 1], plt = c(0, 10, -5, 5), cex = 0.1, asp = 1)
