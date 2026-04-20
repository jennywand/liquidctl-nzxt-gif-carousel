# liquidctl-nzxt-gif-carousel
How I made my NZXT Kraken 2023 elite work with liquidctl and rotate gifs on Fedora Server 42.
This is not going to work for everyone, but it works for me.
I abused/used ChatGPT for this. However it was my idea.

Consists of these files:

``` /etc/systemd/system/liquidctl.service ```

``` /usr/local/bin/liquidcfg.sh ```

``` /usr/local/share/kraken-gifs ```

The service runs the liquidcfg.sh on boot, which looks at the kraken-gifs directory for a file called combined.gif. 
I found the gifs I wanted and stitched them together at 320x320 using ImageMagick. Here's the command I used to stitch them.

``` magick \( jin_smile.gif -coalesce -resize 320x320! \) \( jin_swim.gif -coalesce -resize 320x320! \) -layers optimize combined.gif```

The reason i stitched them together:
I had it working, locked my screen and went to bed. When i came back the next day, my lcd was just black. The only thing that fixed it was power cycling. To avoid this happeing every time I use my pc I now just have it minimally touching the lcd screen.
For some reason ```liquidctl status``` lists my kraken as the following ```NZXT Kraken 2023 Elite (broken)```. That broken bit is concerning to me, so I'm basically trying not to touch it. Another thing I realized was that swithing modes from displaying gifs to displaying a status screen, for example switching from ```liquidctl set lcd screen gif "$gif"``` to ```liquidctl set lcd screen liquid``` was taxing on the screen and would also cause a black screen. So now I'm just minimally touching it.

Requirements:

Fedora Server 42

ImageMagick
