Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from web12508.mail.yahoo.com (web12508.mail.yahoo.com [216.136.173.200])
	by dsl2.external.hp.com (Postfix) with SMTP id 7B09F4829
	for <parisc-linux@parisc-linux.org>; Thu, 17 Apr 2003 19:00:18 -0600 (MDT)
Message-ID: <20030418010017.41399.qmail@web12508.mail.yahoo.com>
Date: Thu, 17 Apr 2003 18:00:17 -0700 (PDT)
From: Derek Engelhaupt <derekengelhaupt@rocketmail.com>
Subject: Re: [parisc-linux] Re: HP C180-XP CDROM boot.
To: kdp@hanhet.loew.washington.edu, parisc-linux@parisc-linux.org
In-Reply-To: <20030418011812.447eabe4.varenet@esiee.fr>
MIME-Version: 1.0
Content-Type: multipart/alternative; boundary="0-268550428-1050627617=:40984"
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

--0-268550428-1050627617=:40984
Content-Type: text/plain; charset=us-ascii

That part number is just a standard HP CDROM from a UNIX workstation as it should be coming out of a C180.  It is and will boot if you are booting from a bootable CD.  If you burned a netiso image and it won't boot, I'd start there.  You could test it's ability to boot by trying to boot an HP OS install disk.  If that works, it's your Debian CD.  If that doesn't work, then it sounds like you have a bad CDROM.  You can also do a "sea ipl" from the main menu prompt after the system finishes selftest.  If the media in the drive or on the hard drives is bootable, they will show up.  This search does take some time because it is actually reading the boot sectors of the tape, CD, or hard drives it's scanning.  I would say if you hear your CD spin up and look for the boot sector during this search and it doesn't come back with bootable media, I would verify your CD you are trying to boot from. derekHP CE

Thibaut VARENE <varenet@esiee.fr> wrote:First of all, this is definitly the LAST time I answer a private mail
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
"K. David Prince" wrote:

> Well, I eliminated hint #3. I did pull out the CD-ROM. I didn't find
> anything that obviously pointed to the block size. Here's the info I
> have off of the CD-ROM:
> 
> HP CS P/N: A1658-60019 <== Bootable? I can't find any references on
> this.
> 
> "Class 1 Laser Product Per IEC 825"
> 
> Jumper block items:
> 
> ID1 N/J
> ID2 Jumper
> ID4 N/J
> Parity Jumper
> Term On/Off N/J
> Prv/Alw N/J <== This one may be what I'm looking for.
> Test N/J
> Power Supply N/J
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
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux


---------------------------------
Do you Yahoo!?
The New Yahoo! Search - Faster. Easier. Bingo.
--0-268550428-1050627617=:40984
Content-Type: text/html; charset=us-ascii

<DIV>That part number is just a standard HP CDROM from a UNIX workstation as it should be coming out of a C180.&nbsp; It is and will boot if you are booting from a bootable CD.&nbsp; If you burned a netiso image and it won't boot, I'd start there.&nbsp; You could test it's ability to boot by trying to boot an HP OS install disk.&nbsp; If that works, it's your Debian CD.&nbsp; If that doesn't work, then it sounds like you have a bad CDROM.&nbsp; You can also do a "sea ipl" from the main menu prompt after the system finishes selftest.&nbsp; If the media in the drive or on the hard drives is bootable, they will show up.&nbsp; This search does take some time because it is actually reading the boot sectors of the tape, CD, or hard drives it's scanning.&nbsp; I would say if you hear your CD spin up and look for the boot sector during this search and it doesn't come back with bootable media, I would verify your CD you are trying to boot from.</DIV>
<DIV>&nbsp;</DIV>
<DIV>derek</DIV>
<DIV>HP CE<BR><BR><B><I>Thibaut VARENE &lt;varenet@esiee.fr&gt;</I></B> wrote:</DIV>
<BLOCKQUOTE style="PADDING-LEFT: 5px; MARGIN-LEFT: 5px; BORDER-LEFT: #1010ff 2px solid">First of all, this is definitly the LAST time I answer a private mail<BR>coming from a m-l thread. Nothing personnal there, but you're not the<BR>first one, and i'm getting tired repeating the same remarks again and<BR>again.<BR><BR>I'll add a comment about not answering mails in private on the<BR>mailing-list webpage right now since it's not clearly stated.<BR><BR>The most obvious reason NOT TO DO SO is that I HAVE NO CLUE WHAT'S WRONG<BR>with your setup, but somebody else on the m-l might.<BR><BR>Since you didn't CC'd the m-l, if i hadn't posted back to the m-l you<BR>would have lost any chance to get that info.<BR><BR>And for what it's worth, this is not a private lesson. m-l archives are<BR>useful for other buggers to find info in it, darn it! :P<BR><BR><BR>Thibaut VARENE<BR>The PA/Linux ESIEE Team<BR>http://pateam.esiee.fr/<BR><BR>On Thu, 17 Apr 2003 14:27:58 -0700 (PDT)<BR>"K. David Prince" <KDP@HANHET.LOEW.WASHINGTON.EDU>wrote:<BR><BR>&gt; Well, I eliminated hint #3. I did pull out the CD-ROM. I didn't find<BR>&gt; anything that obviously pointed to the block size. Here's the info I<BR>&gt; have off of the CD-ROM:<BR>&gt; <BR>&gt; HP CS P/N: A1658-60019 &lt;== Bootable? I can't find any references on<BR>&gt; this.<BR>&gt; <BR>&gt; "Class 1 Laser Product Per IEC 825"<BR>&gt; <BR>&gt; Jumper block items:<BR>&gt; <BR>&gt; ID1 N/J<BR>&gt; ID2 Jumper<BR>&gt; ID4 N/J<BR>&gt; Parity Jumper<BR>&gt; Term On/Off N/J<BR>&gt; Prv/Alw N/J &lt;== This one may be what I'm looking for.<BR>&gt; Test N/J<BR>&gt; Power Supply N/J<BR>&gt; <BR>&gt; N/J = "No Jumper"<BR>&gt; <BR>&gt; Is there a special place to find the block size jumper?<BR>&gt; <BR>&gt; Dave<BR>&gt; <BR>&gt; On Thu, 17 Apr 2003, Thibaut VARENE wrote:<BR>&gt; <BR>&gt; &gt; 1) You have a non-bootable CD drive (like some cd recorders and some<BR>&gt; &gt; incompatible cd readers)<BR>&gt; &gt; 2) the block size (usually a jumper on the back) is incorrectly set.<BR>&gt; &gt; Check it's '512'.<BR>&gt; &gt; 3) You have put the CD upside down in the cd tray.<BR>&gt; <BR>&gt; <BR>_______________________________________________<BR>parisc-linux mailing list<BR>parisc-linux@lists.parisc-linux.org<BR>http://lists.parisc-linux.org/mailman/listinfo/parisc-linux</BLOCKQUOTE><p><br><hr size=1>Do you Yahoo!?<br>
<a href="http://us.rd.yahoo.com/search/mailsig/*http://search.yahoo.com">The New Yahoo! Search</a> - Faster. Easier. Bingo.
--0-268550428-1050627617=:40984--
