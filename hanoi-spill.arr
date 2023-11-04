include image
include tables

var tabell = table: A :: Number, B :: Number, C :: Number
  row: 1, 0, 0
  row: 2, 0, 0
  row: 3, 0, 0
  row: 4, 0, 0
end

winning-tabell = table: A :: Number, B :: Number, C :: Number
  row: 0, 0, 1
  row: 0, 0, 2
  row: 0, 0, 3
  row: 0, 0, 4
end

var previous-tabell = table: A :: Number, B :: Number, C :: Number end

pinne = circle(15, "solid", "black")
ring-xl = circle(100, "solid", "yellow")
ring-l = circle(80, "solid", "blue")
ring-m = circle(60, "solid", "green")
ring-s = circle(40, "solid", "red")

ring-rad = [raw-row: {1; ring-s}, {2; ring-m}, {3; ring-l}, {4; ring-xl}, ]

fun create-scene():
  put-image(pinne, 100, 100, put-image(pinne, 500, 100, put-image(pinne, 300, 100, empty-scene(600, 200))))
end

fun draw-towers():

  var scene = create-scene()

  fun draw-tower(tower :: String):

    var horizontal-location = 100

    block:
      if (tower == "A"):
        horizontal-location := 100
      else if (tower == "B"):
        horizontal-location := 300
      else if (tower == "C"):
        horizontal-location := 500
      end

      tabell
        .get-column(tower)
        .reverse()
        .each(lam(nummer): 
          if nummer == 0:
            scene := scene
          else:
            scene := put-image(pinne, horizontal-location, 100, put-image(ring-rad.get-value(num-to-string(nummer)), horizontal-location, 100, scene))
          end
        end)
    end
  end

  block:
    tabell.column-names().each(lam(tower): draw-tower(tower) end)
    scene
  end
end

fun remove-ring(tower :: String) -> Number:
  number = tabell.get-column(tower)
    .filter(lam(number): number > 0 end).get(0)

  block:
    tabell := tabell.transform-column(tower, lam(numb): 
        if (numb == number):
          0
        else: 
          numb
        end
      end)
    number
  end
end

fun add-ring(tower :: String, ring :: Number):
  block:
    column = tabell
      .get-column(tower)
      .set(ring - 1, ring)

    removed-old-tower = tabell.drop(tower)

    tabell := removed-old-tower.add-column(tower, column)
  end
end

fun play():
  draw-towers()
end

fun move(tower-input :: String, to-tower-input :: String):

  tower = string-to-upper(tower-input)
  to-tower = string-to-upper(to-tower-input)

  if is-valid-move(tower, to-tower):
    block:
      previous-tabell := tabell
      ring = remove-ring(tower)
      add-ring(to-tower, ring)
      if (tabell == winning-tabell):
        block:
          print("Du vant!!! 👑")
          draw-towers()
        end
      else: 
        draw-towers()
      end
    end
  else:
    block:
      print("Det trekket er ikke gyldig. ❌")
      draw-letters()
    end
  end
end

fun is-valid-move(from-tower :: String, to-tower :: String) -> Boolean:
  number-from-tower = get-ring(from-tower)
  number-to-tower = get-ring(to-tower)

  (number-from-tower < number-to-tower) or (number-to-tower == 0)
end

fun get-ring(tower :: String) -> Number:
  number-list = tabell.get-column(tower)
    .filter(lam(number): number > 0 end)

  if number-list.length() > 0:
    number-list.get(0)
  else:
    0
  end
end

fun back():
  block:
    tabell := previous-tabell
    draw-towers()
  end
end

fun draw-letters():
  scene = create-scene()
  put-image(text("C", 80, "black"), 500, 40, put-image(text("B", 80, "black"), 300, 40, put-image(text("A", 80, "black"), 100, 40, scene)))
end

block:  
  print("Velkommen til Hanoi-spillet til grubbe 5b!")
  print("For å spille kan du bruke move('A', 'B'), hvor 'A' og 'B' er tårn, og det siste tårnet er 'C'.")
  print("Start spillet ved å skrive play() 🎮😄")
  print("Du kan også angre ett trekk ved å skrive back().")
  draw-letters()
end
draw-towers()