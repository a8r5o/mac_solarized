
### alias and functions
alias bagram="ssh -oHostKeyAlgorithms=+ssh-dss aro@10.47.47.252"
alias ppv='puppet parser validate'
alias puppetdeploy='ssh root@puppet.cl.no r10k deploy environment production -v && ssh root@puppet.cl.no apache2ctl graceful'
alias vc='vimcat'
alias vp='vimpager'
alias vim="nvim"
alias mplayer="mpv"

#convert cr2 files to jpg
function cr2jpg { for i in *.CR2; do sips -s format jpeg $i --out "${i%.*}.jpg"; done; }
#shared host reverse lookup
function shdig { 
    RED='\033[0;31m'
    NC='\033[0m' 
    # i use tail -n1 to get correct results when the domain is a CNAME
    name=$(dig "$1" +short |tail -n1| xargs dig +short -x ; )
    if [ -z $name ]; then
        echo "${RED}No reverse lookup available for $1${NC}"
        #Parse whois info for network name on the first IP returned by dig
        #to check if the site is behind a CDN
        networkname=$(whois $(dig +short $1 | head -n 1) 2> /dev/null |
        grep -i "netname" | awk -F ':' '{print $2}')
        if [ ! -z $networkname ]; then
            echo "Networkname: $networkname"
        fi
    elif [ $name = "webwash01.clh.no." ]; then
        echo "${RED}Behind webwash.clh.no${NC}"
        #Extract the actual server the site is on from webwash
        webwashname=$(ssh webwash01.clh.no "cat /etc/apache2/sites-enabled/$1*" | grep -v "#" |
        grep -m 1 "ProxyPass" | awk -F '/' '{ print $(NF-1) }')
        #if there isnt any proxypass statement print config without comments
        if [ -z $webwashname ]; then
            ssh webwash01.clh.no "cat /etc/apache2/sites-enabled/$1*" | grep -v "#"
        else
            echo $webwashname
        fi
    else
        echo $name
    fi
    }

#short dig
function sdig { dig "$1" +short; }

#webwash lookup
function webwash {  ssh webwash01.clh.no "cat /etc/apache2/sites-enabled/$1*" | grep -v "#"; }

#TLS cert check
function tlscert {
    echo | openssl s_client -showcerts -servername $1 -connect $1:443 2> /dev/null |
    openssl x509 -inform pem -noout -text ;
}

# markdown commandline reader
#function mdread { pandoc -t plain $1 | less; }

# mosh tmux attach, should be improved so I can map it to mosh
function mosht { mosh $1 -- tmux attach -t 0 -d; }

#fetch all git repos bellow
function gitfetch { find . -name .git -type d -exec git --git-dir '{}' fetch --all ';'; }