Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from baldric (baldric.uwo.ca [129.100.10.225])
	by dsl2.external.hp.com (Postfix) with ESMTP id D60D64840
	for <parisc-linux@lists.parisc-linux.org>; Wed,  3 Dec 2003 13:32:08 -0700 (MST)
Received: from carlos by baldric with local (Exim 3.35 #1 (Debian))
	id 1ARdZD-0003TI-00
	for <parisc-linux@lists.parisc-linux.org>; Wed, 03 Dec 2003 15:25:47 -0500
Date: Wed, 3 Dec 2003 15:25:46 -0500
From: Carlos O'Donell <carlos@baldric.uwo.ca>
To: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] [PATCH] ELF32 userspace, ELF64 kernel, and 32-bit signals on hppa. (help needed)
Message-ID: <20031203202546.GI11034@systemhalted>
References: <20031203072126.GB5828@systemhalted>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20031203072126.GB5828@systemhalted>
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

On Wed, Dec 03, 2003 at 02:21:26AM -0500, Carlos O'Donell wrote:
> 
> parisc,
> 
> *** Help needed, code broken ...  ***
> 
> There is a bug hiding in the code... I can't find it yet.
> Userspace sorta works, but sometimes processes go splat, and I think it
> has to do with the following:
> 
> - In restore_context32 I have to ship the 32-bit value into a 64-bit
>   registers. Should it be sign extended?
> = I think yes.
> - Is stack address 0xfffffffffaf00410 the same as 0x00000000faf00410?
> = No?

This turned out to be the issue. I just did a zero-extended load into an
unsigned variable and *everything* works now. I need to go into more
testing now.

c.
