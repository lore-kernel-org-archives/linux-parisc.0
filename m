Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id QAA04837
	for <parisc-linux@puffin.external.hp.com>; Tue, 2 Jan 2001 16:21:31 -0700
Received: from upchuck.cygnus.com (taarna.cygnus.com [205.180.230.102])
	by runyon.cygnus.com (8.8.7-cygnus/8.8.7) with ESMTP id PAA23171
	for <parisc-linux@thepuffingroup.com>; Tue, 2 Jan 2001 15:24:49 -0800 (PST)
To: Paul Bame <bame@fc.hp.com>
cc: "John David Anglin" <dave@hiauly1.hia.nrc.ca>,
        parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] where to put 64 bit libmilli? 
Reply-To: law@redhat.com
In-reply-to: Your message of Tue, 02 Jan 2001 12:58:50 MST.
             <E14DXa6-0005xq-00@noam.fc.hp.com>
From: Jeffrey A Law <law@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Tue, 02 Jan 2001 13:17:53 -0700
Message-ID: <27911.978466673@upchuck>
Sender: law@cygnus.com
List-ID: <linux-parisc.vger.kernel.org>

  In message <E14DXa6-0005xq-00@noam.fc.hp.com>you write:
  > I have permission to sanitize and (L?)GPLize it.  I'm planning to
  > attempt the basic integration and then let Jeff or someone tell me
  > how I screwed it up :-)
BTW, if you dig around the GCC CVS tree, you'll find 32bit millicode ready
to work with GNU tools. (gcc/config/pa/lib1funcs.asm)  I don't know if that
would be useful to you or not.

Moving it out of libgcc may or may not make sense.  If I recall the key thing
to remember is that you want copies of those routines in each shared library,
otherwise you can lose in unpleasant ways.  An alternative is to make the
millicode routines themselves into a shared library and everyone links against.

jeff
