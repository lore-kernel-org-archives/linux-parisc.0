Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from solo.franken.de (pD951CA3D.dip.t-dialin.net [217.81.202.61])
	by dsl2.external.hp.com (Postfix) with ESMTP id 769C7482C
	for <parisc-linux@lists.parisc-linux.org>; Sun, 11 Nov 2001 06:24:50 -0700 (MST)
Date: Sun, 11 Nov 2001 14:23:17 +0100
From: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To: =?iso-8859-1?Q?R=FCdiger_Scholz?= <rscholz@hrzpub.tu-darmstadt.de>
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] Keyboard problems and StiFB
Message-ID: <20011111142317.A2876@solo.franken.de>
References: <3BEE59B7.4080108@hrzpub.tu-darmstadt.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
In-Reply-To: <3BEE59B7.4080108@hrzpub.tu-darmstadt.de>; from rscholz@hrzpub.tu-darmstadt.de on Sun, Nov 11, 2001 at 11:57:59AM +0100
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

On Sun, Nov 11, 2001 at 11:57:59AM +0100, Rüdiger Scholz wrote:
> But now I have some trouble with my keyboard. I use a ps/2-keyboard and 
> -mouse with HIL-Adaptorbox. If I do a cold boot the kernel finds a 
> HIL-Keyboard, loads a keymap and  at the login the keyboard has a weird 

hmm, that sounds wrong. If you have only attached a PS/2 keyboard, it
shouldn't find a HIL keyboard.

> Any Solution ?

posting your boot.log might help a little bit.

> And there's another question: How do I change between the first stifb 
> and the second stifb? Console always opens on my second graphics card 
> (HCRX24), but due to the resolution of 1280x1024 everything is quite 
> small, so I would like use the builtin graphics.

video=map:x1:x2:x3 ...

x1 selects framebuffer on virtual console 1
x2 selects framebuffer on virtual console 2
x3 selects framebuffer on virtual console 3
...

Look for the BootPrompt-HowTo for a longer description.

I don't have my B132 setup for testing this, but it should work (final
last word :-)).

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessary a
good idea.                                 [ Alexander Viro on linux-kernel ]
