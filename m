Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from mailout09.sul.t-online.com (mailout09.sul.t-online.com [194.25.134.84])
	by dsl2.external.hp.com (Postfix) with ESMTP id 95B6C482A
	for <parisc-linux@lists.parisc-linux.org>; Mon, 15 Apr 2002 08:32:25 -0600 (MDT)
Received: from p508109A8.dip.t-dialin.net (localhost [127.0.0.1])
	by p508109A8.dip.t-dialin.net (8.12.2/8.12.2/Debian -5) with ESMTP id g3FESQhB023732
	for <parisc-linux@lists.parisc-linux.org>; Mon, 15 Apr 2002 16:28:26 +0200
Received: (from news@localhost)
	by p508109A8.dip.t-dialin.net (8.12.2/8.12.2/Debian -5) id g3FESPRY023729
	for parisc-linux@lists.parisc-linux.org; Mon, 15 Apr 2002 16:28:25 +0200
To: parisc-linux@lists.parisc-linux.org
From: Paul Seelig <pseelig@uni-mainz.de>
Subject: Congratulations again! :-) [was:Re: [parisc-linux] Successful installation and keyboard problems]
Date: 15 Apr 2002 16:28:25 +0200
Message-ID: <87vgatf33q.fsf_-_@p508109A8.dip.t-dialin.net>
References: <871ydo6a5a.fsf@p50811B33.dip.t-dialin.net> <200204101110.32294.helge.deller@sap.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
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

helge.deller@sap.com (Helge Deller) writes:
> 
> Please retry with a recent kernel.
> 
> On Tuesday 09 April 2002 19:42, Paul Seelig wrote:
> > Because of NeXTSTEP i've once gotten rid of my HIL keyboard and mouse,
> > replacing both with standard PS/2 variants.  Unfortunately, at the
> > console the PS/2 keyboard (with German layout) chokes on pressing the
> > key containing the characters '>', '<' and '|' (on a german keyboard
> > the key between Shift and Y), only telling me:
> >
> >      keyboard: unrecognized scancode (7f) ignored
>
Upgrading to kernel 2.4.18 solved the keyboard problem. PPPOE now runs
fine as well and permitted a full "apt-get dist-upgrade" from Debian's
unstable.  XFree86 is up and running too but this machine is no fun
using with it due to the limiting 8-bit fbdev display and the overall
slowness of the machine.  Reminds me somewhat of my old i486DX/33
although the overall niceness of the 715/64 definitely beats it.
NeXTSTEP 3.3 and HP/UX 10.20 are way faster on the same hardware.
Above all, NeXTSTEP is able to use far larger color space (16-bit or
more, i'd have to look).  Somehow my usual iP233MMX feels so much
faster than before... ;-)

Fortunately Debian is truly Free Software[TM]. :-)

                                 Thanks a lot! *8^)
-- 
     ------------ Paul Seelig <pseelig@uni-mainz.de> --------------
   African Music Archive - Institute for Ethnology and Africa Studies
   Johannes Gutenberg-University   -  Forum 6  -  55099 Mainz/Germany
     ----------------- http://ntama.uni-mainz.de ------------------
