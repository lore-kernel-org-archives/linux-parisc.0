Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Date: Fri, 12 Sep 2003 20:48:08 -0600
From: Grant Grundler <grundler@parisc-linux.org>
To: John David Anglin <dave@hiauly1.hia.nrc.ca>
Cc: parisc-linux@lists.parisc-linux.org, jbglaw@lug-owl.de
Subject: Re: [parisc-linux] Re: Looking for info on getting X running on my 712
Message-ID: <20030913024808.GA15109@dsl2.external.hp.com>
References: <200309121857.h8CIvJf7014048@hiauly1.hia.nrc.ca>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <200309121857.h8CIvJf7014048@hiauly1.hia.nrc.ca>
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

On Fri, Sep 12, 2003 at 02:57:19PM -0400, John David Anglin wrote:
> Does this mean that's there is no way to run with a 24 bit depth
> on a Vis-EG?

that's correct. Vis-EG only supports 8-bit color.
We could get 24-bit color if we could get FX-E cards working but
they suffer the same lack of support as FX-[246] cards.

I've switched to using "TrueColor" until Xf86 "render" module
stops hogging most of the colormap. Regular text modes are fine.
Image quality does suffer though.

BTW, Vis-EG on C3k does support 1600x1200 if you multi-sync monitor
can handle it. Most LCD displays can not.

...
> Oh, I've one other X config problem.  The usb mouse stops responding
> at logout from kde.  If I restart the X server with <alt>E, functionality
> is restored.  I don't believe that this is a kde problem.  Anybody have
> a solution?

This is an old problem. First mention of it was several years ago.
More recently (Sept 2002) there's a whole thread on it starting with:
    http://lists.parisc-linux.org/pipermail/parisc-linux/2002-September/017724.html

Work around is to switch to VT1 (ctl-alt-F1) and then back to the
FB VT (ctl-alt-F2 in my case).

grant
