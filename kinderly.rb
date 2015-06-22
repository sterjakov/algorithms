class Kinderly

  def brackets str

    # Если один символ то уже не верно
    size = str.size
    return 1 if size == 0

    # открытая скобка прибавляет к счетчику 1, закрытая уменьшает на 1
    # если в итоге получилось 0 - properly nested

    open_bracket_counter = 0

    for i in 0..size-1 do
      open_bracket_counter += 1 if str[i] == '('
      open_bracket_counter -= 1 if str[i] == ')'
      # если первая скобка ')', значит счетчик уйдёт в минус и нам все ясно
      return 0 if open_bracket_counter == -1
    end

    return open_bracket_counter == 0 ? 1 : 0

  end

  def palindrome str

    # Если это одна буква то она палиндром
    size = str.size
    return 1 if size <= 1

    # Получаем возможные варианты перестановки букв
    combinations = str.split("").permutation.to_a
    combinations_size = combinations.size

    # Ищем палиндром
    for i in 0..combinations_size-1 do
      return 1 if combinations[i] == combinations[i].reverse
    end

    return 0

  end

  def triangle combinations, c = 0

    # Если массив пустой
    return 0 if combinations.empty?

    # Если это первая итерация
    if c == 0

      # Получаем все возможные варианты расстановки массива по 3 значения
      combinations = combinations.permutation(3).to_a

    end

    # Счетчик
    c += 1

    p = combinations[0][0]
    q = combinations[0][1]
    r = combinations[0][2]
    n = 1000000

    # Если это треугольник
    if p >= 0 and q > p and r > q and n > r and (p + q) > r and (q + r) > p and (r + p) > q
      return 1
    else
      combinations.shift
      triangle combinations, c
    end

  end

end

k = Kinderly.new

# return 1
puts k.brackets '(()()()())'
puts k.palindrome('dooernedrn')
puts k.triangle([5,10,8])

# return 0
puts k.brackets '(()()()()'
puts k.palindrome('dooernedr1')
puts k.triangle([10,50,5,1])