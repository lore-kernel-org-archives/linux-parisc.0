Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from www.linux.org.uk (parcelfarce.linux.theplanet.co.uk [195.92.249.252])
	by dsl2.external.hp.com (Postfix) with ESMTP id 06052482A
	for <parisc-linux@parisc-linux.org>; Mon, 17 Dec 2001 07:35:16 -0700 (MST)
Received: from willy by www.linux.org.uk with local (Exim 3.33 #5)
	id 16FyrJ-0001jQ-00; Mon, 17 Dec 2001 14:35:13 +0000
Date: Mon, 17 Dec 2001 14:35:13 +0000
From: Matthew Wilcox <willy@debian.org>
To: Andy Walker <squawker@start.no>
Cc: parisc-linux@parisc-linux.org
Subject: Re: [parisc-linux] Status report - B132L and 725/100
Message-ID: <20011217143513.W10085@parcelfarce.linux.theplanet.co.uk>
References: <1008589643.3c1ddb4b75583@nyepost.start.no>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <1008589643.3c1ddb4b75583@nyepost.start.no>; from squawker@start.no on Mon, Dec 17, 2001 at 12:47:23PM +0100
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

On Mon, Dec 17, 2001 at 12:47:23PM +0100, Andy Walker wrote:
> Both work fine, but the same weird thing with the frame buffer ordering
> occurred with the 725/100 as it did with the B132L last week. With the
> console set in the PDC to the built-in fb, the kernel starts to boot
> on that device, then finds the Coral first and continues to boot
> on that, calling it fb0. Setting the console in PDC to the Coral makes
> everything work properly - the system boots all the way on the Coral.

OK, we need to figure out how to order the fb devices properly.  Right
now, they're initialised in IO tree order.  On a gecko with a graphics
card in the expansion slot, the expansion grahics gets device 0 and the
inbuilt is device 1.  Clearly similar problems exist on other machines.

So could everyone who has two (or more!) graphics cards in their machine
send the two lines of dmesg which describe their graphics card in the
inventory / buswalk section, their machine type (B132, Gecko, etc)
and indicate whether or not it gets them in the right order currently.

Example (made up!):

4. Frobnitz Ultra Graphics (10) at 0xf8000000 [8/1], versions 0xa, 0x0, 0x77
13. Thunder II graphics GSA form (10) at 0xf4000000 [10/8], versions 0xa, 0x0, 0x77
J282, works

Thanks.

-- 
Revolutions do not require corporate support.
