Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from student.cs.ucc.ie (student.cs.ucc.ie [143.239.211.125])
	by dsl2.external.hp.com (Postfix) with ESMTP id 28220482A
	for <parisc-linux@parisc-linux.org>; Tue, 18 Dec 2001 13:09:42 -0700 (MST)
Date: Tue, 18 Dec 2001 20:09:58 +0000 (GMT)
From: Markus Grabert <xam@student.cs.ucc.ie>
To: Grant Grundler <grundler@dsl2.external.hp.com>
Cc: parisc-linux@parisc-linux.org
Subject: Re: [parisc-linux] HP 9000/782/C240 up and running 0.9.3 (serial) 
In-Reply-To: <20011218191423.5880F482A@dsl2.external.hp.com>
Message-ID: <Pine.OSF.4.41.0112182001270.30187-100000@student.cs.ucc.ie>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
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

On Tue, 18 Dec 2001, Grant Grundler wrote:

> Markus Grabert wrote:
> > Hi all,
> > Since I don't have a good monitor that
> > even supports the 1024x768/75Hz of the HP (but just 72Hz),
>
> When powering on the box, hit TAB key to select other resolutions
> and frequencies. One can also change the selection from the
> BOOT_ADMIN (BCH) prompt. Mail archives have lots of notes about this.

Been there, done that already.
My fault, I told you something wrong: my monitor is even not
capable of 1024x768/72Hz! (It understands however the 1024x768/70 of my
Sun SPARCstation LX).
I should have explaned that 1024x768 is the lowest solution
of the C240 offers me. The others (1024x768 at 72 or 75Hz) obviously won't
work. So there is no way of using STI and stifb, since even the lowest
resolution isn't supported by my monitor.
The graphic card works however (tested all modes with a 20" monitor
of a friend).

> Can someone write something up for the FAQ if it's not already
> in the FAQ?
> I'll add/change the FAQ should someone not have needed permissions..

:-)

> I'm not the debian expert for your other questions.
> You might repost those on debian-hppa@lists.debian.org.
> (I hope I have the list address correct - just typed something
> that sounds right)

great,
 thanks max
