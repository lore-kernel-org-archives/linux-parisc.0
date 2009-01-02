From: Sam Ravnborg <sam@ravnborg.org>
Subject: Re: [PATCH] kbuild: Disallow GCC 4.1.0 / 4.1.1
Date: Fri, 2 Jan 2009 23:37:16 +0100
Message-ID: <20090102223716.GC8843@uranus.ravnborg.org>
References: <alpine.LFD.2.00.0812310942110.5086@localhost.localdomain> <20081231105425.9ccac21d.akpm@linux-foundation.org> <alpine.LFD.2.00.0812311318420.5086@localhost.localdomain> <20081231.141408.60544902.davem@davemloft.net> <20090102115547.GB3027@elte.hu> <alpine.LFD.2.00.0901020844070.5086@localhost.localdomain> <alpine.LFD.2.00.0901020933370.5086@localhost.localdomain> <20090102175737.GA5818@uranus.ravnborg.org> <1230935253.15389.99.camel@pasglop>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Cc: Linus Torvalds <torvalds@linux-foundation.org>,
	Ingo Molnar <mingo@elte.hu>,
	David Miller <davem@davemloft.net>, akpm@linux-foundation.org,
	rdreier@cisco.com, ian.campbell@citrix.com,
	jeremy.fitzhardinge@citrix.com, deller@gmx.de,
	rusty@rustcorp.com.au, linux-parisc@vger.kernel.org,
	linux-kernel@vger.kernel.org, kyle@mcmartin.ca, randolph@tausq.org,
	dave@hiauly1.hia.nrc.ca
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <1230935253.15389.99.camel@pasglop>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On Sat, Jan 03, 2009 at 09:27:33AM +1100, Benjamin Herrenschmidt wrote:
> 
> > 
> > Bugger....
> > Now I cannot do cross compile for: alpha, arm, m68k and sparc.
> > 
> > Not that I actually try to run these beasts but just being able
> > to do cross compile has served me well.
> > 
> > Last I looked (only few days ago) crosstool-ng did not support sparc :-(
> 
> There are also various variants of 4.1.1 around with the fix for
> that inline bug backported (I think that's the case of the compiler
> that ships with the Cell SDK for example).
> 

We could add a feature check during the early phase of the
kernel build so we know if gcc has this bug or not.

But this would be the first time to do so IIRC - today we only
do some limited check to see if certain options are supported.

	Sam
