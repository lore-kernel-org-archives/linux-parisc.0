Return-Path: <grundler@lackof.org>
Received: from colo.lackof.org (colo.lackof.org [198.49.126.79])
	by dsl2.external.hp.com (Postfix) with ESMTP id C0416484B
	for <parisc-linux@lists.parisc-linux.org>;
	Sun,  7 Dec 2003 01:20:07 -0700 (MST)
Date: Sun, 7 Dec 2003 01:20:06 -0700
From: Grant Grundler <grundler@parisc-linux.org>
To: Randolph Chung <randolph@tausq.org>
Subject: Re: [parisc-linux] [patch] Get superio serial to work with 2.6
Message-ID: <20031207082006.GA8167@colo.lackof.org>
References: <20031207041018.GN20133@tausq.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20031207041018.GN20133@tausq.org>
Cc: parisc-linux@lists.parisc-linux.org
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>

On Sat, Dec 06, 2003 at 08:10:18PM -0800, Randolph Chung wrote:
> This patch is needed to get serial console to work on SuckyIO based
> systems on 2.6. It was mostly done by Grant (and willy, I think)
> 
> Unfortunately it requires disabling some bits of code in inventory. What
> do you guys think?

My preference right now is to move those PDC calls into sba_cdio.c.
Then add hueristics that call PDC_IO_RESET_AND_CLEAR if suckyio/USB
is active or the LAN active. If suckyio serial console, then add code
to save/restore suckyio config space around the reset.

So quite a bit of hackery that's really only needed when the
IO MMU is actually used.

> Can someone try this on a suckyio system that has USB running?

hrm...I don't have the serial console setup at the moment.
I suggest plugging in a USB mouse and moving the mouse around
during boot. Not sure that's sufficient but maybe.

The USB/DMA problem occurs when booting with USB Keyboard/mouse
and not a serial console. Ie, until 2.6.0 boots with STICON
enabled, I can't really test the USB/DMA stuff.

grant
