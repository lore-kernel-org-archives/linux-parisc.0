Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from bob.ncssm.edu (bob.ncssm.edu [152.34.37.42])
	by dsl2.external.hp.com (Postfix) with SMTP id B6775601D
	for <parisc-linux@lists.parisc-linux.org>; Sun, 25 Nov 2001 23:54:31 -0700 (MST)
Date: Mon, 26 Nov 2001 01:50:42 -0500 (EST)
From: Phil Anderson <andersop@neverland.ncssm.edu>
To: <parisc-linux@lists.parisc-linux.org>
In-Reply-To: <006901c16ca9$78c16e60$0101a8c0@pogo>
Message-ID: <Pine.LNX.4.33.0111260140330.4886-100000@bob.ncssm.edu>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Subject: [parisc-linux] bad local loopback (and 712 X query)
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

Hi all;

I send this with a dual purpose:

First:

I got my 712/80i running fine off the 0.9.2 ISO (it worked GREAT after I
tried the 32bit kernel and not the 64bit one :> ) Anyway, It runs pretty
well. So: has anyone gotten X working on a 712? and would like to share?

Second:
like I said, it works pretty well...
...except for the fact that while I'm using it (or even when it's just at
a tty login prompt) these errors come up:

ip_local_deliver: bad loopback skb: PRE_ROUTING LOCAL_IN
skb: pf=2 (unowned) dev=lo len=328
PROTO=17 0.0.0.0:68 255.255.255.255:67 L=328 S=0x10 I=0 F=0x0000 T=16


67 and 68 are bootp server and client ports, respectively. How can I get
rid of these? they prevent the box from being really useful because they
pop up every minute or so at the current cursor location, which is a major
detriment to doing, well, anything.

As far as I can tell, these packets are coming from the machine itself,
and it's attempting to send a broadcast packet over loopback. Perhaps by
turning off bootp services in /etc/inetd.conf?

thanks for your time,

-phil


-- 
===============================================================================

Phil Anderson
andersop@neverland.ncssm.edu
The_13th_Ewok@hotmail.com

"Go CRAZY? Don't mind if I do! Woowoowoowoo!" -Homer Simpson
