Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from mailserver1.hrz.tu-darmstadt.de (mailserver1.hrz.tu-darmstadt.de [130.83.126.41])
	by dsl2.external.hp.com (Postfix) with ESMTP id ACAD0482F
	for <parisc-linux@lists.parisc-linux.org>; Thu, 11 Oct 2001 04:52:03 -0600 (MDT)
Date: Mon, 8 Oct 2001 18:39:17 +0200
From: hgrothe@mathematik.tu-darmstadt.de
To: parisc-linux@lists.parisc-linux.org
Cc: debian-hppa@lists.debian.org
Message-ID: <20011008183917.A15822@mathematik.tu-darmstadt.de>
References: <1002553729.3bc1c18187924@webmail.tiscalinet.be>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <1002553729.3bc1c18187924@webmail.tiscalinet.be>; from joel.soete@freebel.net on Mon, Oct 08, 2001 at 05:08:49PM +0200
Subject: [parisc-linux] Re: LVM 1.0.1-rc4 on hppa
List-ID: <linux-parisc.vger.kernel.org>

On Mon, Oct 08, 2001 at 05:08:49PM +0200, joel.soete@freebel.net wrote:
> 
> I just co the last cvs of kernel 2.4.9-pa42 and everything seems to work find as 
> well as on model 712 as on model B180.
> 
> Then I try to have a look into LVM (last 1.0.1-rc4)on the B180:
> no error at compile time neither for kernel neither for tools (just warning: 
> pv_read_all_pv_of_vg.c:129: warning: deprecated use of label at end of compound 
> statement)
> 
> Then I try first to do a 'pvcreate /dev/sdb' which failed:
> vpcreate -- ERROR: "/etc/lvmtab" doesn't exist; please run vgscan
> 
> Also I excute 'vgscan':
> Segmentation fault.
>
lvm-1.0.1-rc4 (as well as lvm-1.0.1-rc2) works fine for me on various
2.4.9-paXX kernels including 2.4.9-pa42 (see below).

I guess :-) that you compiled the lvm-tools with optimization. Since 
there seems to be a general problem with the lvm-tools and gcc3 (appears 
also on other architectures (see lvm mailing list)) recompile the 
lvm-tools without optimisation or "weak" optimisation (-O0).

HTH, Holger

$ uname -a
Linux fb0483 2.4.9-pa42 #1 Mon Oct 8 14:07:25 CEST 2001 parisc unknown
$ df
Filesystem           1k-blocks      Used Available Use% Mounted on
/dev/sda3               126916     51947     68413  44% /
/dev/vg00/lvol1         507748     70439    411095  15% /var
/dev/vg00/lvol2        3096336   2563960    375092  88% /usr
/dev/vg00/lvol3         253871     55726    185038  24% /home
/dev/vg00/lvol4          87261     65674     17082  80% /usr/local
/dev/vg01/lvol1        1052632    125496    927136  12% /work 

-- 
Holger Grothe  (Email: hgrothe@mathematik.tu-darmstadt.de)
Fachbereich Mathematik, TU Darmstadt
