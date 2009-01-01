From: Jeremy Fitzhardinge <jeremy@goop.org>
Subject: Re: [PATCH] parisc: fix module loading failure of large kernel modules
 (take 4)
Date: Thu, 01 Jan 2009 18:12:41 +1100
Message-ID: <495C6CE9.3080402@goop.org>
References: <4959346E.7060600@gmx.de> <200812310915.41693.rusty@rustcorp.com.au> <495B5806.3080505@gmx.de> <alpine.LFD.2.00.0812310926450.5086@localhost.localdomain>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8; format=flowed
Cc: Helge Deller <deller@gmx.de>,
	Rusty Russell <rusty@rustcorp.com.au>,
	linux-parisc <linux-parisc@vger.kernel.org>,
	Linux Kernel Development <linux-kernel@vger.kernel.org>,
	Kyle McMartin <kyle@mcmartin.ca>,
	Randolph Chung <randolph@tausq.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	Sam Ravnborg <sam@ravnborg.org>,
	John David Anglin <dave@hiauly1.hia.nrc.ca>
To: Linus Torvalds <torvalds@linux-foundation.org>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <alpine.LFD.2.00.0812310926450.5086@localhost.localdomain>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

Linus Torvalds wrote:
> Some gcc versions will inline weak functions if they are in scope - even 
> if there is a non-weak function somewhere else. So you MUST NOT have the 
> weak definition in the same file (or indirectly called through some inline 
> functions in a header file) as the call. Because if you do, then any user 
> with the wrong version of gcc will get the weak function semantics, even 
> if it was meant to be overridden by something else.
>   

Yes.  I think this behaviour is considered to be desperately broken by 
the gcc developers and has been fixed in all recent gccs.  There are a 
couple of broken versions, and there have been patches floating around 
to just refuse to use them; otherwise __weak is effectively unusable.  
(Ah, I see Adrian has posted it again and everyone agrees with it.)

On the other hand, I have seen a couple of instances of "inline __weak" 
which is insane, but I don't know if gcc does anything crazy with it, or 
if its common enough to bother warning about.

    J
