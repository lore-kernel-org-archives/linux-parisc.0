Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from mgw-x4.nokia.com (mgw-x4.nokia.com [131.228.20.27])
	by dsl2.external.hp.com (Postfix) with ESMTP id 84C8A483A
	for <parisc-linux@lists.parisc-linux.org>; Fri, 21 Feb 2003 08:33:17 -0700 (MST)
Received: from esvir04nok.ntc.nokia.com (esvir04nokt.ntc.nokia.com [172.21.143.36])
	by mgw-x4.nokia.com (Switch-2.2.1/Switch-2.2.0) with ESMTP id h1LFaHm26302
	for <parisc-linux@lists.parisc-linux.org>; Fri, 21 Feb 2003 17:36:17 +0200 (EET)
Date: Fri, 21 Feb 2003 17:33:13 +0200
From: Nahkola Mikko <mnahkola@trinms01.ntc.nokia.com>
To: ext Tom <palinux@alaskatech.org>
Cc: Nahkola Mikko <mnahkola@trinms01.ntc.nokia.com>,
	PARISC Linux <parisc-linux@lists.parisc-linux.org>
Subject: Re: [parisc-linux] boot console wrong.
Message-ID: <20030221153313.GM6523@aurinko.ntc.nokia.com>
References: <3E55A3FC.C06BFE43@optushome.com.au> <20030221082726.GH6523@aurinko.ntc.nokia.com> <Pine.LNX.4.53.0302210625170.18642@wolf.alaskatech>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
In-Reply-To: <Pine.LNX.4.53.0302210625170.18642@wolf.alaskatech>
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

On Fri, Feb 21, 2003 at 06:26:47AM -0900, ext Tom wrote:
> > > On Fri, Feb 21, 2003 at 03:58:52AM +0000, ext Rod Smart wrote:

> > > >   Console path:         SERIAL_1.9600.8.none
> > >     I have installed Debian through this console, and would like to play
> > > with it the usual way now ;o)

> > Um ... "path console graphics" could be a good starting point. It
> > probably tells you that "graphics" isn't a good path and shows a list of
> > what could be, but that's almost as good.

> "path console graphics(0)" sets the console to the built-in video on my
> C180; graphics(x) (where x is the slot number as printed on the back of
> the case) sets it to the video card in that slot...

Well ... yes. (I just had to set a B180L to mode 12 on graphics(0) 
manually from the serial console as that seems to be the only way to make 
it work with an A4033A with the usual 3-BNC cable.)

Now that I think about it ... I probably had to use pci(4) or some such 
once on a C360 but then again that one didn't have a built-in adapter.

Oh, and really, my Linux-running C240 still has the console on serial - 
_and_ X and a bunch of virtual terminals also available on the graphics 
card. 


-- 
Mikko Nahkola   <mikko.nahkola@nokia.com>
Tre-IN sysadmin <mnahkola@trein.ntc.nokia.com>
