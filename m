From: Kyle McMartin <kyle@mcmartin.ca>
Subject: Re: [PATCH] PARISC: Remove ioctl.h content picked up from
	<asm-generic/ioctl.h>.
Date: Thu, 15 May 2008 11:02:02 -0400
Message-ID: <20080515150202.GN12850@phobos.i.cabal.ca>
References: <alpine.LFD.1.10.0805141511400.22428@localhost.localdomain>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Cc: linux-parisc@vger.kernel.org
To: "Robert P. J. Day" <rpjday@crashcourse.ca>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <alpine.LFD.1.10.0805141511400.22428@localhost.localdomain>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On Wed, May 14, 2008 at 03:14:52PM -0400, Robert P. J. Day wrote:
> 
> Now that <asm-generic/ioctl.h> allows overriding of the most commonly
> changed macro values, take advantage of that.
> 
> Signed-off-by: Robert P. J. Day <rpjday@crashcourse.ca>
> 
> ---
> 
>   i *think* this leaves an equivalent ioctl.h file, but feel free to
> check it carefully and tweak if necessary.
> 

looks right to me. i'll yell if it ended up breaking something. :)

applied.

r, kyle
