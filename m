Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from www.riverrock.org (rrc.dsl.frii.net [216.17.137.11])
	by dsl2.external.hp.com (Postfix) with ESMTP id 7D16B482A
	for <parisc-linux@parisc-linux.org>; Thu, 18 Oct 2001 17:23:02 -0600 (MDT)
Message-Id: <m15uMVA-000Oz9C@bame.riverrock.org>
To: Randolph Chung <randolph@tausq.org>
Cc: parisc-linux@parisc-linux.org
Subject: Re: [parisc-linux] travel backwards in time? 
In-Reply-To: Your message of "Thu, 18 Oct 2001 13:21:45 PDT."
             <20011018132145.H4123@tausq.org>
References: <20011018132145.H4123@tausq.org> 
Date: Thu, 18 Oct 2001 17:23:00 -0600
From: Paul Bame <bame@riverrock.org>
List-ID: <linux-parisc.vger.kernel.org>

> 
> Can someone more familiar with that part of the code (pb?) please comment?
> 

I never had lots of confidence in that code even though I introduced it
by distilling other archs -- and dimly recall not being able to use
ia64 for some reason, or maybe I'm remembering wrong.  I never felt
I completely understood the interaction with the sometimes-missed
timer interrupt and arch-independent timer handling, and some of the
other archs seemed to be unexpectedly different from each other.

How's that for a useless comment?! :-)

	-P
