Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id AAA07114
	for <parisc-linux@puffin.external.hp.com>; Tue, 15 Feb 2000 00:16:07 -0700
From: willy@thepuffingroup.com
Date: Tue, 15 Feb 2000 01:15:11 -0500
To: John Marvin <jsm@udlkern.fc.hp.com>
Cc: parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] Linux syscall ABI
Message-ID: <20000215011511.U9944@thepuffingroup.com>
References: <200002150536.WAA04580@udlkern.fc.hp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <200002150536.WAA04580@udlkern.fc.hp.com>; from John Marvin on Mon, Feb 14, 2000 at 10:36:39PM -0700
List-ID: <linux-parisc.vger.kernel.org>

On Mon, Feb 14, 2000 at 10:36:39PM -0700, John Marvin wrote:
> > No, we don't.  We're talking about PER_LINUX binaries here, and those
> > never expected to be able to dereference NULL pointers.
> 
> I don't know much about PER_SVR4, and why it exists.  Willy pointed it
> out to me.  I can see from the kernel source that perhaps it is only there
> for sparc.  If it is not necessary for parisc-linux to support then
> there is no issue. If it is necessary then I guess I assumed that PER_SVR4
> binaries would use the same gateway page as PER_LINUX binaries.

Linux has a personality() syscall which tells the kernel what operating
system this binary was compiled for.  PER_SVR4 means that this binary
was compiled for SVR4.  We _may_ want to include a PER_HPUX at some
point, but i'm not convinced we need it yet.  I pointed you at that bit
of code to show you that for some binaries Linux did that nasty hack,
rather than to advocate we do it too.
