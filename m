From: Joel Soete <soete.joel@tiscali.be>
Subject: Re: [parisc-linux] HP model 612 hard disk not found
Date: Thu, 03 Mar 2005 13:50:19 +0000
Message-ID: <4227161B.6040600@tiscali.be>
References: <200502251214.15993.mszick@wolfbutter.com>	<20050226162901.GA26100@hiauly1.hia.nrc.ca>
	<20050226185626.GC16927@colo.lackof.org>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii;
  format=flowed
Cc: John David Anglin <dave@hiauly1.hia.nrc.ca>,
 parisc-linux@lists.parisc-linux.org,
 "Michael S. Zick" <mszick@wolfbutter.com>
To: Grant Grundler <grundler@parisc-linux.org>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <20050226185626.GC16927@colo.lackof.org>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org



Grant Grundler wrote:
> On Sat, Feb 26, 2005 at 11:29:01AM -0500, John David Anglin wrote:
> 
>>>>But nothing works. 
>>>>How can i mount it. It has a filesystem of HP-UX.
>>>>fdisk command doesn't exist
>>
>>I don't believe that there is support to directly mount HP-UX file
>>systems (i.e., hfs or vxfs).  One way might be using nfs.
> 
> 
> UFS works for HPUX disks the last time I tried it a few years ago.
> 
> But, HPUX LVM is incompatible with linux LVM.
> Ie the HPUX "HFS" (aka UFS) must be "whole disk".
> 
Just to add some fresh test info:
I build such full disk with a hpux-11.00 (bundle dated Dec 2000) on my c110 and tried:
# mount -t ufs /dev/sdc /mnt/UFS-tst
mount: wrong fs type, bad option, bad superblock on /dev/sdc,
        missing codepage or other error
        In some cases useful info is found in syslog - try
        dmesg | tail  or so

dmeg saying:
ufs was compiled with read-only support, can't be mounted as read-write

I changed:
# mount -t ufs -o ro /dev/sdc /mnt/UFS-tst

even thought it accepts to mount system still complaining:
You didn't specify the type of your ufs filesystem

mount -t ufs -o ufstype=sun|sunx86|44bsd|ufs2|5xbsd|old|hp|nextstep|netxstep-cd|openstep ...

 >>>WARNING<<< Wrong ufstype may corrupt your filesystem, default is ufstype=old
ufs_read_super: can't grok fs_clean 0x17

So finaly it was:
# mount -t ufs -o ufstype=hp -o ro /dev/sdc /mnt/UFS-tst

(ufs_read_super: can't grok fs_clean 0x17 message persist; I assume just a warning)

then reading in such fs seems ok (find all file in kernel tree, tar -tvf of kernel src tar)

Thanks Grant,
	Joel
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
