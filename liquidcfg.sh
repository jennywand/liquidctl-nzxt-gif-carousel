#!/usr/bin/env bash

GIF="/usr/local/share/kraken-gifs/combined.gif"

echo "Starting liquidctl ultra-stable mode..."

# --- INIT ---
for i in {1..5}; do
  if timeout 5 /usr/bin/liquidctl initialize all; then
    echo "Initialization successful"
    break
  else
    sleep 2
  fi
done

sleep 5

# --- COOLING ONLY ---
/usr/bin/liquidctl set pump speed 90

/usr/bin/liquidctl set fan speed \
  25 25 \
  35 35 \
  45 50 \
  55 70 \
  65 85 \
  75 100

sleep 2

# --- SET LCD ONCE ---
echo "Setting LCD once..."

timeout 10 /usr/bin/liquidctl set lcd screen gif "$GIF" || {
  echo "LCD failed, but continuing without retries"
}

echo "Done. No more LCD interaction (stability mode ON)."

# --- DO NOTHING ELSE ---
while true; do
  sleep 3600
done
