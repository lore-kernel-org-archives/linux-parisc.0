Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from thinkpad.home (pc2-hem11-4-cust120.bre.cable.ntl.com [213.107.176.120])
	by dsl2.external.hp.com (Postfix) with ESMTP id 8639D4829
	for <parisc-linux@lists.parisc-linux.org>; Tue,  3 Sep 2002 04:20:14 -0600 (MDT)
Date: Tue, 3 Sep 2002 10:12:45 +0100
From: Richard Hirst <rhirst@linuxcare.com>
To: marc <marc@centraltx.com>
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] Network Problems
Message-ID: <20020903091245.GA21440@sleepie.demon.co.uk>
References: <200209021138.AA3341287994@mail.centraltx.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <200209021138.AA3341287994@mail.centraltx.com>
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

Sounds like third bullet point on
<http://www.parisc-linux.org/release-0.9/errata-092.html>.  Is this an
old install (or a recent one from an old ISO)?

Richard


On Mon, Sep 02, 2002 at 11:38:20AM -0500, marc  wrote:
> Anyone have any ideas why I get innundated with these messages on
> startup and have to do a control-c to get past this part and continue booting?
> 
> Configuring network interfaces: eth0: Transceiver problem.
> ip_local_deliver: bad loopback skb: PRE_ROUTING LOCAL_IN 
> skb: pf=2 (unowned) dev=lo len=328
> PROTO=17 0.0.0.0:68 255.255.255.255:67 L=328 S=0x10 I=0 F=0x0000 T=16
> ip_local_deliver: bad loopback skb: PRE_ROUTING LOCAL_IN 
> skb: pf=2 (unowned) dev=lo len=328
> PROTO=17 0.0.0.0:68 255.255.255.255:67 L=328 S=0x10 I=0 F=0x0000 T=16
> ip_local_deliver: bad loopback skb: PRE_ROUTING LOCAL_IN 
> skb: pf=2 (unowned) dev=lo len=328
> PROTO=17 0.0.0.0:68 255.255.255.255:67 L=328 S=0x10 I=0 F=0x0000 T=16
> ip_local_deliver: bad loopback skb: PRE_ROUTING LOCAL_IN 
> skb: pf=2 (unowned) dev=lo len=328
> PROTO=17 0.0.0.0:68 255.255.255.255:67 L=328 S=0x10 I=0 F=0x0000 T=16
> ip_local_deliver: bad loopback skb: PRE_ROUTING LOCAL_IN 
> skb: pf=2 (unowned) dev=lo len=328
> PROTO=17 0.0.0.0:68 255.255.255.255:67 L=328 S=0x10 I=0 F=0x0000 T=16
> 
> ip_local_deliver: bad loopback skb: PRE_ROUTING LOCAL_IN 
> skb: pf=2 (unowned) dev=lo len=328
> PROTO=17 0.0.0.0:68 255.255.255.255:67 L=328 S=0x10 I=0 F=0x0000 T=16
> 
> _______________________________________________
> parisc-linux mailing list
> parisc-linux@lists.parisc-linux.org
> http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
