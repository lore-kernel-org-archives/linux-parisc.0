From: Tomasz Korycki <tkorycki@sprint.ca>
Subject: Re: [parisc-linux] Unale to Boot the Cd
Date: Thu, 26 Aug 2004 06:22:23 -0400
Message-ID: <5.2.0.9.0.20040826061513.0365f0c8@pop3.sprint.ca>
References: <412D94F0.9020403@lycos.nl>
	<8BF7471D09AA9B4190A9C96778BC2A1701F8DE9E@qcaexc02.asiapacific.cpqcorp.net>
	<20040825204331.GD23033@tausq.org> <412D94F0.9020403@lycos.nl> <22220.193.160.141.5.1093509494.squirrel@193.160.141.5>
Mime-Version: 1.0
Content-Type: text/plain;
  charset="us-ascii";
  format=flowed
To: parisc-linux@parisc-linux.org
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <22220.193.160.141.5.1093509494.squirrel@193.160.141.5>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

At 04:38 2004-08-26, Andy Walker wrote:
> > A major issue with (older) PA-Risc CDRoms is not addressed in most
> > documentations:
> >
> > Any CDRom player wil work at runtime but booting from the player requires
> > a
> > different blocksize than most other architectures. Correct me if I'm wrong
> > but
> > PA-Risc CDRoms need a 2 KByte blocksize where most other architectures use
> > 512Byte blocksize.
>
>Back to front, I'm afraid. Sun, older HP (and possibly older SGI)

Yes!

>all
>want a block size of 512 bytes for booting. I guess the idea was that
>the ROM monitor could treat cds and harddisks alike if they had the same
>block size = less code!

precisely

>The PC world standardized on 2K bytes. Some cd units, notably Plextor
>handle the 2 Kbytes <-> 512 byte switch automagically in the firmware.
>Good old Toshibas (XM-3301 etc.),

and 3401B. Also NEC Multispin, definitely 3x, I think 6x as well (the ones 
with "flip-down" caddy entry and a lit LCD).

>as loved by HP and Sun, have a couple
>of solder pads that can be cut for 512 bytes and joined for 2K bytes.
>On some units these "switches" are available as jumpers, or exposed as
>switches on the external case.

Some (old Toshibas for sure) could be "tweaked" to do it through code (SCSI 
pages). I remember something about it in 93 or 94 on comp.sys.sgi.admin. 
There was some code posted that did it (at least for me, at least then...)


>For more info google for the Sun CDROM FAQ, or go via www.sunhelp.org.
>
>-Andy
>_______________________________________________
>parisc-linux mailing list
>parisc-linux@lists.parisc-linux.org
>http://lists.parisc-linux.org/mailman/listinfo/parisc-linux

_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
