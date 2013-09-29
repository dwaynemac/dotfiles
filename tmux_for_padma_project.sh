tmux -S /tmp/pair new -d -s mailing

tmux -S /tmp/pair new-window -t mailing:1 -n 'vim'
tmux -S /tmp/pair send-keys 'vim' C-m

tmux -S /tmp/pair new-window -t mailing:2

tmux -S /tmp/pair new-window -t mailing:3 -n 'console'
tmux -S /tmp/pair send-keys 'bundle exec rails c' C-m

tmux -S /tmp/pair new-window -t mailing:4 -n 'foreman'
tmux -S /tmp/pair send-keys 'bundle exec foreman start -f Procfile.dev' C-m

tmux -S /tmp/pair select-window -t mailing:1

# this command should be runned by remote programmer too
tmux -S /tmp/pair attach-session -t mailing
