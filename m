Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from interzone.ucc.ie (interzone.ucc.ie [143.239.1.134])
	by dsl2.external.hp.com (Postfix) with ESMTP id 527274855
	for <parisc-linux@lists.parisc-linux.org>; Tue,  2 Jul 2002 12:53:00 -0600 (MDT)
Date: Tue, 2 Jul 2002 19:52:56 +0100 (IST)
From: "M. Grabert" <xam@cs.ucc.ie>
To: Ralf Hildebrandt <Ralf.Hildebrandt@charite.de>
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] Power Button doesn't turn machine off anymore
In-Reply-To: <20020702183558.GO25586@charite.de>
Message-ID: <Pine.LNX.4.44.0207021951010.16680-100000@sal.ucc.ie>
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

On Tue, 2 Jul 2002, Ralf Hildebrandt wrote:

> ok, I checked my kern.log:
>
> The last time the "Gecko-style soft power enabled" turns up in the log
> is today.
>
> But it doesn't work anymore!
> I can "turn off" the machine, but it doesn't halt itself or go down.
>
> I'm running 2.4.18-pa46, it wasn't working with pa42 either, IMHO pa40
> was still working. In pa35 it was definitely still working!

That's strange. -pa45 works for me (on a C240), but I think -pa39 wasn't!

Any suggestions ?

greetings max
