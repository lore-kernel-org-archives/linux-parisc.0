Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from osiris.silug.org (osiris.lanscape.net [64.240.156.225])
	by dsl2.external.hp.com (Postfix) with ESMTP id 68B414A19
	for <parisc-linux@parisc-linux.org>; Tue, 13 Feb 2001 15:46:28 -0700 (MST)
From: Steven Pritchard <steve@silug.org>
Message-Id: <200102132246.f1DMkL801323@osiris.silug.org>
Subject: Re: [parisc-linux] C100 & Latest CVS Bits
In-Reply-To: <Pine.LNX.4.21.0102131358430.14806-100000@maestro.symsys.com>
 "from Greg Ingram at Feb 13, 2001 02:16:58 pm"
To: Greg Ingram <ingram@symsys.com>
Date: Tue, 13 Feb 2001 16:46:21 -0600 (CST)
Cc: parisc-linux@parisc-linux.org
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Sender: steve@osiris.silug.org
List-ID: <linux-parisc.vger.kernel.org>

Greg Ingram said:
> On Tue, 13 Feb 2001, Grant Grundler wrote:
> > Greg Ingram wrote:
> > > As a side question, is it possible to have the system automatically reboot
> > > after it encounters these errors?
> > 
> > It can. There's a global variable someplace that is *disabled* by default.
> > If someone can just remember the global's name...
> 
> Anybody?  I have to make that *long* walk through the accounting office
> just to power-cycle the beast.  

Does rebooting with sysrq work?  (I've never actually tried it over a
serial console, but I seem to recall that you can send a break, then
"b".)

Actually, will that work, or do you have to turn on sysrq via /proc
after booting?

Oh, wait, it looks like you can pass "panic=1" as a kernel parameter. 
That should have the same effect as "echo 1 > /proc/sys/kernel/panic"
(or adding "kernel.panic = 1" to /etc/sysctl.conf and running "sysctl
-p") on a running system.

Documentation/sysctl/kernel.txt says the following:

    panic:

    The value in this file represents the number of seconds the
    kernel waits before rebooting on a panic. When you use the
    software watchdog, the recommended setting is 60.

The default value is 0, which disables the feature, IIRC.  (This is
from memory, so I could easily be wrong.)

I hope this trip through my faulty memory is helpful...  ;-)

Steve
-- 
steve@silug.org           | Southern Illinois Linux Users Group
(618)398-7320             | See web site for meeting details.
Steven Pritchard          | http://www.silug.org/
