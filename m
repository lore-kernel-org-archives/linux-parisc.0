Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from rhirst.linuxcare.com (pc2-hems4-0-cust100.bre.cable.ntl.com [213.107.176.100])
	by dsl2.external.hp.com (Postfix) with ESMTP id EA67A482B
	for <parisc-linux@lists.parisc-linux.org>; Fri,  2 Nov 2001 11:17:13 -0700 (MST)
Received: by rhirst.linuxcare.com (Postfix, from userid 501)
	id 139DAB00C; Fri,  2 Nov 2001 18:18:45 +0000 (GMT)
Date: Fri, 2 Nov 2001 18:18:45 +0000
From: Richard Hirst <rhirst@linuxcare.com>
To: Herb Radford <herbr@magma.ca>
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] Irritating console message in 0.9.2 iso
Message-ID: <20011102181845.H5773@linuxcare.com>
References: <3.0.5.32.20011102123342.018d7920@mail.magma.ca>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <3.0.5.32.20011102123342.018d7920@mail.magma.ca>; from herbr@magma.ca on Fri, Nov 02, 2001 at 12:33:42PM -0500
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

On Fri, Nov 02, 2001 at 12:33:42PM -0500, Herb Radford wrote:
> I have installed 0.9.2 on my two 712's (a /60 & a /80) with no problems
> (except learning about Debian).
> I am however bothered by a message which is displayed on the console at
> irregular (I think) intervals - sort of in bursts, then stops for a bit.
> The message makes it impossible to use dselect to proceed with the rest of
> the installation - the menu items in dselect get overwritten and it's not
> possible to determine what I have selected etc.
> 
> The message is:
> ip_local_deliver: bad loopback skb: PRE_ROUTING LOCAL_IN
> skb: pf=2(unowned) dev=lo len=328
> PROTO=17 0.0.0.0:68 255.255.255.255:67 L=328 S=0x10 I=0 F-0x0000 T=16
> 
> Now that is not cut and paste but the words are correct.
> 
> Hope someone has an answer!

Just added

> dhcp-client is started from init scripts, when it should only be invoked
> via ifup and ifdown.  The result is that any manual network
> configuration may be overwritten, and you may see messages like
> "ip_local_deliver: bad loopback skb..." on the console.  Fix with
> "rm /etc/rc?.d/*dhcp-client".

to the errata, which I believe will solve your problem.

Richard
