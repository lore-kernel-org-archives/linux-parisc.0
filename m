Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Date: Sun, 2 Feb 2003 23:03:59 -0700
To: "Aaron St. Pierre" <asp@ungod.com>
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] kernel compile
Message-ID: <20030203060359.GF29454@dsl2.external.hp.com>
References: <20030203020247.GB1046@hadron> <20030203041122.GB29454@dsl2.external.hp.com> <20030203053336.GC1046@hadron>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20030203053336.GC1046@hadron>
From: grundler@dsl2.external.hp.com (Grant Grundler)
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

On Mon, Feb 03, 2003 at 12:33:36AM -0500, Aaron St. Pierre wrote:
> I setup a page with all of the information from the "basics" section
> of the faq. That page is : http://hadron.dyndns.org/parisc/

very good.

j2240 is pa8200 - ie 64-bit capable.
But don't use 64-bit kernel unless you know why you need to.

> Grant, I did as you said, and the same thing happened. What disturbs me
> is when it stopped at the brancing message and I waited about 15 minutes
> then pressed the toc button there was still nothing in the pim ( I
> cleared it prior to boot) I hope this doesn't mean the kernel isn't even
> loading and it has something to do with palo. 

your PIM dump only has the HPMC/memory/IO sections.
Didn't "ser pim" give you LPMC and TOC sections too?

Secondly, since your j2240 is dual CPU, the PIM dump should contain
the same info (HPMC, LPMC, TOC) for both CPUs.

Can you check if you firmware is anywhere near the current?
(See http://www.parisc-linux.org/faq/index.html#PDCupdate)


And the following from your log worries me despite the "ignore" part:
| Information: Boot device can't seek past 2Gb (ignore next error).
| byteio_read: seekread() returned -1 expected 2048

But nothing else indicated a problem loading the vmlinux.
I just don't see that when booting my a500.
It could be a difference in how palo interacts with IODC.

If you don't get any other hot tips, start disabling things in
the .config that you don't need: Parport, SBA/LBA/IOSAPIC,
USB, LCD/LED support, wireless, extra lan/scsi drivers, etc.

grant
