Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from reactor.hyte.de (reactor.hyte.de [212.84.215.194])
	by dsl2.external.hp.com (Postfix) with ESMTP id AA5164833
	for <parisc-linux@lists.parisc-linux.org>; Tue,  2 Jul 2002 13:05:33 -0600 (MDT)
Date: Tue, 2 Jul 2002 21:03:28 +0200 (CEST)
From: Joachim Steiger <roh@hyte.de>
To: Ralf Hildebrandt <Ralf.Hildebrandt@charite.de>
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] Power Button doesn't turn machine off anymore
In-Reply-To: <20020702183558.GO25586@charite.de>
Message-ID: <Pine.LNX.4.21.0207022058510.32706-100000@reactor.hyte.de>
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
> 

i'm running 
Linux version 2.4.17-32 (root@paer) (gcc version 3.0.4) #1 Sat Mar 16
17:09:00 MST 2002
from debian-unstable here and have the same effect
Enabled gecko-style soft power switch.
is printed out in my kernellog so i think it 'should' work
the machine is a 712/80 and this is the first kernel i run on it, so i
cannot tell you if it ever worked... it just doesnt work for me

can somebody with insight in the code please describe how it should work?

i have no clue if there is something like a apmd/acpid i should run.

tia

roh
