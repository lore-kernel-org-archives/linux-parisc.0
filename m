Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from ns.istop.com (cpu1693.adsl.bellglobal.com [206.47.27.174])
	by dsl2.external.hp.com (Postfix) with ESMTP id 28E5E482B
	for <parisc-linux@lists.parisc-linux.org>; Fri,  2 Nov 2001 10:33:52 -0700 (MST)
Received: from old@istop (herbr.istop.com [216.187.107.13])
	by ns.istop.com (Postfix) with SMTP id C5C4B17017
	for <parisc-linux@lists.parisc-linux.org>; Fri,  2 Nov 2001 12:34:12 -0500 (EST)
Message-Id: <3.0.5.32.20011102123342.018d7920@mail.magma.ca>
Date: Fri, 02 Nov 2001 12:33:42 -0500
To: parisc-linux@lists.parisc-linux.org
From: Herb Radford <herbr@magma.ca>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Subject: [parisc-linux] Irritating console message in 0.9.2 iso
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

I have installed 0.9.2 on my two 712's (a /60 & a /80) with no problems
(except learning about Debian).
I am however bothered by a message which is displayed on the console at
irregular (I think) intervals - sort of in bursts, then stops for a bit.
The message makes it impossible to use dselect to proceed with the rest of
the installation - the menu items in dselect get overwritten and it's not
possible to determine what I have selected etc.

The message is:
ip_local_deliver: bad loopback skb: PRE_ROUTING LOCAL_IN
skb: pf=2(unowned) dev=lo len=328
PROTO=17 0.0.0.0:68 255.255.255.255:67 L=328 S=0x10 I=0 F-0x0000 T=16

Now that is not cut and paste but the words are correct.

Hope someone has an answer!

Regards, Herb
