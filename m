From: Kurt Fitzner <kfitzner@excelcia.org>
Subject: [parisc-linux] PCI card in C160
Date: Mon, 15 Aug 2005 00:28:08 -0600
Message-ID: <430035F8.9040900@excelcia.org>
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

I am trying to put an Ethernet card into my new (to me) C160 without any
success.  Any time I put a PCI card in, the machine refused to boot and
gives me the message:

   *****
   ***** Disabled the PCI USB card in slot 3.
   *****
   * *   An unsupported PCI I/O configuration has been detected. * *
   * *   Contact your HP service representative for warranty     * *
   * *   service to enable the card(s) listed above.             * *

I had no trouble with putting a card in my B132L, but it seems to be
more forgiving of hardware.  It has a 5v PCI bus where the C160 is 3.3v.

I've tried two different Ethernet cards and also a USB card I had lying
around - every card I have that was keyed for 3.3v.

I've updated to the latest firmware with no change.

I know this is a little off topic for the list, but it's my guess that
not very many other people except Linux users are putting weird hardware
in their PARISC workstations.

Anyways, if anyone knows of ethernet cards that will work on a C160 - if
you have similar hardware and a success story - I would appreciate
hearing about it.

	Kurt.

_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
