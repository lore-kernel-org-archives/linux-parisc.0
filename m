Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Date: Fri, 29 Aug 2003 23:06:28 -0600
From: Grant Grundler <grundler@parisc-linux.org>
To: Jan-Benedict Glaw <jbglaw@lug-owl.de>
Cc: PARISC list <parisc-linux@lists.parisc-linux.org>
Subject: Re: [parisc-linux] Re: xchat colors
Message-ID: <20030830050628.GA5649@dsl2.external.hp.com>
References: <W9958529574305441060899998@webmail4> <20030815061601.GD2989@dsl2.external.hp.com> <20030815063718.GD16974@lug-owl.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20030815063718.GD16974@lug-owl.de>
Sender: parisc-linux-admin@lists.parisc-linux.org
Errors-To: parisc-linux-admin@lists.parisc-linux.org
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux/>

On Fri, Aug 15, 2003 at 08:37:18AM +0200, Jan-Benedict Glaw wrote:
> Unstable's current XFree (4.2.1.1) "RENDER" extension (used for
> anti-aliasing IIRC) takes a _lot_ of colors for it's own (rumors I
> heared talked about > 200 IIRC)...

On this note I want to share solving my last problem with xchat
and 8-bit TrueColor. C3k doesn't have anything better at the moment.

The "couriour new" font was getting mangled colors as part of the
effort to anti-alias (what I assume is) a true-type or re-sized font.
Picking a bitmap font like "fixed" too take care of this.
Nice readable letters all in white.

hth,
grant
