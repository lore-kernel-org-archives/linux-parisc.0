Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
To: ferguson@quango.net
Cc: parisc-linux@lists.parisc-linux.org, debian-hppa@lists.debian.org
In-Reply-To: Message from Bill Ferguson <ferguson@quango.net>
   of "Thu, 03 Jan 2002 01:12:26 PST." <5.1.0.14.2.20020103010257.02f9c440@mail.quango.net>
References: <5.1.0.14.2.20020103010257.02f9c440@mail.quango.net> 
Date: Thu, 03 Jan 2002 10:45:45 -0700
From: Grant Grundler <grundler@dsl2.external.hp.com>
Message-Id: <20020103174545.B89E3482A@dsl2.external.hp.com>
Subject: [parisc-linux] Re: Upgrading 715/100 Firmware
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

Bill Ferguson wrote:
> I know this has been asked a zillion times but bear with me.  I'm pretty 
> new to Linux, but familar with many other operating systems.
> 
> I've got debian 0.9.3 installed on a 715/100.  Seems to work pretty well.
> 
> My question relates to getting the firmware to a "scratch disk"  which 
> Grant speaks of in the archives (in my case sda1 set to type F0).  sdb1, 
> sdb2, sdb3, sdb4 are the disks where the Linux install resides.

"scratch disk" means the whole *disk*. PDC loader doesn't know anything
about partitions.  ie if /dev/sda is "scratch", then use
	dd if=c7x50016.frm of=/dev/sda bs=2k

(Note: bs parameter doesn't do anything since the disk is 512 sectors
no matter what we specify....just a good reminder in case we use different
media)

> I've tried booting from bootp, cdrom, tape, and now scratch disk and I 
> can't get the LIF image to work.

*sigh*. bootp, tape, and disk definitely work - I've done all three.
Are you *sure* it's a LIF image you are playing with?
"lifls C7X50016.frm" under HPUX will display the LIF contents.

Can you compare md5sum output?
	grundler <511>md5sum *.frm
	4d7dc913c507eda18c34e8af29352086  C7X50016.frm

(This is from ftp://ftp.parisc-linux.org/kernels/715/C7X50016.frm)

grant
