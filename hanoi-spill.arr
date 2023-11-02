include image
include tables
  
tabell = table: A :: Number, B :: Number, C :: Number
  row: 0, 1, 0
  row: 0, 0, 2
  row: 3, 0, 0
  row: 4, 0, 0
end

pinne = circle(15, "solid", "black")
ring-xl = circle(100, "solid", "yellow")
ring-l = circle(80, "solid", "blue")
ring-m = circle(60, "solid", "green")
ring-s = circle(40, "solid", "red")

ring-rad = [raw-row: {1; ring-s}, {2; ring-m}, {3; ring-l}, {4; ring-xl}, ]


fun draw-towers():

  scene = put-image(pinne, 100, 100, put-image(pinne, 500, 100, put-image(pinne, 300, 100, empty-scene(600, 200))))

  var A = scene
  
  tab = tabell
    .get-column("A")
    .reverse()
    .each(lam(nummer): 
      if nummer == 0:
        A := A
      else:
        A := put-image(ring-rad.get-value(num-to-string(nummer)), 100, 100, A)
      end
    end
    )
  
  
  tab2 = tabell
    .get-column("B")
    .reverse()
    .each(lam(nummer): 
      if nummer == 0:
        A := A
      else:
        A := put-image(ring-rad.get-value(num-to-string(nummer)), 300, 100, A)
      end
    end
    )
  
  tab3 = tabell
    .get-column("C")
    .reverse()
    .each(lam(nummer): 
      if nummer == 0:
        A := A
      else:
        A := put-image(ring-rad.get-value(num-to-string(nummer)), 500, 100, A)
      end
    end
    )
  
  A
end

#|
fun move(from-tower, to-tower):
  # Check if the move is valid
  if is-valid-move(from-tower, to-tower):
    # Perform the move
    ring = remove-ring(from-tower)
    add-ring(to-tower, ring)
    # Redraw the towers
    draw-towers()
  end
end
#|

#|
fun play()
  
end

fun move()
  
end

fun back()
  
end

fun restart()
  
end

fun quit()
  
end
|#