From: Kyle McMartin <kyle@mcmartin.ca>
Subject: Re: Fixed strace [ was Re: ls -l is broken ]
Date: Tue, 5 May 2009 15:18:45 -0400
Message-ID: <20090505191845.GD3094@bombadil.infradead.org>
References: <20090505184043.GC3094@bombadil.infradead.org> <20090505190951.59A544FAF@hiauly1.hia.nrc.ca>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Cc: Kyle McMartin <kyle@mcmartin.ca>, matthew@wil.cx,
	linux-parisc@vger.kernel.org, debian-hppa@lists.debian.org
To: John David Anglin <dave@hiauly1.hia.nrc.ca>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <20090505190951.59A544FAF@hiauly1.hia.nrc.ca>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On Tue, May 05, 2009 at 03:09:50PM -0400, John David Anglin wrote:
> Probably, the cast should be to int.  __canonicalize_funcptr_for_compare
> isn't used in the 64-bit runtime.
> 
> Still, I'm not sure why this fixed the problem as
> __canonicalize_funcptr_for_compare checks for -1.
> 

If we cast both sides to int, then we don't generate a call there...

--Kyle
