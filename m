Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from www.linux.org.uk (parcelfarce.linux.theplanet.co.uk [195.92.249.252])
	by dsl2.external.hp.com (Postfix) with ESMTP id 5FAE44864
	for <parisc-linux@lists.parisc-linux.org>; Wed, 20 Feb 2002 13:48:02 -0700 (MST)
Received: from willy by www.linux.org.uk with local (Exim 3.33 #5)
	id 16ddei-0007zC-00; Wed, 20 Feb 2002 20:48:00 +0000
Date: Wed, 20 Feb 2002 20:48:00 +0000
From: Matthew Wilcox <willy@debian.org>
To: Peter Mottram <peter@petescaff.com>
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] Strange serial behaviour on C160
Message-ID: <20020220204800.A27212@parcelfarce.linux.theplanet.co.uk>
References: <Pine.LNX.4.33.0202200815060.13804-100000@goliath.alaskatech.org> <Pine.LNX.4.42.0202201833210.8367-100000@r6.petescaff.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <Pine.LNX.4.42.0202201833210.8367-100000@r6.petescaff.com>; from peter@petescaff.com on Wed, Feb 20, 2002 at 06:59:00PM +0100
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

On Wed, Feb 20, 2002 at 06:59:00PM +0100, Peter Mottram wrote:
> Before upgrading from HP-UX to Linux I had two perfectly functioning
> serial ports on my C160. I now appear to have THREE serial ports -
> ttyS[0-2].

Hehe.. yeah, that was the case for quite a long time :-)

> ttyS0 works perfectly
> ttyS1 goes somewhere - not found where yet
> ttyS2 goes to my second serial port but does not work at all well. A
> simple cat of a file to the device results in the file appearing on a
> terminal just a few characters at a time & incredibly slowly. All serial
> ports have the same settings & ttyS0 has no problems (I use it for the
> console).

If you could upgrade to the latest kernel, you will find the additional
serial port gone again.  I hadn't heard about the speed problems before,
so if you could tell me whether they're still present with most-recent
kernel, that would be very helpful.  Thanks!

For those who are interested:

Lasi, Dino, Cujo and Wax each have one serial port implemented.
In a C160, there is a Dino, a Lasi and a Wax, so there are 3 serial
port implementations.  However, the one in Dino isn't connected to
anything, so ideally we wouldn't report it.  It only confuses people.

So firmware tells us about the ones on Lasi and on Wax (at 8/16/4 and
8/20/2 respectively), and doesn't tell us about the one underneath Dino.
But the parent of Dino is U2 which is a bus adapter.  And we know there
are devices underneath bus adapters which firmware doesn't tell us about,
they have to be discovered by an architected bus walk.  When we do this
buswalk, we find the serial port underneath Dino at 8/3.

We can distinguish this port from a real serial port because it's not
assigned an IRQ.  However, there was a bug in the irq-assigning code
which happened to assign an irq to the device in exactly this case.
So we thought it was legitimate when it wasn't.  I fixed that bug in
the last couple of weeks and now my C360 (one port on Lasi, one on Dino,
non-existent one on Cujo) only reports 2 serial ports.

-- 
Revolutions do not require corporate support.
