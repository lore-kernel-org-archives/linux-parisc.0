Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from mail.apptechsys.com (mail.apptechsys.com [207.14.35.131])
	by dsl2.external.hp.com (Postfix) with ESMTP id 5E646482A
	for <parisc-linux@lists.parisc-linux.org>; Sun,  2 Jun 2002 13:48:07 -0600 (MDT)
Date: Sun, 2 Jun 2002 12:48:00 -0700 (PDT)
From: Jeremy Drake <jeremyd@apptechsys.com>
To: Grant Grundler <grundler@dsl2.external.hp.com>
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] 2.4.18 SMP instability 
In-Reply-To: <20020602163201.3AE44482A@dsl2.external.hp.com>
Message-ID: <Pine.LNX.4.44.0206021214450.11012-100000@garibaldi.apptechsys.com>
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

On Sun, 2 Jun 2002, Grant Grundler wrote:

> If it avoids the HPMC (but we still see other hangs), then it's
> a clue we don't have caching working right for that CPU setup.
What "other hangs" would I expect to see?  This thing hangs periodically 
anyway on SMP, and doesn't consistently give the HPMC.  Sometimes it just 
hangs.  I'm building with the change you mentioned now -- we'll see what 
happens...

OK.  No HPMC, but a new and interesting message.  The serial console 
hangs, as always.

Fetched 2696kB in 26s (103kB/s)
apt-get(263): unaligned access to 0x403ce08c at ip=0x4005e4f7
Reading Package

But, the LCD screen has a new message for me: 

INI 3001: SYS BD
PDH control init

If you think it would help, I could pay the box a visit today and get 
whatever "ser pim" or "ser pim toc" I can...


> > hth,
> grant
> 
> _______________________________________________
> parisc-linux mailing list
> parisc-linux@lists.parisc-linux.org
> http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
> 

-- 
Novinson's Revolutionary Discovery:
	When comes the revolution, things will be different --
	not better, just different.
