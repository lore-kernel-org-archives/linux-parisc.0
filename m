Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from www.linux.org.uk (parcelfarce.linux.theplanet.co.uk [195.92.249.252])
	by dsl2.external.hp.com (Postfix) with ESMTP id BF89F4867
	for <parisc-linux@lists.parisc-linux.org>; Fri, 22 Feb 2002 13:48:58 -0700 (MST)
Received: from willy by www.linux.org.uk with local (Exim 3.33 #5)
	id 16eMcj-0008Nu-00; Fri, 22 Feb 2002 20:48:57 +0000
Date: Fri, 22 Feb 2002 20:48:57 +0000
From: Matthew Wilcox <willy@debian.org>
To: Yasholomew Yashinski <yashy@mail.yashy.com>
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] palo not booting kernel
Message-ID: <20020222204857.B30545@parcelfarce.linux.theplanet.co.uk>
References: <20020220232407.T96452-100000@mail.yashy.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20020220232407.T96452-100000@mail.yashy.com>; from yashy@mail.yashy.com on Thu, Feb 21, 2002 at 04:54:11PM -0500
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

On Thu, Feb 21, 2002 at 04:54:11PM -0500, Yasholomew Yashinski wrote:
> Partition Start(MB) End(MB) Id Type
> 1               1     244   82 swap
> 2             245     275   f0 Palo
> 3             276    8678   83 ext2
> 
> PALO(F0) partition contains:
>     0/vmlinux32 3324993 bytes @ 0xf440000
> 
> Information: No console specified on kernel command line. This is normal.
> PALO will choose the console currently used by firmware (serial).
> Command line for kernel: 'root=/dev/sdb3 HOME=/ console=ttyS0 TERM=vt102
> palo_ke
> rnel=3/boot/vmlinux'
> Selected kernel: /boot/vmlinux from partition 3
> offset_read(2, 0x0006c824, 128, 1342193664) can't seek past 221249536
> ext2_iget: read errorERROR: open /boot/vmlinux from partition 3 failed

palo doesn't support booting from partitions >2GB

-- 
Revolutions do not require corporate support.
