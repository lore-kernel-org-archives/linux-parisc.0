Return-Path: <hppa-linux@puffingroup.com>
Date: Sun, 7 Feb 1999 22:43:51 -0500 (EST)
From: Alex deVries <adevries@redhat.com>
To: "hppa-linux@puffingroup.com" <hppa-linux@puffingroup.com>
Subject: Re: [hppa-linux] egcs-1.1.1 xcompile
In-Reply-To: <36BE31DE.FEA80D5C@ottawa.com>
Message-ID: <Pine.LNX.3.96.990207224313.907g-100000@devserv.devel.redhat.com>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Resent-Message-ID: <"eK_Bt.0.fO.PVdls"@burrow.puffingroup.com>
Reply-To: hppa-linux@puffingroup.com
List-Id: linux-parisc.vger.kernel.org

On Sun, 7 Feb 1999, Paul J.Y. Lahaie wrote:

>   At this point, there is some code (I assume from libgcc2.c) which
> puts "opcode arg,arg,arg    ; comment" style comments which confuses
> as (it thinks "; comment" is an opcode).  I'm gonna go look to see
> if I can do a quick patch to fix this.  Other than that, the
> compiler seems to work fine with little or no patchings (beyond
> support for hppa1.1-hp-linux)
> 

Yeah, I had to fix this elsewhere.  The solution was to use a "#"
character instead of ";" to mark the start of a comment.

- Alex


----------------------------------------------------------------------
To unsubscribe: send e-mail to hppa-linux-request@puffingroup.com with
`unsubscribe' as the subject.
