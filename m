Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from www.linux.org.uk (unknown [195.92.249.252])
	by dsl2.external.hp.com (Postfix) with ESMTP id B993948A1
	for <parisc-linux@lists.parisc-linux.org>; Tue, 18 Nov 2003 06:15:22 -0700 (MST)
Received: from willy by www.linux.org.uk with local (Exim 4.22)
	id 1AM5g7-0008De-Ui; Tue, 18 Nov 2003 13:13:59 +0000
Date: Tue, 18 Nov 2003 13:13:59 +0000
From: Matthew Wilcox <willy@debian.org>
To: Pietro <pietro-ki@3000.it>
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] serial console on hp 715/50
Message-ID: <20031118131359.GK30485@parcelfarce.linux.theplanet.co.uk>
References: <200311181116.31082.pietro-ki@3000.it>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <200311181116.31082.pietro-ki@3000.it>
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

On Tue, Nov 18, 2003 at 11:16:30AM +0000, Pietro wrote:
> It's nice, but I need switch to serial console because I _have not_ HIL kbd,
> so I can't type anything !!
> (box is live, after bootstrap flashing sequence of LEDs I can see heartbeat
> LED blinking and on multisync monitor attached then on it I can see
> screen full of messages)
> 
> I proved almost all: power on without TOC button, power on with TOC button,
> TOC bt after power on for a while, TOC bt after power on for 10 sec,
> all of this without screen attached (and without kbd attached too - I've no 
> kbd)
> but without results. Every time box uses graphic console, not serial one.

I've done this before successfully.  Press the TOC button in and then
power on the box.  It will start displaying the boot messages on console.
Maybe try holding the TOC button in for longer ...

-- 
"It's not Hollywood.  War is real, war is primarily not about defeat or
victory, it is about death.  I've seen thousands and thousands of dead bodies.
Do you think I want to have an academic debate on this subject?" -- Robert Fisk
