Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from beloit.edu (beloit.edu [144.89.40.1])
	by dsl2.external.hp.com (Postfix) with ESMTP id 80564482B
	for <parisc-linux@lists.parisc-linux.org>; Thu, 25 Oct 2001 23:32:59 -0600 (MDT)
Received: from localhost ([144.89.185.182])
	by beloit.edu (AIX4.3/8.9.3/8.9.0) with ESMTP id AAA35186
	for <parisc-linux@lists.parisc-linux.org>; Fri, 26 Oct 2001 00:27:49 -0500
Date: Fri, 26 Oct 2001 00:32:56 -0500
Subject: Re: [parisc-linux] How to Boot CD on C110 
Content-Type: text/plain; charset=US-ASCII; format=flowed
Mime-Version: 1.0 (Apple Message framework v472)
From: Daniel Williams <dan@bigw.org>
To: parisc-linux@lists.parisc-linux.org
In-Reply-To: <200110260453.WAA05297@puffin.external.hp.com>
Message-Id: <E8D73E09-C9D2-11D5-8938-0030657D1C94@bigw.org>
Sender: parisc-linux-admin@lists.parisc-linux.org
Errors-To: parisc-linux-admin@lists.parisc-linux.org
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Subscribe: <http://lists.parisc-linux.org/cgi-bin/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/cgi-bin/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux/>

OK, so SEArch should see the CD drive regardless.  Should it also see 
the FWSCSI internal HDs?  They don't have anything on them...  But the 
Firmware doesn't show anything after its done searching, not the 2 HDs, 
the CD, or the DDS tape drive.  Whats that about CD option jumpers set 
wrong?  What should the correct configuration be?  The pins that it has 
on the back (its a HP branded toshiba XM-5401B 50pin narrow) are ID1, 
ID2, ID4, PRTY, PRV/ALW, TEST, and TERM.  ID2 and PRTY have jumpers 
connected, the rest are not shorted.  The CD drive case is an HP 
external drive with 2 HD50 pin connectors on the back.  Comes in 
matching case color and design to the C110.  I've got the cable from the 
external drive connected to the SESCSI port on the back of the C110, but 
the external bus is NOT terminated.  However, when connected to the 
internal 50pin narrow bus, it IS terminated, and bootup does not occur 
nor does SEA see it.  Perhaps the CD drive is whacked, I'll have to do 
network boot then :)  Anyone done that with MacOS X?  j/k.

For making a boot CD, what exactly has to be done to make it boot?  How 
does the firmware recognize that a particular media is bootable and what 
steps does it then take to load the bootstrap code into memory and from 
where on the media does that bootstrap code come?  Can the kernel be 
loaded from a plain ISO or does there need to be special 'first block 
magic code' that will do the rest?

If I try to boot of 'core.SCSI.2.0' it comes back and says ENTRY_INIT, 
nextline STATUS=-7, and then a couple of rows of 8 digit numbers, the 
first being 00000080.  What's it trying to do here?

Thanks again,
Dan

On Thursday, October 25, 2001, at 11:53 PM, Grant Grundler wrote:

> Daniel Williams wrote:
>> I've got a C110...  I picked up the .9 ISO and burned it with EasyCD
>> Creator on a Win2k box (I know, I know, but no access to a linux box
>> right now, I'm running FreeBSD and it doesn't have a burner).  Popped 
>> it
>> in and it won't boot.
>
> Uhm...I tried the same trick for IA64 Debian ISO and it didn't work 
> either.
> I should have looked in the parisc-linux mail archives before
> since folks have described how to do it right. Anyway, I found a 
> CD-writer
> on a linux box and ended up using cdrecord.
>
>> Too bad the firmware doesn't see the SCSI CD
>> either, when SEArching on bootup.
>
> "Sea" should see the CD-ROM. Very likely it's not properly
> connected or has the option jumpers set wrong for PDC.
>
>> SCSI CD is ID 2, but what bus is it on?
>
> When it's working right, "sea" should tell you regardless of
> whether it has a CD installed or not (I think).
>
> grant
