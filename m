Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from faui80.informatik.uni-erlangen.de (faui80.informatik.uni-erlangen.de [131.188.38.1])
	by dsl2.external.hp.com (Postfix) with ESMTP id 2BBD34829
	for <parisc-linux@parisc-linux.org>; Sun, 12 Jan 2003 15:27:13 -0700 (MST)
Date: Sun, 12 Jan 2003 22:49:08 +0100
From: Richard Zidlicky <rz@linux-m68k.org>
To: Helge Deller <deller@gmx.de>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>,
	Alan Cox <alan@lxorguk.ukuu.org.uk>, parisc-linux@parisc-linux.org,
	Linux/PPC Development <linuxppc-dev@lists.linuxppc.org>,
	Linux/m68k <linux-m68k@lists.linux-m68k.org>
Message-ID: <20030112224908.A618@linux-m68k.org>
References: <Pine.GSO.4.21.0301121214440.18673-100000@vervain.sonytel.be> <200301121333.17077.deller@gmx.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <200301121333.17077.deller@gmx.de>; from deller@gmx.de on Sun, Jan 12, 2003 at 01:35:33PM +0100
Subject: [parisc-linux] Re: Generic RTC driver in 2.4.x
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

On Sun, Jan 12, 2003 at 01:35:33PM +0100, Helge Deller wrote:

> > BTW, perhaps we should move the global RTC_* definitions in <asm/rtc.h> to
> > <linux/genrtc.h>, or merge them with the ones in <linux/mc146818rtc.h> and
> > move them to <linux/rtc.h>?
> 
> IMHO leaving them architecture specific in <asm/rtc.h> seems best to me, and it 
> leaves the most possibilities to make them later more dependend on the hardware.

in genrtc the RTC_* defs should be used only for interface definition,
unlike rtc.c where they are 1:1 with some obscure bits in the rtc chip
and also happen to be the interface..
It would make sense to merge them into <linux/rtc.h>, whether it is 
a good idea to do it in 2.4 is another question.
Stuff that is really hw dependent should use different naming (and stay
in asm/rtc.h of course). 

Richard
