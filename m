From: Rusty Russell <rusty@rustcorp.com.au>
Subject: Re: kernel segv with 2.6.31-rc6 ?
Date: Wed, 26 Aug 2009 21:50:34 +0930
Message-ID: <200908262150.34616.rusty@rustcorp.com.au>
References: <4A89CC4D.5040801@gmx.de> <200908251729.32855.rusty@rustcorp.com.au> <20090825192432.4D9CC411E3@magilla.sf.frob.com>
Mime-Version: 1.0
Content-Type: Text/Plain;
  charset="iso-8859-1"
Cc: James Bottomley <James.Bottomley@hansenpartnership.com>,
	Helge Deller <deller@gmx.de>,
	"linux-parisc" <linux-parisc@vger.kernel.org>,
	"linux-kernel" <linux-kernel@vger.kernel.org>
To: Roland McGrath <roland@redhat.com>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <20090825192432.4D9CC411E3@magilla.sf.frob.com>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On Wed, 26 Aug 2009 04:54:32 am Roland McGrath wrote:
> > Actually, x86 was one of the archs which fucked us.  Richard Henderson and
> > I *had* this, but ld -shared without -fPIC helpfully tells you "you're doing
> > it wrong" on x86-64.
> 
> This complaint could easily be (have been) made optional.

Yep, I even had a patch.  And meanwhile we could have lived with -fPIC modules
with some loss of performance (I think).

But at some level the problems accumulate until you go "nice idea, let's go
do something else" :)

But don't let me discourage you!
Rusty.
