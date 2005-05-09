From: "Joel Soete" <soete.joel@tiscali.be>
Subject: RE: [parisc-linux] 2.6.12-rc3-pa3 usb keyboard and mouse don't respond
Date: Mon, 9 May 2005 10:18:58 +0000
Message-ID: <426F252F00004256@mail-3-bnl.tiscali.it>
References: <200505081623.j48GNoF4003723@hiauly1.hia.nrc.ca>
Mime-Version: 1.0
Content-Type: text/plain;
  charset="ISO-8859-15"
To: "John David Anglin" <dave@hiauly1.hia.nrc.ca>,
 parisc-linux@lists.parisc-linux.org
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <200505081623.j48GNoF4003723@hiauly1.hia.nrc.ca>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org


> 
> I tried 2.6.12-rc3-pa3 yesterday but the console keyboard and mouse
> (usb) didn't respond after X came up.  I couldn't see any difference
> in the log files between this version and 2.6.11-pa4.  2.6.11-pa4
> boots ok.  Is this a known problem?
> 
Could it be linked to this related pb:
<http://lists.parisc-linux.org/pipermail/parisc-linux/2005-March/026155.h=
tml>

I had to remove usb support to boot my b2k with 2.6.12-rc1 because of the=

re-work of usb api 
(looks like pci api change) but sorry I didn't find more time to track it=

down :-(

Joel


_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
