Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id KAA30887
	for <parisc-linux@puffin.external.hp.com>; Mon, 11 Dec 2000 10:27:09 -0700
Received: from upchuck.cygnus.com (taarna.cygnus.com [205.180.230.102])
	by runyon.cygnus.com (8.8.7-cygnus/8.8.7) with ESMTP id JAA08115
	for <parisc-linux@thepuffingroup.com>; Mon, 11 Dec 2000 09:29:51 -0800 (PST)
To: Richard Henderson <rth@redhat.com>
cc: John David Anglin <dave@hiauly1.hia.nrc.ca>, alan@linuxcare.com.au,
        rhirst@linuxcare.com, parisc-linux@thepuffingroup.com,
        gcc-bugs@gcc.gnu.org
Subject: Re: pa reload problem 
Reply-To: law@redhat.com
In-reply-to: Your message of Fri, 08 Dec 2000 22:55:52 PST.
             <20001208225552.A4476@redhat.com>
From: Jeffrey A Law <law@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Mon, 11 Dec 2000 10:29:04 -0700
Message-ID: <30059.976555744@upchuck>
Sender: law@cygnus.com
List-ID: <linux-parisc.vger.kernel.org>


  In message <20001208225552.A4476@redhat.com>you write:
  > On Fri, Dec 08, 2000 at 09:05:27PM -0700, Jeffrey A Law wrote:
  > > Unfortunately, I can't actually test it yet to see what problems removing
  > > that old hack will expose...
  > 
  > Heh.  Perhaps you could forward it to the hppa-linux folk and
  > see what happens there.  Mayhap their linker is differently
  > crash-prone.
I wouldn't count on it :-)  And in general PA linux just isn't ready for
the kind of testing I need to do for this patch.

What I really need to do is backport it into devo or 2000r1 where I can
beat on the PIC & shared library code a little harder than I can on the
external tree right now due to libstdc++-v3 issues.

jeff
