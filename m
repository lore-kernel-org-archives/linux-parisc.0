Return-Path: <grundler@lackof.org>
Received: from colo.lackof.org (colo.lackof.org [198.49.126.79])
	by dsl2.external.hp.com (Postfix) with ESMTP id C4FA84854
	for <parisc-linux@lists.parisc-linux.org>;
	Thu, 11 Dec 2003 23:48:35 -0700 (MST)
Date: Thu, 11 Dec 2003 23:48:34 -0700
From: Grant Grundler <grundler@parisc-linux.org>
To: Achim Stolze <Achim.Stolze@t-online.de>
Subject: Re: [parisc-linux] C180 - cannot get KDE nor Gnome get running
Message-ID: <20031212064834.GB16243@colo.lackof.org>
References: <3FD8B777.2060105@t-online.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <3FD8B777.2060105@t-online.de>
Cc: parisc-linux@lists.parisc-linux.org
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>

On Thu, Dec 11, 2003 at 07:29:11PM +0100, Achim Stolze wrote:
> Hello all!
> Woody is now running on my C180. But I cannot get KDE or Gnome started.
> I tried to configure XFree before starting XServer, but the command 
> startx causes the error message 
> "... XIO: fatal IO error 232 (connection reset by peer) on X Server ":0.0" 
> after 0 requests ... with 0 events remaining."
> 
> I am not sure which graphics driver I should use ...

The default kernels have both CONFIG_FB_STI and CONFIG_FBCON_STI
enabled. That's the only driver that is supported. STI does not
support all cards. Find out which model card you have and then
search the mail archive (http://lists.parisc-linux.org)
and/or check the FAQ at www.parisc-linux.org. If you get the
penguin in the top left corner of the screen, STI FB driver
is working.

James previous comment on "match STI framebuffer settings" is a
crucial one. Hitting <Tab> key at power up will let one select
different screen resolutions and refresh rates. When parisc-linux
boots, the STI driver will print those settings as well.
Only those settings are allowed in your /etc/X11/XF86Config-4 file.

hth,
grant
