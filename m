Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from beloit.edu (beloit.edu [144.89.40.1])
	by dsl2.external.hp.com (Postfix) with ESMTP id 4997E482B
	for <parisc-linux@lists.parisc-linux.org>; Fri,  2 Nov 2001 10:19:25 -0700 (MST)
Received: from localhost ([144.89.185.182])
	by beloit.edu (AIX4.3/8.9.3/8.9.0) with ESMTP id LAA25182
	for <parisc-linux@lists.parisc-linux.org>; Fri, 2 Nov 2001 11:14:00 -0600
Date: Fri, 2 Nov 2001 11:19:22 -0600
Subject: Re: [parisc-linux] More Install on C110: Kernel doesn't load... 
Content-Type: text/plain; charset=US-ASCII; format=flowed
Mime-Version: 1.0 (Apple Message framework v472)
From: Daniel Williams <dan@bigw.org>
To: parisc-linux@lists.parisc-linux.org
In-Reply-To: <E15zhlW-0006XZ-00@noam.fc.hp.com>
Message-Id: <C1EFE8B4-CFB5-11D5-A1E4-0030657D1C94@bigw.org>
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

I was under the impression, from reading the READMEs on the CD that I'd 
need to make it bootable, that the downloaded ISO isn't bootable in the 
first place...  This is probably wrong now that you bring it up :)  But 
I haven't tried to burn a CD from the virgin downloaded ISO that wasn't 
changed by my palo.  I'll try that.

Dan

On Friday, November 2, 2001, at 11:05 AM, Paul Bame wrote:

>
> I'm missing some information -- something doesn't feel right.
>
> Your downloaded ISO didn't work at first but now you've discovered
> the magic for how to burn CDs.  I would try the 0.92
> downloaded ISO again in that case.  If it fails, the ISO is probably
> corrupt, and neither it, nor any magic you might do upon it by porting
> palo yourself, is a reliable repair.
>
> Basically if you can burn your home-grown ISO and get as far as you
> have, you should be able to burn the downloaded one too the same
> way.  Check the md5 signature to see if the download is OK.
>
> Why run palo unless you need a different kernel than is on the 
> downloaded
> ISO?
>
> = The ISO image burned is 137,854,976 bytes in length...  at some point
> = here I'll cat /dev/cdrom > /dev/null to check the media and make sure
> = there's not a problem, but I'd be inclined to think its something with
> = the format on CD...  Here's the file I fed into my port of palo:
> =
> = -c0/vmlinux root=/dev/ram initrd=0/ramdisk
> = -k/Volumes/palinux-0.9.1/debian/dists/sid/main/disks-
> = hppa/current/32/vmlinux
> = -b/Volumes/palinux-0.9.1/iplboot
> = -r/Volumes/palinux-0.9.1/debian/dists/sid/main/disks-
> = hppa/current/root.bin
> = -C./palinux-0.9.2.iso
> =
> = When mounted, the 0.9.2 ISO's name is palinux-0.9.1, because it was
> = mastered like that?  Anyway, I assume the kernels on the ISO image are
> = OK to use?  I can't of course compile them myself because I don't have
> = an hppa cross compiler (no x86 box).
> =
> = Dan
> =
> = On Friday, November 2, 2001, at 10:18 AM, Paul Bame wrote:
> =
> = > = >Entry 00100000 first 00100000 n 4
> = > = >Segment 0 load 00100000 size 160694 mediaptr 0x1000
> = > = >Segment 1 load 0028a000 size 468472 mediaptr 0x18a000
> = > = >Segment 2 load 00300000 size 8192 mediaptr 0x1fd000
> = > = >Segment 3 load 0034bea8 size 80688 mediaptr 0x1ffea8
> = > = >
> = > = >Error: read from boot device failed (status = -4)
> = > = >byteio_read: seekread() returned -1 expected 2048
> = > = >Error:  segment 0 read() failed
> = >
> = > palo has read thee ELF header by then, but fails to read the first
> = > program segment (0).  It's unusual for things to die here.  The
> = > firmware docs say error -4 is "unrecoverable hardware error".
> = > Perhaps the ISO image got truncated or is shorter than it should be?
> = >
> = > 	-P
> = >
> = > 	-P
> =
> =
> = _______________________________________________
> = parisc-linux mailing list
> = parisc-linux@lists.parisc-linux.org
> = http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
> =
