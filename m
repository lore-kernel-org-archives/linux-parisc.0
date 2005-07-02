From: Grant Grundler <grundler@parisc-linux.org>
Subject: Re: [parisc-linux] PCI SCSI Card in slot 1 disabled :(
Date: Sat, 2 Jul 2005 02:44:30 -0600
Message-ID: <20050702084430.GF14091@colo.lackof.org>
References: <E1DnwdK-0006cH-7z@argon.connect.org.uk>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii
Cc: parisc-linux@lists.parisc-linux.org
To: Christopher James Weatherby <chrisw@merseymail.com>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <E1DnwdK-0006cH-7z@argon.connect.org.uk>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

On Thu, Jun 30, 2005 at 11:51:02AM +0100, Christopher James Weatherby wrote:
> Hi Scott,
>          I've had the same problem with my B132L, and pci cards.
>  Its all to do with the Firmware version your machine is running.
>  In the later versions of the Firmware , HP, in its wisdom decided to
> prevent any non-supported cards (from the cards id, rather than the
> chipsets), from running on their workstations, and
> prevent the machine from booting, if one was inserted.

No. HP is not just being obnoxious here.
This was implemented to prevent silent data corruption. 
In certain configurations (e.g B132L and a few other workstations),
Dino version 3.0 and older would silently corrupt data if the address
of the dino register passed over the bus as data.

A service note was published in ~1998-1999 time frame covering this.
Searching parisc-linux mailing list for "dino corruption" I didn't
find any direct references. I advise searching the HP website
directly. Or does some other HP person have a direct reference?


> My machine used to
> happily boot with a wide range of PCI cards, but stopped when I upgraded to
> the last Firmware version (6.1, I think).
>  I think the only solution is to find an older version of the firmware, and
> downgrade the machine. 

No. The only solution is to replace the machine with one
that is repaired. Sorry. :^(

> However I've never been able to find older versions of the firmware for a
> B132L on HP's patch/firmware site (http://itrc.hp.com/ /
> ftp://ftp.itrc.hp.com/ )

That's becuase it's a Bad Idea (tm). That's not by accident.

grant
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
