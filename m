Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from smtp.petescaff.com (petem.xs4all.nl [194.109.247.92])
	by dsl2.external.hp.com (Postfix) with ESMTP id 5E47A4858
	for <parisc-linux@lists.parisc-linux.org>; Fri, 22 Feb 2002 09:58:07 -0700 (MST)
Received: from r6.petescaff.com ([192.168.0.3])
	by smtp.petescaff.com with esmtp (Exim 3.33 #1)
	id 16eJ1I-0004Bs-00
	for parisc-linux@lists.parisc-linux.org; Fri, 22 Feb 2002 17:58:04 +0100
Date: Fri, 22 Feb 2002 17:58:04 +0100 (CET)
From: Peter Mottram <peter@petescaff.com>
To: parisc-linux@lists.parisc-linux.org
In-Reply-To: <20020220204800.A27212@parcelfarce.linux.theplanet.co.uk>
Message-ID: <Pine.LNX.4.42.0202221752390.14794-100000@r6.petescaff.com>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Subject: [parisc-linux] Re: Strange serial behaviour on C160
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

I now have 2.4.17-pa28 running on my C160 & things have improved but are
not yet perfect as I still have three serial ports......

/dev/ttyS0, UART: 16550A, Port: 0x0000, IRQ: 90
/dev/ttyS1, UART: 16550A, Port: 0x0000, IRQ: 121
/dev/ttyS2, UART: 16550A, Port: 0x0000, IRQ: 121

Of these devices the functional ports are 0 & 2. The weird speed problems
have gone away so I can use my second serial port without problems - it is
just a little odd that the rogue ttyS1 still shows up.

Anything I can usefully look at to try to help sort this out?

TIA
PeteM

On Wed, 20 Feb 2002, Matthew Wilcox wrote:

> On Wed, Feb 20, 2002 at 06:59:00PM +0100, Peter Mottram wrote:
> > Before upgrading from HP-UX to Linux I had two perfectly functioning
> > serial ports on my C160. I now appear to have THREE serial ports -
> > ttyS[0-2].
>
> Hehe.. yeah, that was the case for quite a long time :-)
>
> > ttyS0 works perfectly
> > ttyS1 goes somewhere - not found where yet
> > ttyS2 goes to my second serial port but does not work at all well. A
> > simple cat of a file to the device results in the file appearing on a
> > terminal just a few characters at a time & incredibly slowly. All serial
> > ports have the same settings & ttyS0 has no problems (I use it for the
> > console).
>
> If you could upgrade to the latest kernel, you will find the additional
> serial port gone again.  I hadn't heard about the speed problems before,
> so if you could tell me whether they're still present with most-recent
> kernel, that would be very helpful.  Thanks!

[SNIP]
