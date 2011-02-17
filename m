From: John David Anglin <dave@hiauly1.hia.nrc.ca>
Subject: Re: [PATCH] parisc: Improve dcache flush on PA8800/PA8900
Date: Wed, 16 Feb 2011 19:37:14 -0500
Message-ID: <20110217003713.GB26155@hiauly1.hia.nrc.ca>
References: <20110210170033.4317E4ED8@hiauly1.hia.nrc.ca> <20110210200044.203164E01@hiauly1.hia.nrc.ca> <20110212161846.GA24076@hiauly1.hia.nrc.ca> <20110213193934.GA28834@hiauly1.hia.nrc.ca> <20110215015852.GA6615@hiauly1.hia.nrc.ca> <AANLkTimZntmJQ5msVr56=V7P8pYGXizpVGinZYrvBsSt@mail.gmail.com> <20110215164703.GA9471@hiauly1.hia.nrc.ca> <1297789090.3015.31.camel@mulgrave.site>
Reply-To: John David Anglin <dave.anglin@nrc-cnrc.gc.ca>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Cc: John David Anglin <dave.anglin@nrc-cnrc.gc.ca>,
	Carlos O'Donell <carlos@systemhalted.org>,
	linux-parisc@vger.kernel.org
To: James Bottomley <James.Bottomley@HansenPartnership.com>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <1297789090.3015.31.camel@mulgrave.site>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On Tue, 15 Feb 2011, James Bottomley wrote:

> > I tend to think this is the problem area.  I will try to find a
> > testcase.
> 
> Great, thanks!  Just getting an application (or .c file) that does this
> will give us a better opportunity to analyse what the problem is.

I have found a testcase.  Unfortunately, it's almost impossible to debug.
It a GCC guality test.  These tests launch gdb and then have gdb print
debug info at various breakpoints.  If run with strace, this prevents
gdb from attaching and the inequivalent alias state doesn't occur ;(

Dave
-- 
J. David Anglin                                  dave.anglin@nrc-cnrc.gc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6602)
