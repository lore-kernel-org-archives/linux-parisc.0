Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id IAA11902
	for <parisc-linux@puffin.external.hp.com>; Wed, 12 Apr 2000 08:14:35 -0600
From: davisg@Celestica.com
To: parisc-linux@thepuffingroup.com
cc: grundler@cup.hp.com
Message-ID: <852568BF.004E1032.00@tormta3.tor.cel.com>
Date: Wed, 12 Apr 2000 10:13:21 -0400
Subject: Re: [parisc-linux] tulip on parisc-linux
Mime-Version: 1.0
Content-type: text/plain; charset=us-ascii
List-ID: <linux-parisc.vger.kernel.org>




My ignorant $0.02.

Notice that in your original two PCI traces the fetch of the transmit
descriptors appears to be correct.
At least the values shown in the bus trace make sense. Maybe the length of the
fetch is a problem.
But things don't appear to be too bad since the data in the TDs looks good at
this point.

I'm not convinced that the problem is due to Astro I/O TLB problems because
you're showing good
data in the fetch of the TDs. Also, RD/TD fetches use simple PCI Mem Read/Write
cycles,
not Read/Write Line. So this appears to be correct (at least if the traces are
correctley indicating
the types of PCI cycles).

My money is on a timing problem in the CSR register writes. Read on...

Grant Grundler wrote:

