From: "Ben Fisher" <bfisher@intech-intl.com>
Subject: RE: FW: [parisc-linux] Fwd: RE: Hp c3600 Gentoo Installation troubles
Date: Thu, 6 Jan 2005 13:48:38 -0500
Message-ID: <NAEELOAPEHKLDEDOLEIHMEOMCCAA.bfisher@intech-intl.com>
References: <200501061331.50888.vapier@gentoo.org>
Mime-Version: 1.0
Content-Type: text/plain;
  charset="iso-8859-15"
Cc: gentoo-hppa@gentoo.org,
 parisc-linux@parisc-linux.org
To: "Mike Frysinger" <vapier@gentoo.org>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <200501061331.50888.vapier@gentoo.org>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

Mike -

> that's because you cant mount it.  running palo takes care of all that
magic.

What do you do about /etc/fstab for the f0 partition?  Can that make palo
stop working?

I read some stuff last night online about HPUX users having similar troubles
if they did not run "lifinit" to initialize the LIF image.  Is there a
command in Gentoo which does this?  Is palo supposed to take care of it?

Is there anything else I could have done wrong to create this problem?
Since you have a working c3600 with Gentoo, could you send me a copy of your
/etc/palo.conf, /etc/fstab, and any other configuration files you think
important?

Finally, what Graphics card are you using on your machine?  I think I've
still got the FX-e card in my system, and I'm thinking about trading it for
an ATI Radeon so I can run X, KDE, etc.

Thanks for all your help!

-Ben

-----Original Message-----
From: Mike Frysinger [mailto:vapier@gentoo.org]
Sent: Thursday, January 06, 2005 1:32 PM
To: Ben Fisher
Cc: gentoo-hppa@gentoo.org; parisc-linux@parisc-linux.org
Subject: Re: FW: [parisc-linux] Fwd: RE: Hp c3600 Gentoo Installation
troubles

On Thursday 06 January 2005 01:05 pm, Ben Fisher wrote:
> (I could not get the 64 bit version to work at all! - no
> hppa 64 bit gcc compiler, or something like that),

on gentoo you have to emerge the 64bit compiler sep from the regular 32bit
one ... then again, i wouldnt recommend trying it until you're sure you can
get a 32bit kernel to boot (i havent been able to boot a 64bit kern on my
C360 in quite sometime, i dont think i tried on the C3600)

> Palo version 1.2 root@LiveCD Wen Jan 5 21:35:19 EST 2005
> Partition Start (MB)  End (MB)          ID      Type
> 1               1       16      f0      Palo
> 2               17      78      83      EXT2
> 3               79      1033    82      SWAP
> 4               1034    8678    83      EXT2
> IPL: ADDR 16384  Size 34816 Entry 0x0
> Ko 0x0 ksz 0 k640 0x0 k64sz 0 rdo 0 rdsz 0
> <2/kernel-2.6.7 ROOT=/dev/sda4 HOME=/>
> IPL: ADDR 16384  Size 34816 Entry 0x0
> Ko 0x0 ksz 0 k640 0x0 k64sz 0 rdo 0 rdsz 0
> <2/kernel-2.6.7 ROOT=/dev/sda4 HOME=/>

looks sane to me ...

> One theory I have is that the instruction guide never told me where to
> mount the f0 partition.  So far as the computer knows, it's just sitting
> there, probably not being written to.

that's because you cant mount it.  running palo takes care of all that
magic.
-mike

_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
