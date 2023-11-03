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

pinne = circle(15, "solid", "black")
ring-xl = circle(100, "solid", "yellow")
ring-l = circle(80, "solid", "blue")
ring-m = circle(60, "solid", "green")
ring-s = circle(40, "solid", "red")

ring-rad = [raw-row: {1; ring-s}, {2; ring-m}, {3; ring-l}, {4; ring-xl}, ]


fun draw-towers():

  var scene = put-image(pinne, 100, 100, put-image(pinne, 500, 100, put-image(pinne, 300, 100, empty-scene(600, 200))))

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

fun remove-ring(tower :: String):
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

fun move(tower :: String, to-tower :: String):
  if is-valid-move(tower, to-tower):
    block:
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
    print("Det trekket er ikke gyldig. ❌")
  end
end

fun is-valid-move(from-tower :: String, to-tower :: String):
  number-from-tower = get-ring(from-tower)
  number-to-tower = get-ring(to-tower)
  
  (number-from-tower < number-to-tower) or (number-to-tower == 0)
end

fun get-ring(tower :: String):
  number-list = tabell.get-column(tower)
    .filter(lam(number): number > 0 end)

  if number-list.length() > 0:
    number-list.get(0)
  else:
    0
  end
end

#|
   fun back()

   end

   fun restart()

   end

   fun quit()

   end
|#