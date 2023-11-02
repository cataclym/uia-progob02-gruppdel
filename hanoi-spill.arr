include image
include tables
  
tabell = table: A, B, C
  row: "ring-s", false, false
  row: "ring-m", false, false
  row: "ring-l", false, false
  row: "ring-xl", false, false
end

pinne = circle(15, "solid", "black")
ring-xl = circle(100, "solid", "yellow")
ring-l = circle(80, "solid", "blue")
ring-m = circle(60, "solid", "green")
ring-s = circle(40, "solid", "red")

ring-rad = [raw-row: {"ring-s"; ring-s}, {"ring-m"; ring-m}, {"ring-l"; ring-l}, {"ring-xl"; ring-xl}, ]

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
fun draw-towers():

  scene = put-image(pinne, 100, 100, put-image(pinne, 500, 100, put-image(pinne, 300, 100, empty-scene(600, 200))))

  A = scene
  
  tabell
    .get-column("A")
    .each(lam(ring): 
      put-image(ring-rad.get-value(ring), 100, 100, A)
    end
    )
  
  #    A = put-image(pinne, 100, 100)

  
    #| Plasserer sirklene på venstre pinne
  start-posisjon = put-image(pinne, 100, 100, put-image(rod-sirkel, 100, 100, put-image(gronn-sirkel, 100, 100, put-image(bla-sirkel, 100, 100, put-image(gul-sirkel, 100, 100, scene)))))
  start-posisjon
    |#
end