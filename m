From: Rolf Eike Beer <eike-kernel@sf-tec.de>
Subject: Re: [PATCH] parisc: fixes and cleanups in page cache flushing (1/4)
Date: Mon, 04 Feb 2013 09:35:14 +0100
Message-ID: <777a626d6eff1b2a6194dcfa6a8ad313@sf-mail.de>
References: <20130203225909.GA14573@p100.box>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8;
 format=flowed
Cc: <linux-parisc@vger.kernel.org>,
	James Bottomley <James.Bottomley@hansenpartnership.com>,
	John David Anglin <dave.anglin@bell.net>
To: Helge Deller <deller@gmx.de>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <20130203225909.GA14573@p100.box>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

Helge Deller wrote:
> This is the first patch in a series of 4, with which the page cache 
> flushing of
> parisc will gets fixed and enhanced. This even fixes the nasty 
> "minifail" bug
> (http://wiki.parisc-linux.org/TestCases?highlight=%28minifail%29) 
> which
> prevented parisc to stay an official debian port.  Basically the 
> flush in
> copy_user_page together with the TLB patch from commit
> 7139bc1579901b53db7e898789e916ee2fb52d78 is what fixes the minifail 
> bug.

Is this series expected to fix the thread related problems I see in the 
git testsuite?

Eike
