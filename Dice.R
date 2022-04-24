roll = function(f, ...) {
  if (typeof(f) == "character") {
    dice_functions = c(
      "add" = sum,
      "sub" = (function(...) head(..., 1) - sum(tail(..., -1))),
      "max-min" = (function(...) max(...) - min(...) ),
      "min" = min,
      "max" = max
    )
    f = dice_functions[[f]]
  }
  dice_table = expand.grid(...)
  dice_totals = apply(dice_table, 1, f)
  tot_frequency = table(dice_totals)
  tot_frequency
}

plot_roll = function(f, ...) {
  plot(roll(f, ...), xlab="Value", ylab="Frequency")
}

d4 = 1:4
d6 = 1:6
d8 = 1:8
d10 = 1:10
d12 = 1:12
d20 = 1:20
d100 = 1:100

plot_roll("sub", d6, d6)
