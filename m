Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from smtp-out.tiscali.be (spoolm2.tiscalinet.be [212.35.2.51])
	by dsl2.external.hp.com (Postfix) with ESMTP id 7E3F44829
	for <parisc-linux@lists.parisc-linux.org>; Wed,  2 Apr 2003 00:53:23 -0700 (MST)
Date: Wed, 2 Apr 2003 09:53:18 +0200
Message-ID: <3E842746000028D3@ocpmta2.freegates.net>
In-Reply-To: <20030402061310.20117.qmail@web12506.mail.yahoo.com>
From: "Joel Soete" <jsoe0708@tiscali.be>
Subject: RE: [parisc-linux] RAID issues on my C3000
To: "Derek Engelhaupt" <derekengelhaupt@rocketmail.com>,
	parisc-linux@lists.parisc-linux.org
MIME-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"
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

>
>Hey all,
>I was just following the RAID HOWTO posted awile back and I ran into a few
>problems.

I do also for at least 3 of my b180 and it works fine :)


>  I've gotten all the way through creating my RAID partitions and
>copying the data over via tar, making it bootable (after upgrading my PALO
>from source - it is now 1.2), editing all the files on the new md devices,
>and then rebooting.  When I try to boot from the new degraded RAID disk
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
