Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from web12507.mail.yahoo.com (web12507.mail.yahoo.com [216.136.173.199])
	by dsl2.external.hp.com (Postfix) with SMTP id 7FE724829
	for <parisc-linux@lists.parisc-linux.org>; Sun,  1 Jun 2003 19:34:37 -0600 (MDT)
Message-ID: <20030602013436.90803.qmail@web12507.mail.yahoo.com>
Date: Sun, 1 Jun 2003 18:34:36 -0700 (PDT)
From: Derek Engelhaupt <derekengelhaupt@rocketmail.com>
Subject: Re: [parisc-linux] Installation on a K370 with Debian 3.0r1 + RAID1 boot.
To: Stian "Søiland" <stian@soiland.no>
Cc: parisc-linux@lists.parisc-linux.org
In-Reply-To: <20030531214029.GD9267@itea.ntnu.no>
MIME-Version: 1.0
Content-Type: multipart/alternative; boundary="0-793362612-1054517676=:90307"
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

--0-793362612-1054517676=:90307
Content-Type: text/plain; charset=us-ascii

I could tell you what all those codes are upon boot-up, but it would take awile.  They take up half of the K-Class Service Manual.... ;)  The K-Class manual is not posted on the web, but if you ever have any fault codes scrolling on your terminal or on the LCD I'm sure someone here can help decifer them.  It will actually say FLT XXXX or WARN XXXX.  Warnings will not typically not affect system start-up.  By the way, the way the disks mount in that internal drive housing I think it would be futile to even try to mount anymore disks in there.  Plus you would need a longer/terminated HVD cable with more drive connectors.  You are better off using an external enclosure slaved off of the 10/0 bus which is the external extension of the internal disk cage.
 
derek


Stian Søiland <stian@soiland.no> wrote:
On 2003-05-31 15:54:36, Siraj 'Sid' Rakhada wrote:

> If you skip this step, Debian will boot, but you will be unable to use the
> console.
> Note I have not actually done the above when I was installing - I cheated
> and installed sshd via a chroot setup - because I did not realise the
> ttyB0 major number was incorrect on the install CD. I'm expecting that
> modifying the device as above should work. If I had more time I would have
> tried the above method.

For later boots, devfs and devfsd should be able to handle this if your
kernel supports it.

> This is also the first time I've ever really used a HP box, and they are
> ... interesting :) e.g. is it normal that the machine will take about 10+
> minutes to boot up? (just to get to the boot ROM, nothing to do with linux
> - self tests are enabled, though disabilng them does not make too much of
> a difference).

Oh yeah, my K250 takes ages just to get started, the LCD display and
status line on the serial console changes with different numbers. Any
idea of what all those numbers mean? I suppose they are different parts
that are tested, but a translation would be nice. 

My manuals does not explain these messages in detail..

How ever, nice guide, I wish I had it when I set up my system =)


... goes off-topic:

I have 6 SCSI disks connected, distributed in two raid1-sets for / and
/usr, and a raid5-set for /home. Some of the disks are 4 GB, the rest 2
GB, so I've done dirty tricks with partitions to get the whole thing up,
and not waisting any space, and I now even have a spare disk, although
tests reveal the disk is broken.. I've managed to get two more 2
GB-disk to replace it.. =)

Ah, yes, the K250 is BIG, but there's only room for 4 disks! Stupid!
I've placed one disk beside the CD-rom, connected to the other
controller, and the last disk in an external cabinet =)

I've wondered if it would not be possible to modify the housing to get
room for more disks... Would it be immoral of me to destroy the beauty
of a K250 by cutting some holes here and there? =)


-- 
Stian Søiland Work toward win-win situation. Win-lose
Trondheim, Norway is where you win and the other lose.
http://www.soiland.no/ Lose-lose and lose-win are left as an
exercise to the reader. [Limoncelli/Hogan]
K250 at http://beist.ntnu.nu/ =) 
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux

---------------------------------
Do you Yahoo!?
Free online calendar with sync to Outlook(TM).
--0-793362612-1054517676=:90307
Content-Type: text/html; charset=us-ascii

