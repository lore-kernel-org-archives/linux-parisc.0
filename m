Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from ntexchange.cat.csiro.au (ntexchange.cat.csiro.au [140.253.12.1])
	by dsl2.external.hp.com (Postfix) with ESMTP id C2C5B4834
	for <parisc-linux@lists.parisc-linux.org>; Sun,  4 Nov 2001 19:58:11 -0700 (MST)
Message-ID: <A8566E157F5FD411BCFB00D0B7816D51C72C0A@ntexchange.cat.csiro.au>
From: Matt.VanDeWerken@csiro.au
To: dan@bigw.org, parisc-linux@lists.parisc-linux.org
Subject: RE: [parisc-linux] Re: FW SCSI (Was hppa binutils/glibc updates)
Date: Mon, 5 Nov 2001 12:54:28 +1000 
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
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

I'm not entirely sure of the current status of the 735 FW SCSI stuff, but
Richard sent me a kernel with some experimental drivers in it to test (he
doesn't have a 735 himself) - it stack faulted on boot, so there's still
problems there.

As far as I understand the situation, the actual chip (ncr '720 I believe)
is well documented, but there's a proprietary HP chip in between the ncr
chip and the machine. It's this chip that's hard to interface to; Richard
has seen some HPUX source and has necessary clearance to use that knowledge,
so it's basically dependent on him.

I, too, would like to see thw FW scsi support going, mostly because I have
two of these machines and would like to use the internal disks (4GB would do
a lot for my network disk space...)

Cheers,
Matthew van de Werken
Electronics Engineer
CSIRO Exploration & Mining - Gravity Group
1 Technology Court - Pullenvale - Qld - 4069 - AUSTRALIA
ph:  +61-7-3327 4685     fax:  +61-7-3327 4455
email:  matt.vandewerken@csiro.au


> -----Original Message-----
> From: Daniel Williams [mailto:dan@bigw.org]
> Sent: Monday, 5 November 2001 12:52 PM
> To: parisc-linux@lists.parisc-linux.org
> Subject: [parisc-linux] Re: FW SCSI (Was hppa binutils/glibc updates)
> 
> 
> What still needs to happen on FW diff SCSI to get it working?
> 
> Dan
> 
> On Sunday, November 4, 2001, at 08:29 PM, Matthew Wilcox wrote:
> 
> > On Sun, Nov 04, 2001 at 09:10:33PM -0500, Christopher C. 
> Chimelis wrote:
> >> If I think of something, I'll write ya.  Also, if I manage to get a
> >> machine, I'm sure you'll be hearing from me (probably will 
> be an Apollo
> >> series 735, fyi...slow, but effective).
> >
> > 735 is a pretty cool machine.  don't get one which requires a
> > fast-wide-diff scsi interface though; we don't have that 
> working yet.
> >
> > --
> > Revolutions do not require corporate support.
> >
> > _______________________________________________
> > parisc-linux mailing list
> > parisc-linux@lists.parisc-linux.org
> > http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
> 
> 
> _______________________________________________
> parisc-linux mailing list
> parisc-linux@lists.parisc-linux.org
> http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
> 
