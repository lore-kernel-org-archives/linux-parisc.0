Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from csmail.ucc.ie (csmail.ucc.ie [143.239.211.231])
	by dsl2.external.hp.com (Postfix) with ESMTP id A96174847
	for <parisc-linux@lists.parisc-linux.org>; Wed, 30 Apr 2003 11:42:15 -0600 (MDT)
Date: Wed, 30 Apr 2003 18:42:08 +0100 (IST)
From: "M. Grabert" <xam@cs.ucc.ie>
To: Stan Sieler <sieler@allegro.com>
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] Presicionbook keyboard under console
In-Reply-To: <200304301738.h3UHcYG21821@opus.allegro.com>
Message-ID: <Pine.LNX.4.44.0304301839210.21749-100000@sal.ucc.ie>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
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

On Wed, 30 Apr 2003, Stan Sieler wrote:

> Re:
>
> > I tried to figure out why some keys on my Presicionbook are messed up
> > when using the console (it works on X). As it turns out, 'showkey -k'
> > shows the 'keycode 86' for the following keys:
> ...
> > PS: I still have the problem that X currently just works when I use the
> > external monitor; using the internal LCD it boots fine, but doesn't show
> > anything ...
>
> I can suggest a $400 solution:
>    http://cgi.ebay.com/ws/eBayISAPI.dll?ViewItem&item=2726642700&category=177
> ...another PrecisionBook.
>
> I've found no keyboard problems like you describe on mine,
> and X works just fine with the internal LCD screen (haven't tried an
> external monitor).

Well, the internal LCD works, until it switches to stifb.
The keyboard works under X perfectly aswell. It's just the console ...

> On your keyboard problem...plug in an external keyboard and see if the
> problem exists with it, too.  Either way, that should localize the problem
> somewhat.

Yes, an external keyboard works fine ...


May I ask what your kernel & .config is and what firmware you have on
the Precisionbook?

Thanks, Max
