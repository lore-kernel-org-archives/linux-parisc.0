Received: from mailserv2.iuinc.com (qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.8.7/8.8.7) with SMTP id FAA18454
	for <parisc-linux@puffin.external.hp.com>; Wed, 3 Nov 1999 05:34:39 -0700
Date: Wed, 3 Nov 1999 13:36:28 +0100
From: Matthew Wilcox <Matthew.Wilcox@genedata.com>
To: Alex deVries <adevries@thepuffingroup.com>
Cc: parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] Recent changes
Message-ID: <19991103133628.G25252@mencheca.ch.genedata.com>
References: <199911030250.TAA16563@puffin.external.hp.com> <Pine.LNX.4.10.9911022309430.5997-100000@vodka.thepuffingroup.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <Pine.LNX.4.10.9911022309430.5997-100000@vodka.thepuffingroup.com>; from Alex deVries on Tue, Nov 02, 1999 at 11:14:33PM -0500
List-ID: <linux-parisc.vger.kernel.org>

On Tue, Nov 02, 1999 at 11:14:33PM -0500, Alex deVries wrote:
> 
> Matt Wilcox committed some code that I know he's unable to test, so I'm
> mailing the bug report here.
> 
> The first is that building the kernel kernel will result in:
> 
> ld: Unsatisfied symbols:
>    hpux_brk (code)
> 
> so I just commented out the only reference to it, and now I end up with:

You commented it out?  Aaahhh.. that was definitely the wrong thing to do.
The reference is in the middle of the syscall table, so all subsequent
syscalls were misnumbered.

I've changed it to call sys_brk instead; I'm not quite sure why I had
thought it would need to call a different function, brk looks identical
to me on both OSes.

If someone would be generous enough to test the current CVS tree for me,
I'd be grateful.  It may well be that sash is now able to perform `-ls'.

> ps.  All the puffins will be out of town in Montreal on Wednesday to
> attend/speak at a conference and see live puffins.

I'm jealous.  27 days to go.

-- 
Matthew Wilcox <willy@bofh.ai>
"Windows and MacOS are products, contrived by engineers in the service of
specific companies. Unix, by contrast, is not so much a product as it is a
painstakingly compiled oral history of the hacker subculture." - N Stephenson
