Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from mail.gmx.net (mail.gmx.net [213.165.64.20])
	by dsl2.external.hp.com (Postfix) with SMTP id 6E58F482A
	for <parisc-linux@parisc-linux.org>; Wed, 23 Apr 2003 15:09:11 -0600 (MDT)
From: Helge Deller <deller@gmx.de>
To: Matthew Wilcox <willy@debian.org>,
	"K. David Prince" <kdp@hanhet.loew.washington.edu>
Subject: Re: [parisc-linux] Re: HPA4246A framebuffer device.
Date: Wed, 23 Apr 2003 23:09:23 +0200
Cc: parisc-linux@parisc-linux.org
References: <Pine.LNX.4.44.0304211532560.8607-100000@localhost> <20030423185358.GO3140@parcelfarce.linux.theplanet.co.uk>
In-Reply-To: <20030423185358.GO3140@parcelfarce.linux.theplanet.co.uk>
MIME-Version: 1.0
Content-Type: text/plain;
  charset="iso-8859-1"
Message-Id: <200304232309.23628.deller@gmx.de>
Sender: parisc-linux-admin@lists.parisc-linux.org
Errors-To: parisc-linux-admin@lists.parisc-linux.org
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux/>

On Wednesday 23 April 2003 08:53 pm, Matthew Wilcox wrote:
> On Mon, Apr 21, 2003 at 03:45:36PM -0700, K. David Prince wrote:
> > I'm setting up one of our C180-XL machines.  Debian 3.0 is installed and
> > X runs on the internal STI device.  This machine has a second video card,
> > the HPA4246A.  I'd like boot with this as our primary display.  I've
>
> This is a Visualize-48XP graphics card.  There's no support listed for
> it in stifb.  It might be able to work if anyone has specs...

Hi Willy,

yes, you are right:
#define CRT_ID_THUNDER2         0x2F8D570E      /* Thunder 2 VISUALIZE 48 XP*/

Can't someone insided HP take a look what needs to be done, or
if it's compatible to one of the supported cards ?

Regards,
Helge
