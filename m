From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Subject: Re: vfork test case.
Date: Tue, 22 Jun 2010 16:20:43 -0400 (EDT)
Message-ID: <20100622202044.95E7E4E77@hiauly1.hia.nrc.ca>
References: <AANLkTinhRqCVK3NlPvqH4XfQiq_jnz3dWfp4k_vK1Eqf@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Cc: dave.anglin@nrc-cnrc.gc.ca, linux-parisc@vger.kernel.org,
	kyle@mcmartin.ca, James.Bottomley@hansenpartnership.com
To: carlos@systemhalted.org (Carlos O'Donell)
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <AANLkTinhRqCVK3NlPvqH4XfQiq_jnz3dWfp4k_vK1Eqf@mail.gmail.com> from "Carlos O'Donell" at Jun 22, 2010 03:53:35 pm
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

> I disagree with you.
> 
> What about this scenario:
> * Parent call vfork, saves rp in -20(%sp) (parents frame)
> * Parent suspends upon entry to vfork syscall
> * Child returns from vfork syscall
> * Child restores rp from -20(%sp) (parents frame)
> * Child calls close which saves rp in -20(%sp) (parents frame)
> * Child calls execve
> * Parent resumes, restores rp from -20(%sp) and incorrectly returns to
> just after the call to close.
> 
> At this point if the parent restores rp from the parents frame it will
> get the rp the child's call to close saved.

You are right.

> 
> The only way to get around this is to *ensure* the kernel
> saves/restores r2 across the syscall.
> 
> I see no other way around it.

It looks as if r2 is saved for both parent and child.

Dave
-- 
J. David Anglin                                  dave.anglin@nrc-cnrc.gc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6602)
