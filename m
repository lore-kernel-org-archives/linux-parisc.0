Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from rhirst.linuxcare.com (pc1-hems4-0-cust107.bre.cable.ntl.com [213.105.88.107])
	by dsl2.external.hp.com (Postfix) with ESMTP id 868D4482C
	for <parisc-linux@lists.parisc-linux.org>; Tue,  9 Oct 2001 03:23:05 -0600 (MDT)
Received: by rhirst.linuxcare.com (Postfix, from userid 501)
	id 6F210B00C; Tue,  9 Oct 2001 10:24:14 +0100 (BST)
Date: Tue, 9 Oct 2001 10:24:14 +0100
From: Richard Hirst <rhirst@linuxcare.com>
To: Grant Grundler <grundler@puffin.external.hp.com>
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] bad loopback error msg
Message-ID: <20011009102414.X11105@linuxcare.com>
References: <200110090020.SAA01264@puffin.external.hp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <200110090020.SAA01264@puffin.external.hp.com>; from grundler@puffin.external.hp.com on Mon, Oct 08, 2001 at 06:20:15PM -0600
List-ID: <linux-parisc.vger.kernel.org>

On Mon, Oct 08, 2001 at 06:20:15PM -0600, Grant Grundler wrote:
> Hi,
> 
> Helped someone install 0.9.2 on a B180 (serial console) and following
> the instructions, basically got it up and running.  He needed some help
> with setting up apt (pointing to HP internal mirror).
> 
> But I couldn't figure out what was causing the following error msg
> to get printed on the console every minute or so:
> 
>     ip_local_deliver: bad loopback skb: PRE_ROUTING LOCAL_IN 
>     skb: pf=2 (unowned) dev=lo len=328
>     PROTO=17 0.0.0.0:68 255.255.255.255:67 L=328 S=0x10 I=0 F=0x0000 T=16
> 
> Any ideas?

I think this is caused by dhclient being automatically run from
init scripts, even though you have specified a manual network config.
rm /etc/rc?.d/*dhclient or similar should help.  dhclient should
only be invoked via ifup/ifdown, but earlier versions installed
rc scripts as well.

Richard
