Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from web12501.mail.yahoo.com (web12501.mail.yahoo.com [216.136.173.193])
	by dsl2.external.hp.com (Postfix) with SMTP id D01B04829
	for <parisc-linux@lists.parisc-linux.org>; Wed,  2 Apr 2003 07:18:41 -0700 (MST)
Message-ID: <20030402141841.79074.qmail@web12501.mail.yahoo.com>
Date: Wed, 2 Apr 2003 06:18:41 -0800 (PST)
From: Derek Engelhaupt <derekengelhaupt@rocketmail.com>
Subject: RE: [parisc-linux] RAID issues on my C3000
To: Joel Soete <jsoe0708@tiscali.be>,
	parisc-linux@lists.parisc-linux.org
In-Reply-To: <3E842746000028D3@ocpmta2.freegates.net>
MIME-Version: 1.0
Content-Type: multipart/alternative; boundary="0-1071073824-1049293121=:78102"
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

--0-1071073824-1049293121=:78102
Content-Type: text/plain; charset=us-ascii


I just ran the version of PALO on my root disk and it does say 1.2.  That was my original problem....
derek
 Joel Soete <jsoe0708@tiscali.be> wrote:
>
>Hey all,
>I was just following the RAID HOWTO posted awile back and I ran into a few
>problems.

I do also for at least 3 of my b180 and it works fine :)


> I've gotten all the way through creating my RAID partitions and
>copying the data over via tar, making it bootable (after upgrading my PALO
>from source - it is now 1.2), editing all the files on the new md devices,
>and then rebooting. When I try to boot from the new degraded RAID disk
I
>get that the device is hard booted (with PALO 1.0 not 1.2), displays my
patition
>info (but displays the partitions as "unknown" and not RAID probably due
>to the Palo 1.0 version), and spits out "Selected kernal: /vmlinux from
partition
>2" then "Error: Partition 2 must be ext2".

This is typicaly the message from palo < 1.2 (I also encounter this same
message before figuring out that I forget to update palo on my actual root
disk).
So on your non-raid disk install the last palo dpkg (1.2) (I do it without
pb on a woody pre-libc 2.3.0).
[check the version with palo -? | grep version (must be now 1.2)]
relaunch:
# palo -f YourPathToNew/palo.conf -I YourRaidDIsk

It works for me and hope for you too.

Joel


---------------------------------
Vous surfez avec une ligne classique ?
Economisez jusqu'à 25% avec Tiscali Complete !
Offre spéciale : première année d'abonnement offerte.
... Plus d'info sur http://complete.tiscali.be




---------------------------------
Do you Yahoo!?
Yahoo! Tax Center - File online, calculators, forms, and more
--0-1071073824-1049293121=:78102
Content-Type: text/html; charset=us-ascii

<P>I just ran the version of PALO on my root disk and it does say 1.2.&nbsp; That was my original problem....
<P>derek
<P>&nbsp;<B><I>Joel Soete &lt;jsoe0708@tiscali.be&gt;</I></B> wrote:
<BLOCKQUOTE style="PADDING-LEFT: 5px; MARGIN-LEFT: 5px; BORDER-LEFT: #1010ff 2px solid"><BR>&gt;<BR>&gt;Hey all,<BR>&gt;I was just following the RAID HOWTO posted awile back and I ran into a few<BR>&gt;problems.<BR><BR>I do also for at least 3 of my b180 and it works fine :)<BR><BR><BR>&gt; I've gotten all the way through creating my RAID partitions and<BR>&gt;copying the data over via tar, making it bootable (after upgrading my PALO<BR>&gt;from source - it is now 1.2), editing all the files on the new md devices,<BR>&gt;and then rebooting. When I try to boot from the new degraded RAID disk<BR>I<BR>&gt;get that the device is hard booted (with PALO 1.0 not 1.2), displays my<BR>patition<BR>&gt;info (but displays the partitions as "unknown" and not RAID probably due<BR>&gt;to the Palo 1.0 version), and spits out "Selected kernal: /vmlinux from<BR>partition<BR>&gt;2" then "Error: Partition 2 must be ext2".<BR><BR>This is typicaly the message from palo &lt; 1.2 (I also encounter this same<BR>message before figuring out that I forget to update palo on my actual root<BR>disk).<BR>So on your non-raid disk install the last palo dpkg (1.2) (I do it without<BR>pb on a woody pre-libc 2.3.0).<BR>[check the version with palo -? | grep version (must be now 1.2)]<BR>relaunch:<BR># palo -f YourPathToNew/palo.conf -I YourRaidDIsk<BR><BR>It works for me and hope for you too.<BR><BR>Joel<BR><BR><BR>---------------------------------<BR>Vous surfez avec une ligne classique ?<BR>Economisez jusqu'à 25% avec Tiscali Complete !<BR>Offre spéciale : première année d'abonnement offerte.<BR>... Plus d'info sur http://complete.tiscali.be<BR><BR></BLOCKQUOTE><p><br><hr size=1>Do you Yahoo!?<br>
<a href="http://us.rd.yahoo.com/finance/mailsig/*http://tax.yahoo.com">Yahoo! Tax Center</a> - File online, calculators, forms, and more
--0-1071073824-1049293121=:78102--
