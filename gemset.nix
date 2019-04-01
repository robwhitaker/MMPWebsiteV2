{
  activemodel = {
    dependencies = ["activesupport"];
    groups = ["default"];
    platforms = [];
    source = {
      remotes = ["http://rubygems.org"];
      sha256 = "0mghh9di8011ara9h1r5a216yzk1vjm9r3p0gdvdi8j1zmkl6k6h";
      type = "gem";
    };
    version = "5.2.3";
  };
  activerecord = {
    dependencies = ["activemodel" "activesupport" "arel"];
    groups = ["default"];
    platforms = [];
    source = {
      remotes = ["http://rubygems.org"];
      sha256 = "0d6036f592803iyvp6bw98p3sg638mia5dbw19lvachx6jgzfvpw";
      type = "gem";
    };
    version = "5.2.3";
  };
  activesupport = {
    dependencies = ["concurrent-ruby" "i18n" "minitest" "tzinfo"];
    groups = ["default"];
    platforms = [];
    source = {
      remotes = ["http://rubygems.org"];
      sha256 = "110vp4frgkw3mpzlmshg2f2ig09cknls2w68ym1r1s39d01v0mi8";
      type = "gem";
    };
    version = "5.2.3";
  };
  arel = {
    source = {
      remotes = ["http://rubygems.org"];
      sha256 = "1jk7wlmkr61f6g36w9s2sn46nmdg6wn2jfssrhbhirv5x9n95nk0";
      type = "gem";
    };
    version = "9.0.0";
  };
  backports = {
    groups = ["default"];
    platforms = [];
    source = {
      remotes = ["http://rubygems.org"];
      sha256 = "0ba6n9l4kki56s2cszarps14zp2wlhw7nfawb8qwsxy3a57v4mw4";
      type = "gem";
    };
    version = "3.12.0";
  };
  builder = {
    source = {
      remotes = ["http://rubygems.org"];
      sha256 = "0qibi5s67lpdv1wgcj66wcymcr04q6j4mzws6a479n0mlrmh5wr1";
      type = "gem";
    };
    version = "3.2.3";
  };
  coderay = {
    source = {
      remotes = ["http://rubygems.org"];
      sha256 = "15vav4bhcc2x3jmi3izb11l4d9f3xv8hp2fszb7iqmpsccv1pz4y";
      type = "gem";
    };
    version = "1.1.2";
  };
  concurrent-ruby = {
    groups = ["default"];
    platforms = [];
    source = {
      remotes = ["http://rubygems.org"];
      sha256 = "1x07r23s7836cpp5z9yrlbpljcxpax14yw4fy4bnp6crhr6x24an";
      type = "gem";
    };
    version = "1.1.5";
  };
  i18n = {
    dependencies = ["concurrent-ruby"];
    groups = ["default"];
    platforms = [];
    source = {
      remotes = ["http://rubygems.org"];
      sha256 = "1hfxnlyr618s25xpafw9mypa82qppjccbh292c4l3bj36az7f6wl";
      type = "gem";
    };
    version = "1.6.0";
  };
  mail = {
    dependencies = ["mini_mime"];
    source = {
      remotes = ["http://rubygems.org"];
      sha256 = "00wwz6ys0502dpk8xprwcqfwyf3hmnx6lgxaiq6vj43mkx43sapc";
      type = "gem";
    };
    version = "2.7.1";
  };
  method_source = {
    groups = ["default" "development"];
    platforms = [];
    source = {
      remotes = ["http://rubygems.org"];
      sha256 = "1pviwzvdqd90gn6y7illcdd9adapw8fczml933p5vl739dkvl3lq";
      type = "gem";
    };
    version = "0.9.2";
  };
  mini_mime = {
    source = {
      remotes = ["http://rubygems.org"];
      sha256 = "1q4pshq387lzv9m39jv32vwb8wrq3wc4jwgl4jk209r4l33v09d3";
      type = "gem";
    };
    version = "1.0.1";
  };
  mini_portile2 = {
    source = {
      remotes = ["http://rubygems.org"];
      sha256 = "13d32jjadpjj6d2wdhkfpsmy68zjx90p49bgf8f7nkpz86r1fr11";
      type = "gem";
    };
    version = "2.3.0";
  };
  minitest = {
    source = {
      remotes = ["http://rubygems.org"];
      sha256 = "0icglrhghgwdlnzzp4jf76b0mbc71s80njn5afyfjn4wqji8mqbq";
      type = "gem";
    };
    version = "5.11.3";
  };
  multi_json = {
    source = {
      remotes = ["http://rubygems.org"];
      sha256 = "1rl0qy4inf1mp8mybfk56dfga0mvx97zwpmq5xmiwl5r770171nv";
      type = "gem";
    };
    version = "1.13.1";
  };
  mustermann = {
    source = {
      remotes = ["http://rubygems.org"];
      sha256 = "0lycgkmnyy0bf29nnd2zql5a6pcf8sp69g9v4xw0gcfcxgpwp7i1";
      type = "gem";
    };
    version = "1.0.3";
  };
  nokogiri = {
    dependencies = ["mini_portile2"];
    source = {
      remotes = ["http://rubygems.org"];
      sha256 = "0byyxrazkfm29ypcx5q4syrv126nvjnf7z6bqi01sqkv4llsi4qz";
      type = "gem";
    };
    version = "1.8.5";
  };
  pg = {
    source = {
      remotes = ["http://rubygems.org"];
      sha256 = "00vhasqwc4f98qb4wxqn2h07fjwzhp5lwyi41j2gndi2g02wrdqh";
      type = "gem";
    };
    version = "0.21.0";
  };
  pony = {
    dependencies = ["mail"];
    groups = ["default"];
    platforms = [];
    source = {
      remotes = ["http://rubygems.org"];
      sha256 = "1wa7lkblizc0zbzbga37padvnr386n5nvmjmfnl3ddinvwqx4hs5";
      type = "gem";
    };
    version = "1.13";
  };
  pry = {
    dependencies = ["coderay" "method_source"];
    source = {
      remotes = ["http://rubygems.org"];
      sha256 = "1mh312k3y94sj0pi160wpia0ps8f4kmzvm505i6bvwynfdh7v30g";
      type = "gem";
    };
    version = "0.11.3";
  };
  puma = {
    groups = ["default"];
    platforms = [];
    source = {
      remotes = ["http://rubygems.org"];
      sha256 = "1pkrbvak6rlf147qpd4zss031qrwwh53g8s6017037iwg0436kv3";
      type = "gem";
    };
    version = "3.12.1";
  };
  rack = {
    groups = ["default"];
    platforms = [];
    source = {
      remotes = ["http://rubygems.org"];
      sha256 = "1pcgv8dv4vkaczzlix8q3j68capwhk420cddzijwqgi2qb4lm1zm";
      type = "gem";
    };
    version = "2.0.6";
  };
  rack-protection = {
    dependencies = ["rack"];
    groups = ["default"];
    platforms = [];
    source = {
      remotes = ["http://rubygems.org"];
      sha256 = "15167q25rmxipqwi6hjqj3i1byi9iwl3xq9b7mdar7qiz39pmjsk";
      type = "gem";
    };
    version = "2.0.5";
  };
  rake = {
    groups = ["default"];
    platforms = [];
    source = {
      remotes = ["http://rubygems.org"];
      sha256 = "1sy5a7nh6xjdc9yhcw31jji7ssrf9v5806hn95gbrzr998a2ydjn";
      type = "gem";
    };
    version = "12.3.2";
  };
  sinatra = {
    dependencies = ["mustermann" "rack" "rack-protection" "tilt"];
    groups = ["default"];
    platforms = [];
    source = {
      remotes = ["http://rubygems.org"];
      sha256 = "1gasgn5f15myv08k10i16p326pchxjsy37pgqfw0xm66kcc5d7ry";
      type = "gem";
    };
    version = "2.0.5";
  };
  sinatra-activerecord = {
    dependencies = ["activerecord" "sinatra"];
    source = {
      remotes = ["http://rubygems.org"];
      sha256 = "0l41ls664v4nypd04hkwmrrw42rm70kplmjpwcl8zs1qjif9bjmp";
      type = "gem";
    };
    version = "2.0.13";
  };
  sinatra-contrib = {
    dependencies = ["backports" "multi_json" "mustermann" "rack-protection" "sinatra" "tilt"];
    groups = ["default"];
    platforms = [];
    source = {
      remotes = ["http://rubygems.org"];
      sha256 = "093blvpfy5n7s8knaav9a4pm4j7kck9zidwz942qqd4g99fnk443";
      type = "gem";
    };
    version = "2.0.5";
  };
  sqlite3 = {
    source = {
      remotes = ["http://rubygems.org"];
      sha256 = "01ifzp8nwzqppda419c9wcvr8n82ysmisrs0hph9pdmv1lpa4f5i";
      type = "gem";
    };
    version = "1.3.13";
  };
  thread_safe = {
    source = {
      remotes = ["http://rubygems.org"];
      sha256 = "0nmhcgq6cgz44srylra07bmaw99f5271l0dpsvl5f75m44l0gmwy";
      type = "gem";
    };
    version = "0.3.6";
  };
  tilt = {
    groups = ["default"];
    platforms = [];
    source = {
      remotes = ["http://rubygems.org"];
      sha256 = "0ca4k0clwf0rkvy7726x4nxpjxkpv67w043i39saxgldxd97zmwz";
      type = "gem";
    };
    version = "2.0.9";
  };
  tzinfo = {
    dependencies = ["thread_safe"];
    source = {
      remotes = ["http://rubygems.org"];
      sha256 = "1fjx9j327xpkkdlxwmkl3a8wqj7i4l4jwlrv3z13mg95z9wl253z";
      type = "gem";
    };
    version = "1.2.5";
  };
}