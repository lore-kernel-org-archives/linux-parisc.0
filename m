From: Andy Walker <andy@puszczka.com>
Subject: Re: [parisc-linux] 2.6.11-rc1-pa3 rp3440 BUG at kernel/workqueue.c:132
Date: Wed, 19 Jan 2005 06:56:13 +0100 (CET)
Message-ID: <28461.193.160.141.5.1106114173.squirrel@193.160.141.5>
References: <20050119074927.GB3879@colo.lackof.org>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=iso-8859-1
Cc: parisc-linux@lists.parisc-linux.org
To: Grant Grundler <grundler@parisc-linux.org>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-reply-to: <20050119074927.GB3879@colo.lackof.org>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

> System paniced at boot.
>
> The odd thing is the "more memory ranges than we support" message
> is out of place since DISCONTIGMEM is enabled.
>
> grant
>
>
> Main Menu: Enter command or menu > bo lan
> Interact with IPL (Y, N, or Cancel)?> n
>
> Booting...
> Boot IO Dependent Code (IODC) revision 3
>
>
> HARD Booted.
> palo ipl 1.5 root@c3k Fri May 14 16:17:38 MDT 2004
>
> Boot image contains:
>     0/vmlinux64 6585304 bytes @ 0xa000
>
> Command line for kernel: '0/vmlinux64 root=/dev/nfs
> nfsroot=192.168.1.61:/home/tftpboot/ion ip=dhcp console=ttyS1
> palo_kernel=0'
> Selected kernel:  from partition 0
> Warning: kernel name doesn't end with 32 or 64 -- Guessing... Choosing
> 64-bit kernelELF64 executable
> Entry 00100000 first 00100000 n 3
> Segment 0 load 00100000 size 4806272 mediaptr 0x1000
> Segment 1 load 00598000 size 314792 mediaptr 0x497000
> Segment 2 load 005e8000 size 294584 mediaptr 0x4e4000
> Branching to kernel entry point 0x00100000.  If this is the last
> message you see, you may need to switch your console.  This is
> a common symptom -- search the FAQ and mailing list at parisc-linux.org
>
> Linux version 2.6.9-rc1-pa0 (jejb@gsyprf11.external.hp.com) (gcc version
> 3.0.4) #4 SMP Mon Aug 30 07:58:13 PDT 2004

Grant,
2.6.9-rc1-pa0? Doesn't seem to agree with your subject line.
Looks like tftp got hold of an old kernel.

-Andy

_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
