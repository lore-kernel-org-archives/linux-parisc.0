From: grundler@dsl2.external.hp.com (Grant Grundler)
Subject: Re: [parisc-linux] new gcc-default for hppa
Date: Mon, 13 Jan 2003 12:38:26 -0700
Message-ID: <20030113193826.GA1938__3577.65996964208$1416622108$gmane$org@dsl2.external.hp.com>
References: <20030110170905.GG26261@tausq.org> <3E1AA7C1000010F1@ocpmta7.freegates.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Cc: Randolph Chung <tausq@debian.org>,
	parisc-linux@lists.parisc-linux.org, debian-hppa@lists.debian.org
To: jsoe0708@tiscali.be
Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
In-Reply-To: <3E1AA7C1000010F1@ocpmta7.freegates.net>
Errors-To: parisc-linux-admin@lists.parisc-linux.org
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux/>

On Mon, Jan 13, 2003 at 07:36:03PM +0100, jsoe0708@tiscali.be wrote:
> Well as mentionned in another mail, I just compile the 2.4.20-pa21 with
> this new release and it always compile well, always boot well but also as
> soon as a network connection is tempted the system still crash.
> 
> And ? it just printout Stack Dump: (thousand time) but nothing more??
> Do I do again something wrong?

probably not. the stack dump is something I sometimes comment out
since it interfers with the register dump (which is more interesting).


> never the less, Here I got the pim info:
> PROCESSOR PIM INFORMATION

> GR2 = 0000000010110850
> Func: inb, Off: 7c, Addr: 0x10110850

> I do not know if it is relevant but HTH (me no :( )

Knowing it's inb() helps a bit. But we really need to know
who called inb. Unless we get a nice stack unwind, we just
have to guess based on activity that caused the crash and
last dmesg output from the console.

Sounds like the networking card you are attempting to
use isn't enabled properly by the driver.
Can you remind me which type of machine this is running
on and which type of NIC you are using?

thanks,
grant
