#!/usr/bin/env bash

ssh-keygen -b 2048 -t rsa -f /home/ubuntu/.ssh/id_rsa -q -N ""

tee -a ~/.ssh/config << END
Host *
    StrictHostKeyChecking no
END

sudo chmod 400 ~/.ssh/config

tee -a ~/.ssh/authorized_keys << END
ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDmkucjsvcBUsa261Cg+WOv2UdBH24RZ+rhkxI/9UEV8IJk6rZzRHfy72C20mJhRYXq7QYSgdHA41bd/EwCIVaVUOlRA6tCeoWfEN39Kw5Q55QykBDdS/u8rxWvEhvRqZFkReDxyg19qpzzX5Z1WX+Q3luPCCmYUXocWz3sXgQB67wBRKUYi6aFXYGdNrGWzvrjpf0YEhqpG1XENYe5634Cx3u6gDQ3E3IvMY1lgk6C+FhIO8KKnSrbIZiGKJMVk20RoztoQ1PZ2BvuX7ClGnWe2LqKi0RcqOSu2pmzbdUGT2tsK+4OlGam5hFzaP07/KTvAGRY1LhxGgN29eupQ1vP ubuntu@master1
ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDn5UsHN0vJvrmV8o9IEl7Af4TIWqFTBe4A5XwYQSojSRJB4Bu1EXPRJSWdspJcakQx25JHht2DZlbj0/AGsdzjAVapYJH4vng5HnVUZkGZnliOY2Wt5eTO6RfQLYVJJdHmTNtmDftYV39bZAa+ABA7l9ZLrmq/ZDtI698E79rnI3smfAhLkoUjA+jgaaxnjLuQrU0oJLuCAWn/uqxUT7r7SGIHtLmviz8CKVvPmu09kwQ8qkxlnJiQRkFSECcjeDvXR62Am+XcY94/UnQq2L3B/YE1ieHk7A4mhaPxzvw03lPGnWY05QMbDDDlC84H5rqrpAaSZoubDJ3lIeYUIsNd ubuntu@node1
ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDAIgh4tcmScvfIIT/P7UdgwMU2KkW2dq/VSNUcHYgh3V03MPRhCaJ46Y7O4iNUfZ4gpyYF25Xn6RB9BjQFY4Wm58b3d4bSwi14LPgrTDb+Z2UGqE09RtmOHP1/ewygmEKwwwGyRN714d6Z8QQL98GfA8U6Uofc2mug2d1tgQgtJW2c/WaTKcGF9e3hG8sztEs8Tl6z7IckgASIgNTKyX471DZXwsz2FKUD2SCy/+k81z9TFajgVqbyXK9aXmict8FL2rjsz5IBBPJczbor+1jXMhMoJN1+0Z/WrCgR5PUiFd1VsPLivKKvp1dYfqFCiPUD7/KBCUqCRZfuHh1Iz28n ubuntu@master2
ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQC9PGdjFNUkul8gDEW9lqNFyvuwXLgNfc48vwAVkfIemdCBXIG9wKEg7gCagvLPIpuqBvc8d5ESukSwZkoj/EvkowyROgMFEUblitCsmhdPsiqR/hO+b/UsHQE8PpBvo5fEThD0eeRlPXab16+MlFqn+sVjEBiyvEeHXF5PEKoY6/5Pa2jfz0xAxDTBcJwe4t7y71CG8tAOOUycw2mR952ji7PLOjYNHi0I+cLk5RtTkFu32+RTYrWmUTJjmcGnJDMFSZtmBjzCGajOr7P3IjCMZFQrsmAXsYSKQKsN50QkZ3TWYiTZxA7/6zcnln1J9zDLSj8ksBU0nmLw/EJFGKBX ubuntu@node2
ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQConkJDCWDxF78krRxKPI1cm/XAaM8PBmbFh8gm1RoMkQi9uwNUOt6kn3aq2MtSNHYW1OS63LD2el0eTTRDLzOF1hH0LaRjw5Bd7DBeCcHK//6TfpQ3TBtWBPz4ZnyPTr3a/lCeqq15iVjCYFxDDmPeCMwfu2EbpF4Qx8RipAAPN/jrtzPs5mC7KZHbQTXDHzwDpXEqapnPlu2hC2qSFa67LsaCteLjqtGy25j14NhROX1F/X8iJ5IVJVi0xQPLAUiUgnvhg9PYWRrhbYkT2a6USEY10zwnRezMNqvbgZWDcUxM7BeZS7JhF7TGe7/sWZosJRRxiwHZpaF/8itYLuPh ubuntu@master3
ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDAl4mhc9AZL0QTqPA9TdDbECfBx0GEUW/cvzMD9t7aTWVjIa3GuAGfpFMe85i8ADBMSDTs06BgyypNnzkiSwhTE+hYrK/4jgYqv7u+MSvAoIkxHZLcRkRBniFqZR1a2u86vwQqMhkIrfmHu9lFn9Wj8bB8ANFSplHDnCmzxiwQMmlRLDAq2qUvYhHx3hA4NrBeMFd9MfFxCXpyP25DAQx7JEgizKHN1ZLSRNu2ErqjXD9+o5nyI5tz6oyJs9a3H6R69U+5X587bBDx4S2gRAlKpfPh3oRv2rV+TqXSk9n6if3EdaSBBJqNnVhCcnjMNvzrH24zE/eGq97ABZUT4PH9 ubuntu@node3
ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDBlLXixZgGDUJ1gcY8BLBzr58dMDI5s93yW6KdjTDlPQyDWElkz31gNJ4sBQtoTun3U/A+LUpxPM6gu0fsd87QjelkfuoQG1/za3ftp7Dr0LENBF/uY76zqX6HeTCwUKzY/zpzQJCjN9V0w+81+/a1yzAiANuWtzyDFzGr3BBxrLV/CJKKGkGonZzi24+9t4pcI2YAAJjP80/1PsIj/NHQgFz1HZX47Dmp1dJcuMWRCN1IPKq6U936/8vTYfGj/jPVVrcOq7a0Yh0+ialB0dqQDnli/KmRHNfPcAncZuGvHGYDoBCebfM5jSu9yrTJ9SCSjiIzw5iS84NkWpuhsl/B ubuntu@jumphost
ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDF2893Xlt5XcmY3R+IGMZOzHRIPG4UisZlVdkCSDPuilBks18Bn7E5OxAwfaciIs6ShuK/E/xLwmVakmEggciGlpYfJG8qucyTOYj/wMLeLAKiZmoTy086eJkp2zalmBOyoyXO728cKQu33lKgiRlk3swKbKrNTgIUtl00/LI02gFa7dfrFz2IhcJ/hZzbONdr3twku7ZS4AFQidUSSR/0H68QiXhWm6Iz8YPNPcvEr9GUsw1DUL9HDC28W6gtpO0aBNfKyPAXA8XveguMHYOBvJf9l2qrZA5x6931CaCXqqxRJZemH/Gp6OgGaJOs+1V23aw6Zzacwkw33KFy/5CB ubuntu@operations
END
