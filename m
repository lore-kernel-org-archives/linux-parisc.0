Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from mail.gmx.net (pop.gmx.net [194.221.183.20])
	by dsl2.external.hp.com (Postfix) with SMTP id 7BDC9482A
	for <parisc-linux@parisc-linux.org>; Thu, 21 Jun 2001 12:01:13 -0600 (MDT)
Content-Type: text/plain;
  charset="iso-8859-1"
From: Helge Deller <deller@gmx.de>
To: =?iso-8859-1?q?R=FCdiger=20Scholz?= <rscholz@hrzpub.tu-darmstadt.de>,
	parisc-linux@parisc-linux.org
Subject: Re: [parisc-linux] Kernel crashing with STI-Console
Date: Thu, 21 Jun 2001 20:00:52 +0200
References: <3B323263.11467E62@hrzpub.tu-darmstadt.de>
In-Reply-To: <3B323263.11467E62@hrzpub.tu-darmstadt.de>
MIME-Version: 1.0
Message-Id: <20010621180113.7BDC9482A@dsl2.external.hp.com>
List-ID: <linux-parisc.vger.kernel.org>

Hi Rüdiger,

If I understand you right you have both, a built-in graphic chip (Artist?) 
and the ad-on-card (Coral). 
Without digging any further into your problem I would assume that your 
crashes come from stifb, which does not support multiple graphic cards 
currently. But that's only an assumption.
Does your machine still crashes if you disable stifb and go with sticon only ?

BTW: Could you please also upload the register-dump of the crash to your site 
too - else I won't be able to inspect your crash any further...

Greetings,
Helge.

On Thursday 21 June 2001 19:44, Rüdiger Scholz wrote:
> Hi there!
>
> I have a HP 715/100-box with a graphics ad-on card, which is listed as
> "Coral SGC Graphics..." when booting linux. (btw Perhaps s.o. can tell
> me what kind of add-on card it is. It is a CRX, or s.th else?)
>
> The machine is running the 0.9 release with serial console.
>
> I compiled a recent kernel (2.4.0-pa30) with STIfb and STI-Console
> enabled, in order to use the STI-Console on my box. Booting this kernel
> results in a kernel crash immediately after reading vmlinux. I capture
> it via serial console.
> Can somebody have a look at it?
>
> The System.map file can be found on http://www.tu-darmstadt.de/~rscholz
>  .
>
> Thanks, Ruediger
