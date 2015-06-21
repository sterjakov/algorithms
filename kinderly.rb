class Kinderly

  def brackets str
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

  def palindrome_in_anagram str
    size = str.size
    return 1 if size <= 1

    # Получаем возможные варианты перестановки букв
    # и убираем дубликаты
    all_combination = str.split("").permutation.to_a.uniq

    # Ищем палиндром
    all_combination.each do |combination|
      return 1 if combination == combination.reverse
    end

    return 0

  end

  def triangle array

    # Получаем возможные варианты расстановки массива по 3 значения
    # и убираем дубликаты
    array.permutation(3).to_a.uniq.each do |combination|
      return 1 if is_triangle?(combination[0], combination[1], combination[2])
    end

    return 0

  end

  def is_triangle? p, q, r

    n = 1000000

    if p >= 0 and q > p and r > q and n > r

      if (p + q) > r and (q + r) > p and (r + p) > q
        true
      else
        false
      end

    else
      false
    end

  end

end

k = Kinderly.new
#puts k.brakets '()()()'
#puts k.anagram_of_palindrome('ab')
#puts k.palindrome_in_anagram('aabcba')
#puts k.triangle([5,10,8])
