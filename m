Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from csmail.ucc.ie (csmail.ucc.ie [143.239.211.231])
	by dsl2.external.hp.com (Postfix) with ESMTP id 800214840
	for <parisc-linux@lists.parisc-linux.org>; Thu, 20 Nov 2003 17:38:22 -0700 (MST)
Date: Fri, 21 Nov 2003 00:38:18 +0000 (GMT)
From: "M. Grabert" <xam@cs.ucc.ie>
To: Matthew Wilcox <willy@debian.org>
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] C3000 and 2.6
In-Reply-To: <20031120194543.GM30485@parcelfarce.linux.theplanet.co.uk>
Message-ID: <Pine.LNX.4.58.0311210032100.25075@sal.ucc.ie>
References: <Pine.LNX.4.58.0311201817470.21743@sal.ucc.ie>
 <20031120190259.GL30485@parcelfarce.linux.theplanet.co.uk>
 <Pine.LNX.4.58.0311201920340.23498@sal.ucc.ie>
 <20031120194543.GM30485@parcelfarce.linux.theplanet.co.uk>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Sender: parisc-linux-admin@lists.parisc-linux.org
Errors-To: parisc-linux-admin@lists.parisc-linux.org
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux/>

On Thu, 20 Nov 2003, Matthew Wilcox wrote:

> > However I have another one here (albeit unrelated to QoS, but IPv6 netfilter):
> >
> > root@beast:~# depmod -a
> > depmod: *** Unresolved symbols in
> > /lib/modules/2.4.22-pa17/kernel/net/ipv6/netfilter/ip6_queue.o
> > depmod:         ip6_route_me_harder
>
> How strange.
>
> $ find -type f |xargs grep ip6_route_me_harder
> ./include/net/ip6_route.h:extern int                    ip6_route_me_harder(struct sk_buff *skb);
> ./net/netsyms.c:EXPORT_SYMBOL(ip6_route_me_harder);
>
> Are you sure the kernel you are currently running was compiled with
> CONFIG_NETFILTER and CONFIG_IPV6 turned on?

Definitely.


xam@sal:~$ ping6 -c3 beast.ipv6.damnyou.org
PING beast.ipv6.damnyou.org(beast.ipv6.damnyou.org) 56 data bytes
64 bytes from beast.ipv6.damnyou.org: icmp_seq=1 ttl=63 time=60.1 ms
64 bytes from beast.ipv6.damnyou.org: icmp_seq=2 ttl=63 time=39.0 ms
64 bytes from beast.ipv6.damnyou.org: icmp_seq=3 ttl=63 time=39.6 ms

--- beast.ipv6.damnyou.org ping statistics ---
3 packets transmitted, 3 received, 0% packet loss, time 2018ms
rtt min/avg/max/mdev = 39.076/46.302/60.183/9.819 ms


(beast.ipv6.damnyou.org is the parisc box running 2.4.22-pa17)
Proof that IPv6 netfilter is working:


root@beast:/home/xam# ip6tables -L FORWARD
Chain FORWARD (policy DROP)
target     prot opt source               destination
DROP       udp      anywhere             anywhere           multiport
dports 135,1025
DROP       tcp      anywhere             anywhere           multiport
dports 135,1025
[...]


and it works as expected ...


greetings, Max
