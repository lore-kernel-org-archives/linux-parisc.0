Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from oliver.internal.sjdjweis.com (dsl.75.131.networkiowa.com [209.234.75.131])
	by dsl2.external.hp.com (Postfix) with ESMTP id 1DD91482A
	for <parisc-linux@parisc-linux.org>; Tue,  5 Jun 2001 06:25:33 -0600 (MDT)
Date: Tue, 5 Jun 2001 07:26:52 -0500 (CDT)
From: <djweis@sjdjweis.com>
To: Richard Hirst <rhirst@linuxcare.com>
Cc: parisc-linux@parisc-linux.org
Subject: Re: [parisc-linux] D310 boot messages
In-Reply-To: <20010605104655.H25745@linuxcare.com>
Message-ID: <Pine.LNX.4.21.0106050723380.21394-100000@oliver.internal.sjdjweis.com>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
List-ID: <linux-parisc.vger.kernel.org>

On Tue, 5 Jun 2001, Richard Hirst wrote:
> On Mon, Jun 04, 2001 at 02:16:49PM -0500, djweis@sjdjweis.com wrote:
> > So now, what major and minor should /dev/ttyB have to
> > function? /dev/console is 5 1 on my nfsroot.
> My understanding of the pdc console is that it is output only,
> used only until a real console device is available, and so wont
> work as a linux console.  Hopefully someone will correct me if I'm
> wrong.

Okay, what needs to be done to make this all work? Is the console config
fine except for the fact that it stops working after the serial init?

> > Good job getting it to work this well, especially since it's listed as
> > untested! Also, the LCD on the front doesn't seem to do anything. What
> > needs to happen for that to work?
> I turned off LCD support in the release kernels because of reports
> that it was causing problems on some systems.  See
> <http://bugs.parisc-linux.org/db/10/104.html>.  You can turn it
> back on if you build your own kernel.

If it's known not to work, that's good enough reason not to mess with it
yet.

I grabbed the bigger nfsroot and got my machine booting from it last
night. telnet/rlogin/rsh wouldn't work, so I used the script kiddie remote
login method and added 
3333	stream	tcp	nowait	root	/bin/sh sh -i
to inetd.conf and can get in to the machine. If there's anything I can do
on there to help in debugging the serial problem, let me know. 

dave


-- 
Dave Weis             "I believe there are more instances of the abridgement
djweis@sjdjweis.com   of the freedom of the people by gradual and silent
                      encroachments of those in power than by violent 
                      and sudden usurpations."- James Madison
