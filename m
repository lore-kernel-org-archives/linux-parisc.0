Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
To: Arto Jantunen <viiru@debian.org>
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] SMP problems (hardware gurus, please read) 
In-Reply-To: Message from Arto Jantunen <viiru@debian.org>
   of "Thu, 12 Sep 2002 12:10:18 +0300." <20020912091018.GA16372@dt-link.fi>
References: <20020912054834.GA32209@www1.dt-link.fi> <Pine.LNX.4.44.0209112338570.1464-100000@garibaldi.apptechsys.com>  <20020912091018.GA16372@dt-link.fi> 
Date: Thu, 12 Sep 2002 12:49:43 -0600
From: Grant Grundler <grundler@dsl2.external.hp.com>
Message-Id: <20020912184943.99E5C4829@dsl2.external.hp.com>
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

Arto Jantunen wrote:
> > Also, are there any HP hardware gurus out there that can explain these odd 
> > io numbers?  Could they be relevant?

Yes, I need to find the right docs to decode the meaning though.
I've not been motivated to chase this lately.

A few more observsation about HPMC problems:
o A500-55 and A500-44 don't have this problem.
o SMP kernel on 1 CPU and UP kernel on the same box *should* do exactly
  the same things besides aquire/release spinlocks. This suggests someone
  fixed something in the non-SMP code path and missed the SMP part.

> I did this, but the stuff I got from ser pim is almost all zeroes.
> I'm attaching it anyway, but I don't think it is correct. I rebooted
> by shutting it down from the power switch, is there a "softer" way
> to do it (I only have a serial console)?

HP9000/800 series machines should all support <ctl>-B
to get to service processor prompt.
"he" for help.
"rs" to reset the machine.
"tc" to capture current state of the machine for debugging "hung" machines.
(TC data is available with "ser pim" output")

hth,
grant
