Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from tyke.pjc.net (public1-leed3-6-cust89.leed.broadband.ntl.com [80.7.68.89])
	by dsl2.external.hp.com (Postfix) with ESMTP id CF6DA482C
	for <parisc-linux@lists.parisc-linux.org>; Tue, 14 Jan 2003 01:22:13 -0700 (MST)
Received: from patrick by tyke.pjc.net with local (Exim 3.36 #1 (Debian))
	id 18YMKq-0000h1-00
	for <parisc-linux@lists.parisc-linux.org>; Tue, 14 Jan 2003 08:22:12 +0000
Date: Tue, 14 Jan 2003 08:22:12 +0000
From: Patrick Caulfield <patrick@tykepenguin.com>
To: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] new gcc-default for hppa
Message-ID: <20030114082212.GA1292@tykepenguin.com>
References: <20030110170905.GG26261@tausq.org> <3E1AA7C1000010F1@ocpmta7.freegates.net> <20030113193826.GA1938@dsl2.external.hp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-15
In-Reply-To: <20030113193826.GA1938@dsl2.external.hp.com>
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

On Mon, Jan 13, 2003 at 12:38:26PM -0700, Grant Grundler wrote:
> On Mon, Jan 13, 2003 at 07:36:03PM +0100, jsoe0708@tiscali.be wrote:
> > Well as mentionned in another mail, I just compile the 2.4.20-pa21 with
> > this new release and it always compile well, always boot well but also as
> > soon as a network connection is tempted the system still crash.
> > 
> > And ? it just printout Stack Dump: (thousand time) but nothing more??
> > Do I do again something wrong?
> 
> probably not. the stack dump is something I sometimes comment out
> since it interfers with the register dump (which is more interesting).
> 
> 
> > never the less, Here I got the pim info:
> > PROCESSOR PIM INFORMATION
> 
> > GR2 = 0000000010110850
> > Func: inb, Off: 7c, Addr: 0x10110850
> 
> > I do not know if it is relevant but HTH (me no :( )
> 
> Knowing it's inb() helps a bit. But we really need to know
> who called inb. Unless we get a nice stack unwind, we just
> have to guess based on activity that caused the crash and
> last dmesg output from the console.
> 
> Sounds like the networking card you are attempting to
> use isn't enabled properly by the driver.
> Can you remind me which type of machine this is running
> on and which type of NIC you are using?

I doubt this is exactly the case. I have the same problem with my C110 in that
connecting to the box over ssh will kill it (with a gcc 3.2 compiled kernel) but
DECnet works fine with that kernel.

Oddly, DECnet does /not/ work with a gcc 3.0.4 compiled kernel (it doesn't crash,
just produces bogus packets), though ssh does - as we know.

patrick
