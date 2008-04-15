From: Kyle McMartin <kyle@mcmartin.ca>
Subject: Re: ls -l is broken
Date: Tue, 15 Apr 2008 01:16:50 -0400
Message-ID: <20080415051650.GA22873@phobos.i.cabal.ca>
References: <20080406224204.GE16451@parisc-linux.org> <20080406231000.D53CB4FC8@hiauly1.hia.nrc.ca>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Cc: Matthew Wilcox <matthew@wil.cx>, linux-parisc@vger.kernel.org
To: John David Anglin <dave@hiauly1.hia.nrc.ca>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <20080406231000.D53CB4FC8@hiauly1.hia.nrc.ca>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On Sun, Apr 06, 2008 at 07:09:59PM -0400, John David Anglin wrote:
> > If you strace it, what syscall returns -EOPNOTSUPP?
> 
> strace is broken and quits before the relevant syscall.  Think I
> mentioned this before is a different context.
> 

Ok, I've fixed up ptrace. The failing syscall was lgetxattr, which, I
presume is failing because selinux is disabled, or something.

So, I assume that it's really just a warning.

regards, Kyle
