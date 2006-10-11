From: "James Love" <jlove@scires.com>
Subject: Re: [parisc-linux] NICs on EISA bus...
Date: Wed, 11 Oct 2006 14:19:20 -0400
Message-ID: <452CFD68020000C500004FA3@mail.scires.com>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=US-ASCII
Cc: parisc-linux@lists.parisc-linux.org
To: <James.Bottomley@SteelEye.com>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

Thanks for the response.
This particular 715 appears to have a Scorpio EISA bus adapter.  I see
no mention of WAX as a device in the boot logs (excerpt appended below).
 Is the Scorpio a good or a bad thing in regards to getting this bus
working?  I also have a 755 with a Cobra EISA BA, any idea whether that
will work either?

James

Aug 24 01:29:35 localhost kernel: EISA bus registered
Aug 24 01:29:35 localhost kernel: Searching for devices...
Aug 24 01:29:35 localhost kernel: Found devices:
Aug 24 01:29:35 localhost kernel: 1. Stinger Optional Graphics at
0xf4000000 [0]] { 10, 0x0, 0x006, 0x00077 }
Aug 24 01:29:35 localhost kernel: 2. Scorpio Core BA at 0xf082f000 [2] {
11, 0x00, 0x007, 0x00070 }
Aug 24 01:29:35 localhost kernel: 3. Scorpio Core SCSI at 0xf0825000
[2/0/1] { 11, 0x0, 0x007, 0x00071 }
Aug 24 01:29:35 localhost kernel: 4. Scorpio Core LAN (802.3) at
0xf0826000 [2/0/2] { 10, 0x0, 0x007, 0x00072 }
Aug 24 01:29:35 localhost kernel: 5. Scorpio Core HIL at 0xf0821000
[2/0/3] { 10, 0x0, 0x007, 0x00073 }
Aug 24 01:29:35 localhost kernel: 6. Scorpio Core RS-232 at 0xf0823000
[2/0/4] { 10, 0x0, 0x007, 0x00075 }
Aug 24 01:29:35 localhost kernel: 7. Scorpio Core RS-232 at 0xf0822000
[2/0/5] { 10, 0x0, 0x007, 0x00075 }
Aug 24 01:29:35 localhost kernel: 8. Scorpio Core Centronics at
0xf0824000 [2/0/6] { 10, 0x0, 0x007, 0x00074 }
Aug 24 01:29:35 localhost kernel: 9. Scorpio Audio at 0xf1000000 [2/0/8]
{ 10, 0x0, 0x007, 0x0007b }
Aug 24 01:29:35 localhost kernel: 10. Scorpio EISA BA at 0xfc000000 [4]
{ 11, 0x0, 0x007, 0x00076 }
Aug 24 01:29:35 localhost kernel: 11. Scorpio (715/50) at 0xfffbe000 [8]
{ 0, 0x0, 0x310, 0x00004 }
Aug 24 01:29:35 localhost kernel: 12. Memory at 0xfffbf000 [9] { 1, 0x0,
0x017, 0x00009 }
Aug 24 01:29:35 localhost kernel: CPU(s): 1 x PA7100 (PCX-T) at
50.000000 MHz

>>> James Bottomley <James.Bottomley@SteelEye.com>  >>>
On Wed, 2006-10-11 at 12:22 -0400, James Love wrote:
> Writing a simple EISA driver allows me to read the board id and MAC
off
> the card, but I'm not sure if the IO or interrupts are working
> correctly.  Is there some reason (eg kernel/eisa bus issues) that I
> shouldn't expect to get this to work?  I spend all my time in
userspace,
> so I may very well have driver issues, but I'd like to know whether
this
> is even possible.

It's possible, but I'm not sure it can be done without programming the
WAX interface (that's a thing the person who last read the WAX documents
can tell us ... unfortunately we no longer seem to have a copy of the
docs).

James




_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
