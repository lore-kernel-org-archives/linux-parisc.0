Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from elvis.franken.de (elvis.franken.de [193.175.24.41])
	by dsl2.external.hp.com (Postfix) with ESMTP id D6A9E4829
	for <parisc-linux@lists.parisc-linux.org>; Wed, 16 Apr 2003 11:53:34 -0600 (MDT)
Date: Wed, 16 Apr 2003 19:52:23 +0200
To: "M. Grabert" <xam@cs.ucc.ie>
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] STI fb questions
Message-ID: <20030416175223.GB4982@solo.franken.de>
References: <Pine.LNX.4.44.0304161319540.28370-100000@sal.ucc.ie>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <Pine.LNX.4.44.0304161319540.28370-100000@sal.ucc.ie>
From: tsbogend@alpha.franken.de (Thomas Bogendoerfer)
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

On Wed, Apr 16, 2003 at 01:28:43PM +0100, M. Grabert wrote:
> My Precisionbook obviously has a Visualize-EG with just 2MB.
> So it should be able to display at least 800x600 in 24/32bit and
> 1024x768 in 16bit, but it refuses to do so. 'dmesg' ALWAYS shows
> only 8bit colour depth regardless of the display resolution.

Visualize-EG is 8 bit only. That's a hardware limitation.

> My question is know, does STIfb also supports 16bit? How can I force
> 16bit and 24/32bit colour depths? What does sti=8/24 exactly mean?

stifb supports 32bit, if the hardware supports it. sti=8/24 is the
hardware path taken from PDC.

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessary a
good idea.                                 [ Alexander Viro on linux-kernel ]
