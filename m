Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from webmail.tiscalinet.be (webmail1.tiscali.be [212.35.2.121])
	by dsl2.external.hp.com (Postfix) with ESMTP id 95A0F482A
	for <parisc-linux@lists.parisc-linux.org>; Fri,  7 Jun 2002 00:26:11 -0600 (MDT)
To: marc@centraltx.com, marc <marc@centraltx.com>
Subject: Re: [parisc-linux] Messages after installing DHCP
Message-ID: <1023431166.3d0051fec3edc@webmail.tiscalinet.be>
Date: Fri, 07 Jun 2002 08:26:06 +0200 (CEST)
From: joel.soete@freebel.net
Cc: "parisc-linux@lists.parisc-linux.org" <parisc-linux@lists.parisc-linux.org>,
	marc@centraltx.com
References: <200206061858.AA1919091130@mail.centraltx.com>
In-Reply-To: <200206061858.AA1919091130@mail.centraltx.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
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

Hi Marc,

Which kernel do you used?

It seems to me that I met a similar problem when I install my b2000 with dhcp.
IIRC the main reason was that I forgot to verify that bootp suport was included
in the kernel of my lifimage. (IIRC if you make distclean ; make oldconfig it
should included as default. You can verify with make menuconfig).

I hope it will help you,
    Joel

Quoting marc  <marc@centraltx.com>:

> Why do these messages flood my terminal after installing dhcp?
> 
> ip_local_deliver: bad loopback skb: PRE_ROUTING LOCAL_IN
> skb: pf=2 (unowned) dev=lo len=328
> PROTO=17 0.0.0.0:68 255.255.255.255:67 L=328 S=0x10 I=0 F=0x0000 T=16
> 
> 
> Thanks,
> -Marc
> 
> _______________________________________________
> parisc-linux mailing list
> parisc-linux@lists.parisc-linux.org
> http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
> 
> 


-------------------------------------------------
This mail sent through Tiscali Webmail (http://webmail.tiscali.be)
