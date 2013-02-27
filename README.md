draWord
=======

Rules
-----

1. Number of turns >= Number of players
2. Default: Max 5 players / 10 turns
3. A new drawer each turn (from a queue, not random)
4. The drawer can't draw letters or numbers
5. The word is random
6. A game starts when a room has at least two players
7. A room is destroyed when its last player leaves
8. When a player joins an ongoing game, he starts with 0 points
9. A new game starts 10 seconds after the last game ended if there are still 2+ players in the room
10. An ongoing game stops if there is only one player left in the room
11. If a player leaves as the drawer, the turn is canceled and a new drawer is chosen from the queue

About
-----

Created by Gabriel Malkas. Ruby on Rails/Redis/Websockets/Coffescript/Canvas

License
-------

MIT License.
See LICENSE for details.
=======
