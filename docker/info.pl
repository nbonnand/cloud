#!/usr/bin/perl

%commands=(
'00 name'=>'uname -n',
'01 ip'=>'ip -4 a show | grep inet',
'02 uptime'=>'uptime'

);

print "Content-Type: text/plain\n\n\n";

for $com (sort keys %commands) {
    open COMMAND,"$commands{$com} |";
    print "\n$com:\n";
    while(defined($result=<COMMAND>)){
        print "..........  ",$result;
    }
    close COMMAND;
}
