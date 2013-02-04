From: "Helge Deller" <deller@gmx.de>
Subject: Re: [PATCH] parisc: fixes and cleanups in page cache flushing (1/4)
Date: Mon, 04 Feb 2013 16:24:56 +0100
Message-ID: <20130204152456.294020@gmx.net>
References: <20130203225909.GA14573@p100.box>
 <777a626d6eff1b2a6194dcfa6a8ad313@sf-mail.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Cc: dave.anglin@bell.net, James.Bottomley@hansenpartnership.com,
	linux-parisc@vger.kernel.org
To: Rolf Eike Beer <eike-kernel@sf-tec.de>, deller@gmx.de
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <777a626d6eff1b2a6194dcfa6a8ad313@sf-mail.de>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

> Von: Rolf Eike Beer <eike-kernel@sf-tec.de>
> Helge Deller wrote:
> > This is the first patch in a series of 4, with which the page cache 
> > flushing of
> > parisc will gets fixed and enhanced. This even fixes the nasty 
> > "minifail" bug
> > (http://wiki.parisc-linux.org/TestCases?highlight=%28minifail%29) 
> > which
> > prevented parisc to stay an official debian port.  Basically the 
> > flush in
> > copy_user_page together with the TLB patch from commit
> > 7139bc1579901b53db7e898789e916ee2fb52d78 is what fixes the minifail 
> > bug.
> 
> Is this series expected to fix the thread related problems I see in the 
> git testsuite?

I expect so, if not, please let us know!

If you want to test yourself, you may check out my "testing" branch from parisc-linux.git which includes all necessary patches:
https://git.kernel.org/?p=linux/kernel/git/deller/parisc-linux.git;a=shortlog;h=refs/heads/testing

Helge
