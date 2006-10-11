From: "James Love" <jlove@scires.com>
Subject: [parisc-linux] NICs on EISA bus...
Date: Wed, 11 Oct 2006 12:22:34 -0400
Message-ID: <452CE20A020000C500004F88@mail.scires.com>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=US-ASCII
To: <parisc-linux@lists.parisc-linux.org>
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

All:
Has anyone gotten any EISA NICs to work successfully with the parisc? 
In particular, the card I'm looking to get running is the HWP1850 (HP
part # 25567-60003).  I found an old reference to this card on the list
( http://lists.parisc-linux.org/hypermail/parisc-linux/7824.html ), but
there was no response.  It appears to use the same intel microcontroller
as the onboard NIC (82596CA), but on an EISA card.  The card is
recognized on my 715/50 running 2.6.12:

Aug 24 01:29:35 localhost kernel: Mongoose EISA Adapter found at
0xfc000000
Aug 24 01:29:35 localhost kernel: Enumerating EISA bus
Aug 24 01:29:35 localhost kernel: EISA slot 1: HWP1850 EISA IRQ 3
Aug 24 01:29:35 localhost kernel: EISA: Probing bus 0 at 4
Aug 24 01:29:35 localhost kernel: EISA: Mainboard HWPC000 detected.
Aug 24 01:29:35 localhost kernel: EISA: slot 1 : HWP1850 detected.
Aug 24 01:29:35 localhost kernel: EISA: Detected 1 card.

Writing a simple EISA driver allows me to read the board id and MAC off
the card, but I'm not sure if the IO or interrupts are working
correctly.  Is there some reason (eg kernel/eisa bus issues) that I
shouldn't expect to get this to work?  I spend all my time in userspace,
so I may very well have driver issues, but I'd like to know whether this
is even possible.

Thanks,
James

_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
