From: Scott Edwards <supadupa@gmail.com>
Subject: [parisc-linux] PCI SCSI Card in slot 1 disabled :(
Date: Wed, 29 Jun 2005 22:29:59 -0600
Message-ID: <a53adc460506292129682c06d8@mail.gmail.com>
Reply-To: Scott Edwards <supadupa@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=ISO-8859-1
To: parisc-linux@lists.parisc-linux.org
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

I have a B132L workstation that I just added a symbios SCSI card to.=20
I've unable to complete POST.  Upon bootup I see a message like this:

Primary boot path   SESCSI.6.0
Alternate boot path  SESCSI.0.0
Console path   GRAPHICS(0)
Keyboard path:   PS2
 *****
  *****  Disabled the PCI SCSI card in slot 1.
 *****

An unsupported PCI I/O configuration has been detected.

Contact you HP service representative for warranty service to enable
the card(s) listed above.

To use this system before those repairs are complete, power down the
system, remove the card(s) listed above, and reboot.

Halting the system.

---

This card appears to the use the same chipset as the B132L+ (mine is
only B132L, no plus)

http://www.openpa.net/scsi.html#875

If anyone knows how to enable this card, please let me know.  I only
found one similar reference on google groups, and nothing on google
about this.  I assume this card is safe, IMO the halt message is more
about HP's self interest HCL then damage on the system. (besides, how
do they know this card will work with HP-UX?)  Irrelevant as it's
Debian Sarge with stock 2.6 kernel.

Thanks in advance. I look forward to your responses.


Scott Edwards
--
Daxal Communications - http://www.daxal.com
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
