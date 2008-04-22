From: Kyle McMartin <kyle@mcmartin.ca>
Subject: Re: [RFC patch 5/9] PARISC remove -traditional
Date: Tue, 22 Apr 2008 14:00:09 -0400
Message-ID: <20080422180009.GJ19802@phobos.i.cabal.ca>
References: <20080422172404.502954084@polymtl.ca> <20080422172842.036035445@polymtl.ca>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Cc: Sam Ravnborg <sam@ravnborg.org>, akpm@linux-foundation.org,
	Ingo Molnar <mingo@elte.hu>, linux-kernel@vger.kernel.org,
	kyle@parisc-linux.org, matthew@wil.cx, grundler@parisc-linux.org,
	linux-parisc@vger.kernel.org
To: Mathieu Desnoyers <mathieu.desnoyers@polymtl.ca>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <20080422172842.036035445@polymtl.ca>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On Tue, Apr 22, 2008 at 01:24:09PM -0400, Mathieu Desnoyers wrote:
> Subject: [RFC patch 5/9] Re: [PATCH] Stringify support commas
>  > This is a no-no for those archs that still use -traditional.
>  > > I dunno if this is a problem for you at the moment and the
>  > > right fix is anyway to nuke -traditional.
>  > > 
>  > >     Sam
> 
> Signed-off-by: Mathieu Desnoyers <mathieu.desnoyers@polymtl.ca>
> CC: Sam Ravnborg <sam@ravnborg.org>
> CC: kyle@parisc-linux.org
> CC: matthew@wil.cx
> CC: grundler@parisc-linux.org
> CC: linux-parisc@vger.kernel.org

no. more work needs to be done to remove it. i have a patch already.

it would likely be smarter to just use a private stringify for the C
code for now.
