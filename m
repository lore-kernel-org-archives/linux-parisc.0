Received: from mailserv2.iuinc.com (qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.8.7/8.8.7) with SMTP id LAA02108
	for <parisc-linux@puffin.external.hp.com>; Fri, 11 Jun 1999 11:43:00 -0600
Message-Id: <199906111742.KAA16333@milano.cup.hp.com>
To: Alex deVries <adevries@thepuffingroup.com>
cc: parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] partitioning on HPUX 
In-reply-to: Your message of "Fri, 11 Jun 1999 02:19:43 PDT."
             <3760AA7F.9B62952E@thepuffingroup.com>
Date: Fri, 11 Jun 1999 10:42:46 -0700
From: Grant Grundler <grundler@cup.hp.com>
List-ID: <linux-parisc.vger.kernel.org>

Alex deVries wrote:
> 
> Can anyone here describe how HPUX does partitioning?  We're going to
> have to look at this at some point for interoperability with HPUX
> filesystems.

Besides LVM (with JxFS), HP-UX also supports "Hard Partitioning".
The partition information is encoded in both the kernel and /etc/disktab.
As the note in /etc/disktab says, it's use is strongly discouraged.
The driver behavior is similar to "Soft Partitioning" used on PC's
except that the information is hard coded in an OS table instead
of reading it off reserved sectors on the disk.

Having once supported HP-UX SCSI disk drivers, I can only second the
reccomendation already made to only support "whole disk" file systems.
The whole hard partioning thing was a mess. Eventually, if someone
really needs to partition a disk, some support for LVM could be added
(and hopefully with a better user interface).

grant

ps. "man -k sds" on my 10.20 box reports "sds: nothing appropriate".
I tried it on several in-house timeshare machines and got the same result.
I think this was pre-LVM mirroring/striping support. LVM was pushed
heavily around the 10.X introduction 3 to 4 years ago to replace
the older mirroring/striping. 


> - Alex
> 
> ---------------------------------------------------------------------------
> To unsubscribe: send e-mail to parisc-linux-request@thepuffingroup.com with
> `unsubscribe' as the subject.
> 

Grant Grundler
Enterprise Systems Technology Lab
+1.408.447.7253
