# Deskflow

I wanted to be able to have my Mac mouse/trackpad work with my Ubuntu server, with deskflow server on the Mac, and deskflow client on the Ubuntu.

This proved challenging. Here are some notes on the solution and subsequent workflow.

- You need to install deskflow on the Mac (brew install deskflow) and Ubuntu (flatpak install deskflow).

- You need to have the server running on the Mac (deskflow server).

- The big challenge is/was being able to start the client on Ubuntu from an ssh shell BOTH when you are NOT graphically logged in (viz. when at the login screen) AND when graphically logged-in.

  - deskflow interacts with X windows; by default, Ubuntu 24.04 uses Wayland, not X, so you need to have this line in your `/etc/gdm3/custom.conf` so that Gnome uses X: `/etc/gdm3/custom.conf`
  - At the login screen, the user running GDM is `gdm`. This user starts the X11 server, and therefore has a "cookie" to allow one to securely communicate with X11. When you ssh into Ubuntu, you do NOT have access to that cookie. So I wrote a script `_deskflow_login_authX11` to sorta grab the cookie from gdm and apply it the user's environment
  - Another challenge is that the env var DISPLAY is not set from the SSH shell, so you need to set it manually. The script `_deskflow_find_display` does this
  - Once the X11 auth stuff is done using `_deskflow_login_authX11`, you run `_deskflow_start_client`. This is essentially a wrapper around `flatpak` that also uses `_deskflow_find_display` to dynamically determine the value of `DISPLAY` needed.
  - The script `_deskflow_start_client` needs to know what IP address to look for for the deskflow server; you are expected to set this IP address in the variable `export DESKFLOW_SERVER_IP='...'` in `misc.sh`
  - Once connected at login screen, you can log in but the deskflow connection will probably fail because `DISPLAY` will change values. So you need to run `_deskflow_start_client` again to reconnect.

  WOW!