> Couple of questions:
> 1) Anyone know if drivers/net/tulip/* (pre3 or later) work on
>    an architecture with 64-byte cachelines?
>    (21143 doc says it supports 8/16/32 byte cachlines)
>

Actually, the units are "longwords", i.e. 32, 64; 128 Byte
cache line sizes.

> 2) The tulip fetches way more data than it needs for the setup frame
>    TX descriptor. (See lines -215 to -4 of the cogent PCI trace).
>    Anyone know why?
>    (I can arrange a free 712/80 for who ever can explain that to me)

No, but can I guess?

CAUTION: too much drivel ahead. Skip to the end though - cause I think
I have a potential solution...

My guess is that you haven't (actually the tulip driver hasn't) set the TER bit
in TDES1 of the last
TD in the ring (which points back to 0x200). Under the assumption that the DMA
engine in the 21143
performs prefetch of descriptors (although admittedly 52 +/- entries is a bit
much particularly
in consideration of the fact that only the first entry has the OWN bit set and
all entries thereafter
are owned by the host) and PBL in CSR0 is cleared, i.e. the free space in the
xmit FIFO prior to
the 21143 issuing a bus request sets the memory read burst lenght (but what does
the xmit FIFO
have to do with prefetch of xmit buffer descriptors -  who knows - I'm merely
guessing). This is
kinda based on reading between the lines of the 21143 HRM since there really
doesn't appear
to be any rational explanation based on the device documentation.

Hmmm, I think I'm liking the PBL theory - assuming that the 21143 PCI master
interface prefetch
engine isn't tightly integrated with the DMA descritor prefetch logic, this long
prefetch of descriptors
may be merely an artifact of the 21143 PCI master interface design. Now I'm
really full-of-****.

How deep is the Xmit FIFO anyway? I can't find a number in the HRM. It has to be
at least 1500
bytes (for store and forward). If the PBL is in fact set based on the Xmit FIFO
threshold setting
rather than the amount of free space as implied in the HRM, then the 52 +/- TDs
fetched is
kinda in the vicinity of half-full: 1500/2 -> 750 Bytes. Which is in the range
of the 836 (209 longwords * 4
bytes/longword) Bytes fetched by the 21143.


Try changing the PBL to something other than 0 and observe the results (length
of TD prefetch)...


Another thought: maybe the Configuration Latency Timer setting is related to
what
you're seeing? Oooh, I just imported your trace into a spread sheet and come up
with a 21143 DMA memory read duration of about 271 PCI clock ticks assuming
30ns clock period. Sounds suspicously close to a max latency of 255 ticks give
or
take assuming bus grant was revoked?


HERE BE DRAGONS (or at least I hope so I can get  a free 712/80):
=========================================================

Wait a minute... why are you writing to CSR5 immediately after setting CSR6
start/stop
xmit.  The HRM says the last thing you should do when setting up is to write to
CSR6.
The device gets pretty picky about what you can get away with thereafter. Maybe
the fact that the tulip driver is writing to CSR5 immediately after setting the
xmit start/stop
bit is causing confusion in device's state. Since the Status Register bits are
Read/Clear,
shouldn't they be cleaned up prior to starting the transmit and/or receive
engines?
Seems like trouble may be possible otherwise, e.g. clearing an event in
progress?

I'm looking at the tulip driver source contained in the 2.3.28 release and I'm
having
trouble understanding how the chip is assured that it can complete what it's
doing
before getting clobbered by some of the later CSR writes. There is no pause
after
starting the load of the setup frame prior to writing to CSR5, CSR7, CSR6 and
then
starting the receive engine in quick succession. Shouldn't there at least be a
delay (let alone status read) to be sure that the xmit engine has started prior
to
clobbering that status register by blindly Writing (Clearing) bits. See the last
dozen
lines of proc tulip_open for the code sequence in question. Shouldn't there be
at least some amount of delays and/or status checking between starting the
Xmit/Rcv
engines and subsequent actions?

Now that I've completely embarrassed myself, why not try simply inserting a
delay immediately after you start the transmit engine for the setup frame to
see if there is indeed some problem in writing to CSR5 so quickly after
launching
the setup frame. Otherwise, everthing else in the traces appear to be normal
prior
to the attempted fetch of the transmit buffer descriptor for the setup frame. Of
course,
the bogus DMA cycles thereafter seem to imply something broke (stating the
obvious).



Although, I haven't given you a concrete  answer, do I still qualify for the
free 712/80 if I'm
on the mark?


Way too much time on this... Maybe I should resolve to be a silent bystander!


Regards,
George

P.S. I have another theory - have you performed a hard reset of the device to
assure
that no residual state lingers from the IODC's use of same during boot. Assuming
you
booted via this devce.





Grant Grundler <grundler@cup.hp.com> on 04/11/2000 12:26:18 AM

To:   parisc-linux@thepuffingroup.com
cc:    (bcc: George G Davis/CCH/Celestica)

Subject:  [parisc-linux] tulip on parisc-linux



[ FYI - I posted this to linux-kernel mailing list earlier today
  and David Miller already replied saying this version of tulip
  driver works on Sparc64 (which has 64-byte cachelines) ]

Hi all,
I'm trying to bring-up tulip driver on an HP C3000 workstation.
I started out using a cogent (adaptec) 21143 PCI board.  I've
collected a PCI bus trace (cogent1.txt) and corresponding console
output (cogent1_cons.txt).  Both can be found on
     ftp://puffin.external.hp.com/pub/parisc/debug.

I then tried a HP 21143 PCI card and got similar results.
Output is in the same place under "hp100bt1*.txt".

The tulip driver in the parisc source tree "works" (NFS root)
for Thomas Bogendoerfer on his A180 (PA1.1, 32-byte cacheline) using
the "built-in" DEC 21143.  IIRC, Thomas pulled the current source
in the parisc-linux tree from 2.3.99-pre3.

Couple of questions:
1) Anyone know if drivers/net/tulip/* (pre3 or later) work on
   an architecture with 64-byte cachelines?
   (21143 doc says it supports 8/16/32 byte cachlines)

2) The tulip fetches way more data than it needs for the setup frame
   TX descriptor. (See lines -215 to -4 of the cogent PCI trace).
   Anyone know why?
   (I can arrange a free 712/80 for who ever can explain that to me)

There is also an issue with the tulip trying to mem_read from 0xfffffffc.
but I think that's a "side effect" of #2 above.


FWIW, my goal was to debug "Dynamic DMA mapping" support for "Astro"
based parisc platforms (eg B1000/C3000/J5000). Interested parties can
look at the code in:
http://puffin.external.hp.com/cgi-bin/cvsview/linux-2.3/arch/parisc/kernel/sba_iommu.c


thanks,
grant

Grant Grundler
grundler@removethis.cup.hp.com

---------------------------------------------------------------------------
To unsubscribe: send e-mail to parisc-linux-request@thepuffingroup.com with
`unsubscribe' as the subject.
