From: Mike Frysinger <vapier@gentoo.org>
Subject: Re: FW: [parisc-linux] Fwd: RE: Hp c3600 Gentoo Installation troubles
Date: Thu, 6 Jan 2005 13:31:50 -0500
Message-ID: <200501061331.50888.vapier@gentoo.org>
References: <NAEELOAPEHKLDEDOLEIHOEOLCCAA.bfisher@intech-intl.com>
Mime-Version: 1.0
Content-Type: text/plain;
  charset="iso-8859-15"
Cc: gentoo-hppa@gentoo.org,
 parisc-linux@parisc-linux.org
To: "Ben Fisher" <bfisher@intech-intl.com>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <NAEELOAPEHKLDEDOLEIHOEOLCCAA.bfisher@intech-intl.com>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

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

that's because you cant mount it.  running palo takes care of all that magic.
-mike
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
