Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from mail.esiee.fr (mail.esiee.fr [147.215.1.3])
	by dsl2.external.hp.com (Postfix) with ESMTP id 1702E4832
	for <parisc-linux@lists.parisc-linux.org>; Fri, 18 Oct 2002 09:44:07 -0600 (MDT)
Message-ID: <3DB02B96.6050702@esiee.fr>
Date: Fri, 18 Oct 2002 17:41:10 +0200
From: Thibaut VARENE <varenet@esiee.fr>
MIME-Version: 1.0
To: phi <phi@hpfrcu03.france.hp.com>
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] Linux version 2.4.19-pa22 uname -a fault.
References: <3DA56CAE00003154@ocpmta8.be.tiscali.com> <3DB015AF.C26FA30B@hpfrcu03.france.hp.com>
Content-Type: text/plain; charset=us-ascii; format=flowed
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

phi wrote:
> Hi All,
> 
> Got a brand new linux src 
> compiled ok got this rev for this cpu
> 
> hpfrcm02:/proc# cat version cpuinfo
> Linux version 2.4.19-pa22 (phi@hpfrcm02) (gcc version 3.0.4) #1 Fri Oct 18
> 13:32:55 CEST 2002
> processor       : 0
> cpu family      : PA-RISC 1.1d
> cpu             : PA7100LC (PCX-L)
> cpu MHz         : 80.000000
> model           : 9000/712
> model name      : Gecko 80 (712/80)
> ..........
> 
> 
> Uname(1) -a goes dumb like this
> 
> non root:
> =========
> hpfrcm02:/home/phi> uname -a
> Memory fault
> 
> As root:
> ========
> hpfrcm02:/proc# uname -a
> Segmentation fault
> 
> hpfrcm02:/home/phi> type uname
> uname is /bin/uname
> 
> hpfrcm02:/home/phi> file /bin/uname
> /bin/uname: ELF 32-bit MSB executable, PA-RISC (LP64) version 1 (GNU/Linux),
> for
>  GNU/Linux 2.4.4, dynamically linked (uses shared libs), stripped
> 
> !!! Is it ok? LP64 for pa1.1 ELF32 (may be just an elf glitch without any
> consequence)
> 
> hpfrcm02:/home/phi> ldd  /bin/uname
>         libc.so.6 => /lib/libc.so.6 (0x40028000)
>         /lib/ld.so.1 => /lib/ld.so.1 (0x40000000)
> 
> Did an apt-get update/upgrade/dist-upgrade, I guess thos shared libs are
> currents
> 
> Any idea?
> Cheers,
> Phi
I saw that recently after dist-upgrading a debian unstable.
There is a bugreport already filled at debian bts.
Dunno if it's closed yet.


Thibaut VARENE
PA/Linux ESIEE Team
http://pateam.esiee.fr/
