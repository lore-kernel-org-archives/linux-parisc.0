Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from mail.zigoo.net (e202.dhcp212-198-142.noos.fr [212.198.142.202])
	by dsl2.external.hp.com (Postfix) with ESMTP id 7C65E4829
	for <parisc-linux@parisc-linux.org>; Thu, 17 Apr 2003 17:18:18 -0600 (MDT)
Date: Fri, 18 Apr 2003 01:18:12 +0200
From: Thibaut VARENE <varenet@esiee.fr>
To: "K. David Prince" <kdp@hanhet.loew.washington.edu>,
	parisc-linux@parisc-linux.org
Message-Id: <20030418011812.447eabe4.varenet@esiee.fr>
In-Reply-To: <Pine.LNX.4.44.0304171328170.15587-100000@localhost>
References: <20030417215819.34c93c2d.varenet@esiee.fr>
	<Pine.LNX.4.44.0304171328170.15587-100000@localhost>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Subject: [parisc-linux] Re: HP C180-XP CDROM boot.
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

First of all, this is definitly the LAST time I answer a private mail
coming from a m-l thread. Nothing personnal there, but you're not the
first one, and i'm getting tired repeating the same remarks again and
again.

I'll add a comment about not answering mails in private on the
mailing-list webpage right now since it's not clearly stated.

The most obvious reason NOT TO DO SO is that I HAVE NO CLUE WHAT'S WRONG
with your setup, but somebody else on the m-l might.

Since you didn't CC'd the m-l, if i hadn't posted back to the m-l you
would have lost any chance to get that info.

And for what it's worth, this is not a private lesson. m-l archives are
useful for other buggers to find info in it, darn it! :P


Thibaut VARENE
The PA/Linux ESIEE Team
http://pateam.esiee.fr/

On Thu, 17 Apr 2003 14:27:58 -0700 (PDT)
"K. David Prince" <kdp@hanhet.loew.washington.edu> wrote:

> Well, I eliminated hint #3.  I did pull out the CD-ROM.  I didn't find
> anything that obviously pointed to the block size.  Here's the info I
> have off of the CD-ROM:
> 
> HP CS P/N: A1658-60019	<== Bootable?  I can't find any references on
>                             this.
> 
> "Class 1 Laser Product Per IEC 825"
> 
> Jumper block items:
> 
> ID1		N/J
> ID2		Jumper
> ID4		N/J
> Parity		Jumper
> Term On/Off	N/J
> Prv/Alw		N/J  <== This one may be what I'm looking for.
> Test		N/J
> Power Supply	N/J
> 
> N/J = "No Jumper"
> 
> Is there a special place to find the block size jumper?
> 
> Dave
> 
> On Thu, 17 Apr 2003, Thibaut VARENE wrote:
> 
> > 1) You have a non-bootable CD drive (like some cd recorders and some
> > incompatible cd readers)
> > 2) the block size (usually a jumper on the back) is incorrectly set.
> > Check it's '512'.
> > 3) You have put the CD upside down in the cd tray.
> 
> 
