Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from daedalus.cs.brandeis.edu (daedalus.cs.brandeis.edu [129.64.3.179])
	by dsl2.external.hp.com (Postfix) with ESMTP id CE419482A
	for <parisc-linux@lists.parisc-linux.org>; Fri,  4 Jan 2002 12:57:00 -0700 (MST)
Date: Fri, 4 Jan 2002 14:56:57 -0500
From: Aaron Macks <aaronm@cs.brandeis.edu>
To: "Bryan W. Headley" <bheadley@interaccess.com.ml.to>
Cc: PARISC-Linux <parisc-linux@lists.parisc-linux.org>
Subject: Re: [parisc-linux] 755 sucess and questions
Message-ID: <20020104145657.A7381@daedalus.cs.brandeis.edu>
References: <a05100300b85ba56484f5@[129.64.46.83]> <3C3604EC.7050608@interaccess.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <3C3604EC.7050608@interaccess.com>; from bheadley@interaccess.com.ml.to on Fri, Jan 04, 2002 at 01:39:24PM -0600
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

On Fri, Jan 04, 2002 at 01:39:24PM -0600, Bryan W. Headley wrote:
> Aaron Macks wrote:
> 
> > so I got 0.93 to install on my 755/125, but I have two questions:
> > -how does one configure a mouse on a serial port
> > -how does one configure X
> > Aaron
> 
> 
ok, the framebuffer stuff sounds good, can be done when I return to
the machine
> 1. You need to know your framebuffer's screen resolution. Run fbset, or 
> look at /var/log/messages.
> 
> piddle:/etc/X11# /usr/sbin/fbset -i
> 
> mode "1280x1024"
>      geometry 1280 1024 1280 1024 32
>      timings 0 0 0 0 0 0 0
>      rgba 8/16,8/8,8/0,8/24
> endmode
> 
> Frame buffer device information:
>      Name        :
>      Address     : 0xf5000000
>      Size        : 8388608
>      Type        : PACKED PIXELS
>      Visual      : TRUECOLOR
>      XPanStep    : 0
>      YPanStep    : 0
>      YWrapStep   : 0
>      LineLength  : 8192
>      Accelerator : No
> 
> Mine tells me I have 1280x1024, 32-color. 8-color is also popular (look 
> at the last number in the "geometry" line.
> 
> 2. Run debconf. (Apply the patch first). It generally offers several 
> screen resolutions. You only want ONE resolution: the one the 
> framebuffer supports. Here, we're talking 1280x1024
which patch for debconf?
> 
> 3. Your mouse is a little different, but not that different. Tell 
> debconf whether it's a microsoft-compatible or logitech protocol mouse, 
> and which tty port it's connected to. (Really: not an HP mouse?)
> 
The only reason I'm not using the HP mouse(there is a HIL one attached
to the keyboard) is that the docs I saw online stated a lack of
support for the hil mice.
> 4. Linux is generally rigged not to use the serial ports for 
> modems/terminals. But yours might be... It's configured in /etc/inittab.
> 
> 	# Example how to put a getty on a serial line (for a terminal)
> 	#
> 	#T0:23:respawn:/sbin/getty -L ttyS0 9600 vt100
> 	#T1:23:respawn:/sbin/getty -L ttyS1 9600 vt100
> 
> 	# Example how to put a getty on a modem line.
> 	#
> 	#T3:23:respawn:/sbin/mgetty -x0 -s 57600 ttyS3
> 
> 5. Here's my XF86Config-4 file for your amusement.
> 
thanks!
Aaron
> 
> 
> 
> -- 
> ____               .:.                 ____
> Bryan W. Headley - bheadley@interaccess.com
> 
> 
> [These attachments have been stored at Thinmail:]
> 
> http://www.thinmail.com/tm/v/mULUNBn8aFV/XF86Config-4
> Size: 2881 Type: Plain Text Category: Received
> 
-- 
_______________________________________________________
Aaron Macks(aaronm@cs.brandeis.edu)
My sheep has seven gall bladders, that makes me the King of the Universe!
