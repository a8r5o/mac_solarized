
### alias and functions
alias bagram="ssh -oHostKeyAlgorithms=+ssh-dss aro@10.47.47.252"
alias ppv='puppet parser validate'
alias puppetdeploy='ssh root@puppet.cl.no r10k deploy environment production -v && ssh root@puppet.cl.no apache2ctl graceful'
alias vc='vimcat'
alias vp='vimpager'
alias vim="nvim"

#shared host reverse lookup
#function shdig {dig "$1" +short | xargs dig +short -x; }

#TLS cert check
tlscert () {
    echo | openssl s_client -showcerts -servername $1 -connect $1:443 2> /dev/null | openssl x509 -inform pem -noout -text
}

# markdown commandline reader
#function mdread {pandoc -t plain $1 | less; }

# mosh tmux attach, should be improved so I can map it to mosh
#function mosht {mosh $1 -- tmux attach -t 0 -d; }
