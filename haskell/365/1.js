trip = 0

msg.on('/play2', (args) => {
 var tidal = parseTidal(args)
  setTimeout(() => {
    tidal.s === "bd" && tidal.n === 4.0 ? trip += 0.5
    : tidal.s === "sd" ? trip = 0
    : null
  }, tidal.delta * 100)
})

osc(50, () => trip, 0.2)
    .out(o0)

shape(20)
  .modulate(o0)
    .out(o1)