<DIV>I could tell you what all those codes are upon boot-up, but it would take awile.&nbsp;&nbsp;They take up half of the K-Class Service Manual.... ;)&nbsp; The K-Class manual is not posted on the web, but if you ever have any fault codes scrolling on your terminal or on the LCD I'm sure someone here can help decifer them.&nbsp; It will actually say FLT XXXX or WARN XXXX.&nbsp; Warnings will not typically not affect system start-up.&nbsp; By the way, the way the disks mount in that internal drive housing I think it would be futile to even try to mount anymore disks in there.&nbsp; Plus you would need a longer/terminated HVD cable with more drive connectors.&nbsp; You are better off using an external enclosure slaved off of the 10/0 bus which is the external extension of the internal disk cage.</DIV>
<DIV>&nbsp;</DIV>
<DIV>derek<BR><BR><BR><B><I>Stian Søiland &lt;stian@soiland.no&gt;</I></B> wrote:</DIV>
<BLOCKQUOTE style="PADDING-LEFT: 5px; MARGIN-LEFT: 5px; BORDER-LEFT: #1010ff 2px solid">On 2003-05-31 15:54:36, Siraj 'Sid' Rakhada wrote:<BR><BR>&gt; If you skip this step, Debian will boot, but you will be unable to use the<BR>&gt; console.<BR>&gt; Note I have not actually done the above when I was installing - I cheated<BR>&gt; and installed sshd via a chroot setup - because I did not realise the<BR>&gt; ttyB0 major number was incorrect on the install CD. I'm expecting that<BR>&gt; modifying the device as above should work. If I had more time I would have<BR>&gt; tried the above method.<BR><BR>For later boots, devfs and devfsd should be able to handle this if your<BR>kernel supports it.<BR><BR>&gt; This is also the first time I've ever really used a HP box, and they are<BR>&gt; ... interesting :) e.g. is it normal that the machine will take about 10+<BR>&gt; minutes to boot up? (just to get to the boot ROM, nothing to do with linux<BR>&gt; - self tests are enabled, though disabilng them does not make too much of<BR>&gt; a difference).<BR><BR>Oh yeah, my K250 takes ages just to get started, the LCD display and<BR>status line on the serial console changes with different numbers. Any<BR>idea of what all those numbers mean? I suppose they are different parts<BR>that are tested, but a translation would be nice. <BR><BR>My manuals does not explain these messages in detail..<BR><BR>How ever, nice guide, I wish I had it when I set up my system =)<BR><BR><BR>... goes off-topic:<BR><BR>I have 6 SCSI disks connected, distributed in two raid1-sets for / and<BR>/usr, and a raid5-set for /home. Some of the disks are 4 GB, the rest 2<BR>GB, so I've done dirty tricks with partitions to get the whole thing up,<BR>and not waisting any space, and I now even have a spare disk, although<BR>tests reveal the disk is broken.. I've managed to get two more 2<BR>GB-disk to replace it.. =)<BR><BR>Ah, yes, the K250 is BIG, but there's only room for 4 disks! Stupid!<BR>I've placed one disk beside the CD-rom, connected to the other<BR>controller, and the last disk in an external cabinet =)<BR><BR>I've wondered if it would not be possible to modify the housing to get<BR>room for more disks... Would it be immoral of me to destroy the beauty<BR>of a K250 by cutting some holes here and there? =)<BR><BR><BR>-- <BR>Stian Søiland Work toward win-win situation. Win-lose<BR>Trondheim, Norway is where you win and the other lose.<BR>http://www.soiland.no/ Lose-lose and lose-win are left as an<BR>exercise to the reader. [Limoncelli/Hogan]<BR>K250 at http://beist.ntnu.nu/ =) <BR>_______________________________________________<BR>parisc-linux mailing list<BR>parisc-linux@lists.parisc-linux.org<BR>http://lists.parisc-linux.org/mailman/listinfo/parisc-linux</BLOCKQUOTE><p><hr SIZE=1>
Do you Yahoo!?<br>
Free <a href="http://us.rd.yahoo.com/mail_us/tag/*http://calendar.yahoo.com">online calendar</a> with sync to Outlook(TM).
--0-793362612-1054517676=:90307--
