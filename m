From: John David Anglin <dave@hiauly1.hia.nrc.ca>
Subject: Re: threads and fork on machine with VIPT-WB cache
Date: Mon, 10 May 2010 17:07:12 -0400
Message-ID: <20100510210711.GA15723@hiauly1.hia.nrc.ca>
References: <20100412214118.46D925160@hiauly1.hia.nrc.ca> <20100413115501.307040@gmx.net> <20100419162653.GA106@hiauly1.hia.nrc.ca> <4BCDEB6E.1060408@gmx.de> <20100509124339.GA6797@hiauly1.hia.nrc.ca> <20100510095632.173760@gmx.net> <20100510145648.GA13452@hiauly1.hia.nrc.ca> <4BE85C82.4080202@gmx.de>
Reply-To: John David Anglin <dave.anglin@nrc-cnrc.gc.ca>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Cc: John David Anglin <dave.anglin@nrc-cnrc.gc.ca>,
	carlos@systemhalted.org, gniibe@fsij.org,
	linux-parisc@vger.kernel.org
To: Helge Deller <deller@gmx.de>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <4BE85C82.4080202@gmx.de>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On Mon, 10 May 2010, Helge Deller wrote:

> On 05/10/2010 04:56 PM, John David Anglin wrote:
> > Yes, just after sending, I noticed gcc testsuite and minifail were
> > broken on gsyprf11.  [...]
> > 
> > The attached works better on gsyprf11.  I haven't tested it on anything
> > else.
> 
> Hi Dave,
> 
> Ugh... :-(
> At boot I get:
> ...
> INIT: Entering runlevel: 2
> 
> Starting enhanced syslogd: rsyslogd.
> 
> Starting system message bus: dbuseth0: Setting full-duplex based on MII#1 link partner capability of 41e1.
> 
> Starting OpenBSD Secure Shell server: sshd

I'll do a little more testing tonight.  In testing, I have had a
couple of boot failures on gsyprf11 starting iptables.  Haven't
seen any hpmc's starting sshd.

If you find the location of the hpmc is in code modified by change,
that would be useful information.  Possibly, there is an issue with
the pdtlb,l instruction.

Dave
-- 
J. David Anglin                                  dave.anglin@nrc-cnrc.gc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6602)
