Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
To: Jeremy Drake <jeremyd@apptechsys.com>
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] 2.4.18 SMP instability 
In-Reply-To: Message from Jeremy Drake <jeremyd@apptechsys.com>
   of "Sun, 02 Jun 2002 12:48:00 PDT." <Pine.LNX.4.44.0206021214450.11012-100000@garibaldi.apptechsys.com>
References: <Pine.LNX.4.44.0206021214450.11012-100000@garibaldi.apptechsys.com> 
Date: Sun, 02 Jun 2002 21:28:54 -0600
From: Grant Grundler <grundler@dsl2.external.hp.com>
Message-Id: <20020603032855.07BA0482A@dsl2.external.hp.com>
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

Jeremy Drake wrote:
> What "other hangs" would I expect to see?  This thing hangs periodically 
> anyway on SMP, and doesn't consistently give the HPMC.
> Sometimes it just hangs.

Well, we don't really know anything about hungs you've been seeing or if
it's the same problem each time. I'm comfortable the SMP kernel works
with apt-get since I'm not able to reproduce the problem with either of
the two SMP machines I have (PA8500 and PA8700).

> I'm building with the change you mentioned now -- we'll see what 
> happens...
> 
> OK.  No HPMC, but a new and interesting message.  The serial console 
> hangs, as always.
...
> But, the LCD screen has a new message for me: 
> 
> INI 3001: SYS BD
> PDH control init

hmmm...that might just be an intermediate state for HPMC.
This seems to be part of the reset sequence.

> If you think it would help, I could pay the box a visit today and get 
> whatever "ser pim" or "ser pim toc" I can...

nah...get "ser pim" tomorrow. But I may not be able to look at it until
the end of the week. Try repeating with the kluged kernel a few times and
see if it now always gets the same symptom (ie no HPMC). If it doesn't HPMC,
most likely you need to run UP kernels until someone who understands
cache handling and J5000 a bit can look at it.

grant
