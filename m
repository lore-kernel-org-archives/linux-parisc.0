Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from mail.gmx.net (mail.gmx.net [213.165.64.20])
	by dsl2.external.hp.com (Postfix) with SMTP id 4F578482A
	for <parisc-linux@parisc-linux.org>; Mon, 17 Dec 2001 15:21:43 -0700 (MST)
Content-Type: text/plain;
  charset="iso-8859-1"
From: Helge Deller <deller@gmx.de>
To: Matthew Wilcox <willy@debian.org>,
	Andy Walker <squawker@start.no>
Subject: Re: [parisc-linux] Status report - B132L and 725/100
Date: Mon, 17 Dec 2001 23:21:01 +0100
Cc: parisc-linux@parisc-linux.org
References: <1008589643.3c1ddb4b75583@nyepost.start.no> <20011217143513.W10085@parcelfarce.linux.theplanet.co.uk>
In-Reply-To: <20011217143513.W10085@parcelfarce.linux.theplanet.co.uk>
MIME-Version: 1.0
Message-Id: <20011217222143.4F578482A@dsl2.external.hp.com>
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

On Monday 17 December 2001 15:35, Matthew Wilcox wrote:
> On Mon, Dec 17, 2001 at 12:47:23PM +0100, Andy Walker wrote:
> > Both work fine, but the same weird thing with the frame buffer ordering
> > occurred with the 725/100 as it did with the B132L last week. With the
> > console set in the PDC to the built-in fb, the kernel starts to boot
> > on that device, then finds the Coral first and continues to boot
> > on that, calling it fb0. Setting the console in PDC to the Coral makes
> > everything work properly - the system boots all the way on the Coral.
>
> OK, we need to figure out how to order the fb devices properly.  Right
> now, they're initialised in IO tree order.  On a gecko with a graphics
> card in the expansion slot, the expansion grahics gets device 0 and the
> inbuilt is device 1.  Clearly similar problems exist on other machines.

Hi Matthew, List,

I think a better solution would be to sort the found graphic devices by the hpa.
Acording to the sti documentation the only allowed hpa's (at least for GSC 
and SGCsystems) are 0xf8000000, 0xf4000000, 0xfa000000 and 0xf6000000.
0xf8000000 is always the build-in graphic device (e.g. Artist) and should be by default fb0,
0xf4000000 is described in the 712 memory map as  second Artist (second gfx card)
and should be fb1, and equally  0xfa000000 and 0xf6000000 should be used as
 fb2 and fb3 (or vice versa - I didn't checked those last two).
In case the user wants to override with the sti= parameter the kernel should now
select this entry (e.g. sti=1 should select the card at 0xf4000000).

I didn't looked at the implementation really hard yet, but I think this shouldn't be 
that hard to code.

Helge
