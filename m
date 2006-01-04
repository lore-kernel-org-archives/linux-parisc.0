From: Matthew Wilcox <matthew@wil.cx>
Subject: Re: [parisc-linux] J2240 - Almost there....
Date: Wed, 4 Jan 2006 10:49:43 -0700
Message-ID: <20060104174943.GP19769@parisc-linux.org>
References: <7d01f9f00601010615v54117490o9a575fd279244524@mail.gmail.com>
	<000401c61003$cea58c60$3401a8c0@POGO>
	<20060104174332.GB20079@colo.lackof.org>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii
Cc: parisc-linux@lists.parisc-linux.org
To: Grant Grundler <grundler@parisc-linux.org>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <20060104174332.GB20079@colo.lackof.org>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

On Wed, Jan 04, 2006 at 10:43:32AM -0700, Grant Grundler wrote:
> ...
> > howlin:~# cat /proc/iomem
> > 00000000-7fffffff : System RAM
> >   00000000-000009ff : PDC data (Page Zero)
> >   00100000-003b4fff : Kernel code
> >   003b5000-00513b03 : Kernel data
> > f0190000-f0190000 : lcd_cmd
> > f0190001-f0190001 : lcd_data
> > f1600000-f3ffffff : GSC Bus [10/]
> >   f1604000-f1604fff : Cujo
> >   f1607800-f1607807 : serial
> >   f1800000-f1ffffff : Cujo LMMIO 0
> > f4000000-f5ffffff : GSC Bus [8/]
> > f6000000-f7ffffff : GSC Bus [10/]
> >   f6000000-f7ffffff : Cujo LMMIO 1
> >     f6000000-f7ffffff : 0000:02:00.0
> >       f6100000-f64fffff : stifb mmio
> >       f7000000-f71fffff : stifb fb
> > f8000000-fff7ffff : GSC Bus [8/]
> >   fc000000-fc000fff : Cujo
> >   fc003800-fc003807 : serial
> >   fc004000-fc004fff : Dino [8/4]
> >   fc800000-fcffffff : Dino [8/4] LMMIO 0
> >     fc800000-fc800fff : 0000:01:13.0
> >       fc800000-fc800fff : sym53c8xx
> >     fc801000-fc8010ff : 0000:01:13.0
> >       fc801000-fc8010ff : sym53c8xx
> >     fc802000-fc80207f : 0000:01:14.0
> >       fc802000-fc80207f : tulip
> >   fd800000-fdffffff : Cujo LMMIO 0
> >     fd800000-fd80ffff : 0000:00:04.0
> >     fd810000-fd81007f : 0000:00:03.0
> >       fd810000-fd81007f : tulip
> >     fd811000-fd81107f : 0000:00:04.0
> >   ffd00000-ffdfffff : Lasi
> >     ffd00000-ffd00fff : Lasi
> >     ffd06000-ffd06fff : Lasi SCSI
> >     ffd08000-ffd08fff : GSC PS2
> > fff80000-fffaffff : Central Bus
> >   fff88000-fff88fff : U2:Uturn
> >   fff8a000-fff8afff : U2:Uturn
> >   fffa0000-fffa0fff : CPU
> >   fffa2000-fffa2fff : CPU
> > fffb0000-fffdffff : Local Broadcast
> > fffe0000-ffffffff : Global Broadcast
> 
> 
> 0000:00:03.0 is tulip in slot 3.
> 0000:01:14.0 is tulip built-in. (my guess)

I disagree.  The 'Cujo' on GSC bus 8 is actually a Dino.  As I said
in my earlier mail, I've now fixed this.  So I think eth0 (00:03.0)
is actually the built-in one.

> > CPU0:  online
> >  domain 0: span ffffffff
> >   groups: 00000001 00000002 00000004 00000008 00000010 00000020 00000040
> > 0000008 0 00000100 00000200 00000400 00000800 00001000 00002000 00004000
> > 00008000 000100 00 00020000 00040000 00080000 00100000 00200000 00400000
> > 00800000 01000000 02000 000 04000000 08000000 10000000 20000000 40000000
> > 80000000
> > CPU1: offline
> >  domain 0: span ffffffff
> >   groups: 00000002 00000004 00000008 00000010 00000020 00000040 00000080
> > 0000010 0 00000200 00000400 00000800 00001000 00002000 00004000 00008000
> > 00010000 000200 00 00040000 00080000 00100000 00200000 00400000 00800000
> > 01000000 02000000 04000 000 08000000 10000000 20000000 40000000 80000000
> > 00000001
> 
> Do we really need this stuff dumped to console?

I think it's no longer dumped to console by current kernels.

_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
