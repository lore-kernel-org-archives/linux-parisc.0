Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from elvis.franken.de (elvis.franken.de [193.175.24.41])
	by dsl2.external.hp.com (Postfix) with ESMTP id BC760482A
	for <parisc-linux@lists.parisc-linux.org>; Tue,  8 Jan 2002 07:13:06 -0700 (MST)
Date: Tue, 8 Jan 2002 14:44:36 +0100
From: Thomas Bogendoerfer <tsbogend@elvis.franken.de>
To: John Marvin <jsm@udlkern.fc.hp.com>
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] any info on 710/Bushmaster Audio available?
Message-ID: <20020108134436.GA24909@elvis.franken.de>
Reply-To: tsbogend@alpha.franken.de
References: <200201081230.FAA22547@udlkern.fc.hp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <200201081230.FAA22547@udlkern.fc.hp.com>
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

On Tue, Jan 08, 2002 at 05:30:04AM -0700, John Marvin wrote:
> The audio codec on the 705/710 is a Siemens PSB 2160. I tried looking
> on their website for information, and the only info I found was that
> it was replaced by the PSB 2161. I don't know if you can still find
> documentation on that old chip, or if the PSB 2161 is programmatically
> similar. I cannot currently locate my printed documentation on the
> chip.

I have a dead tree version of the datasheet here and compared
it to the PSB2161. The internal registers are different. The PSB2160
has less features, so some of the config bits of the PSB2161 aren't
available and common bits are sometimes shifted around.

> The interface to the PSB 2160 is the same as what was developed for
> "Woody", otherwise known as a 425e, which was a 68040 based HP
> workstation. I've enclosed what little documentation exists for
> the 68040 interface. If you can find documentation on the PSB 2160
> then you should be able to use the following information to write
> a driver.

yes, looks doable. I'm not sure, whether I have the time to it myself,
but I could help people with questions about the PSB2160 config registers
(I'll write the register bits down and put it online during the next days).

Thomas.
