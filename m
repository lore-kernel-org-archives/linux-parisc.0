Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from mail.speakeasy.net (mail7.speakeasy.net [216.254.0.207])
	by dsl2.external.hp.com (Postfix) with ESMTP id A8A544843
	for <parisc-linux@lists.parisc-linux.org>; Sat, 16 Aug 2003 09:18:48 -0600 (MDT)
Received: from unknown (HELO speakeasy.net) (caslivkoff@[216.27.161.152])
          (envelope-sender <caslivkoff@speakeasy.net>)
          by mail7.speakeasy.net (qmail-ldap-1.03) with SMTP
          for <parisc-linux@lists.parisc-linux.org>; 16 Aug 2003 15:18:47 -0000
Date: Sat, 16 Aug 2003 11:18:50 -0400
Subject: Re: xchat colors (Was Re:  [parisc-linux] xfree86 4.2.1-9 build problem)
Content-Type: text/plain; charset=US-ASCII; format=flowed
Mime-Version: 1.0 (Apple Message framework v552)
Cc: PARISC list <parisc-linux@lists.parisc-linux.org>
To: Grant Grundler <grundler@parisc-linux.org>
From: Chuck Slivkoff <caslivkoff@speakeasy.net>
In-Reply-To: <20030815172142.GA19042@dsl2.external.hp.com>
Message-Id: <F09536E0-CFFC-11D7-B685-000393581E44@speakeasy.net>
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

On Friday, Aug 15, 2003, at 13:21 US/Eastern, Grant Grundler wrote:

> Ok - it's a color map issue.
> I added some printf's to xchat-2.0.3/fe-gtk/palette.c:palette_alloc().
>
> I'll see how hard it is to teach xchat to use it's own color map.

I recall looking into this once with a GTK+ app. It wasn't trivial. 
Even if you do get it coded, you will likely end-up with colormap 
flashing (aka "technicolor effect") when focus is switched in & out of 
the client window. The Vis-EG has 2 HW LUTs which under HP-UX, would 
prevent the technicolor effect by allowing 2 colormaps to be installed 
in HW simultaneously. But, I don't know if the stifb driver was written 
to take advantage of them both. If you can accept the "off" colors that 
an 8-bit TrueColor default visual would give you (due to the uneven 
3/3/2 split between R/G/B), that would be the easiest solution & would 
ensure that all clients can get the colors they want.

This is on a Visualize-EG, right? Under HP-UX, the Vis-EG (standard on 
the PCI card & optionally on the GSC & integrated versions) has the 
capability of doing 8/8 double-buffering with another 8-bit overlay. It 
would be great if the stifb driver could really take advantage of all 
24-planes (or even 16), but I don't think that's been implemeneted. 
Does anyone know if it's even possible? (I know NeXTStep on the 712 was 
able to somehow squeeze 16-bit graphics out of the supposedly 8-bit 
Artist adapter. Anyone have any idea how this was done?)

BTW, there's a pretty good but somewhat old (May 1996) white-paper here:

   http://www.hp.com/xwindow/sharedInfo/Whitepapers/Visuals/visuals.html

that discusses X11 visuals and the capabilities of some of the HP 
graphics adapters under HP-UX.


-chuck
