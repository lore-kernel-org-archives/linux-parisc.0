Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Date: Wed, 13 Aug 2003 23:12:36 -0600
From: Grant Grundler <grundler@parisc-linux.org>
To: James Bottomley <James.Bottomley@steeleye.com>
Cc: PARISC list <parisc-linux@lists.parisc-linux.org>
Subject: Re: [parisc-linux] xfree86 4.2.1-9 build problem
Message-ID: <20030814051236.GA3546@dsl2.external.hp.com>
References: <20030811043457.GA5653@dsl2.external.hp.com> <20030813175340.GF18794@dsl2.external.hp.com> <1060805514.2011.1.camel@fuzzy> <20030813213204.GA26014@dsl2.external.hp.com> <1060815215.1987.2.camel@fuzzy>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <1060815215.1987.2.camel@fuzzy>
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

On Wed, Aug 13, 2003 at 05:53:33PM -0500, James Bottomley wrote:
> Is this with one of the Visualize cards?  They only do 8bpp at all
> resolutions, so if you run a colourful window manager, you run out
> pretty quickly.  Even using the default fvwm, I had to run xpdf with a
> private colourmap (-cmap option) to get my slides to show up as anything
> like reasonable).

yes. And I'm using fvwm2 which I thought was supposed to be a fairly
(not totally) light weight window manager. I'll see if there are
knobs to reduce the FVWM color consumption.

> A lot of modern applications (particularly of the kde or gnome variety)
> pay absolutely no attention to potential colour map limitations and can
> blithely request more colours than you have available (and sometimes not
> even check for failure returns).

yup - I was looking to find the code to and at least print a warning
so I know that's the problem. I've spent < 1h hunting through the code
to figure out where the colors for the text box was allocated. Haven't
found it yet though.
