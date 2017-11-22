Football game

Class Human
  generals attributes:
  name, salary;

  methods:
    run, walk, stand;

Class Player < Human

  general attributes:
    number;
    team; (home/visitor)

  general methods:
    short_pass;
    long_pass;
    get the ball;
    defend;
    attack;
    foot_strike;
    head_strike;

Class Forward < Player
  methods:
    powerfull_strike;
    dash;
    dribling;

Class Defender < Player

  methods:
    push_enemy;
    pick_the_ball;
    pressure;
    foul;
    block_player;

Class Goalkeeper < Player
  methods:
    save;

Сlass Referee < Human
  methods:
    show_yellow_card;
    show_red_card:
    start_the_game;
    stop_the_game;
    pause_the_game;
    appoint_free_kick;
    appoint_penalty;


