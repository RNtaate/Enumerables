# a = [*1..9]
# hash = {
#     a: 1,
#     b: 2,
#     c: 3
# }

# p a.select { |x| x.even? }
# p a.any?(2) { |val| val > 21 }

p (1..20).map { |el| el * 2 }