Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from www.linux.org.uk (parcelfarce.linux.theplanet.co.uk [195.92.249.252])
	by dsl2.external.hp.com (Postfix) with ESMTP id 085DA4840
	for <parisc-linux@parisc-linux.org>; Fri, 21 Nov 2003 05:47:25 -0700 (MST)
Received: from willy by www.linux.org.uk with local (Exim 4.22)
	id 1ANAgz-0001KF-7u; Fri, 21 Nov 2003 12:47:21 +0000
Date: Fri, 21 Nov 2003 12:47:20 +0000
From: Matthew Wilcox <willy@debian.org>
To: pacman@egon.gyaloglo.hu
Cc: Matthew Wilcox <willy@debian.org>, parisc-linux@parisc-linux.org
Message-ID: <20031121124720.GS30485@parcelfarce.linux.theplanet.co.uk>
References: <Pine.LNX.4.58.0311201817470.21743@sal.ucc.ie> <20031120190259.GL30485@parcelfarce.linux.theplanet.co.uk> <200311210820.42414.pacman@leovey-szki.sulinet.hu>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
In-Reply-To: <200311210820.42414.pacman@leovey-szki.sulinet.hu>
Subject: [parisc-linux] Re: HP9000-K460,K420,Dx70/2
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

Please don't send me personal mail about installation problems; others
are equally capable of answering these questions and they may respond
when I can't.

On Fri, Nov 21, 2003 at 08:20:42AM +0100, Paczkó András wrote:
> My company have three HP9000, a K460, a K420, a Dx70/2.
> I have to install Linux (or *BSD) on this machine.
> I probe on K460,K420 becuse the Dx have a fan problem.

As far as I know, BSD does not support the K class.

> I download the debianhppa_NONUS.iso-t and the latest (PA-13) netinst iso from 
> pateam.
> 
> I got an idea: "You need a boot param, if your box have an ncr53c8xx, 
> ncr53c8xx=burst:3..."
> 
> My boxes have ncr53c710, a tried it, but not works, (burst:1..2..3)

That's obsolete advice; the problem was fixed in 2.4.16-pa14.

> the boot fail:
> 
> serial .... with MANY PORTS....
> bla bla
> 
> dump....
> 
> Is anyone who are able to install linux these boxes?

Yes, I and others have successfully installed Linux on these boxes.  It
sounds like you need to interact with IPL and change console=ttyS0 to
console=ttyB0, but you haven't provided enough information for me to
be certain.

-- 
"It's not Hollywood.  War is real, war is primarily not about defeat or
victory, it is about death.  I've seen thousands and thousands of dead bodies.
Do you think I want to have an academic debate on this subject?" -- Robert Fisk
