From: Grant Grundler <grundler@parisc-linux.org>
Subject: Re: [parisc-linux] HCRX-24 and missing consoles on my C200
Date: Wed, 7 Dec 2005 11:35:30 -0700
Message-ID: <20051207183530.GC11417__44073.8291982145$1416624571$gmane$org@colo.lackof.org>
References: <43971676.1010009@gmail.com>
	<20051207180130.GB11417@colo.lackof.org>
	<43972408.1020708@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii
Cc: debian-hppa@lists.debian.org,
 parisc-linux@parisc-linux.org
To: Fabio Bizzi <fbizzi@gmail.com>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <43972408.1020708@gmail.com>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

On Wed, Dec 07, 2005 at 07:03:52PM +0100, Fabio Bizzi wrote:
> >STI firmware is failing to initialize itself, not the kernel
> >initializing the card.
> 
> I'm bit confused about it, what do you mean with "the firmware is 
> failing to initialize itself"?

STI is a seperate firmware from PDC and IODC. We have to invoke
the initializaton functions from the OS to get it started.
I'm not STI expert though. And we do have public documentation
for STI that you are "encouraged" to read :^)

	http://ftp.parisc-linux.org/docs/arch/sti.pdf

And sorry, I don't know offhand if any 24bpp graphics cards will work.
Perhaps some are listed in the parisc graphics FAQ or
http://wiki.parisc-linux.org/.

> I'm really sorry for this annoyng issue, next time I'll do as you suggested.

It's not that bad...don't lose any sleep over it.

> Thank you again!

welcome.

ciao!
grant
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
