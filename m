Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from puffin.external.hp.com (puffin.external.hp.com [192.25.206.4])
	by dsl2.external.hp.com (Postfix) with ESMTP id 86EB64A18
	for <parisc-linux@lists.parisc-linux.org>; Wed, 31 Jan 2001 18:17:24 -0700 (MST)
Received: from mailserv2.iuinc.com (mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id SAA18733
	for <parisc-linux@puffin.external.hp.com>; Wed, 31 Jan 2001 18:13:17 -0700
Received: from slagheap.cygnus.com (cse.cygnus.com [205.180.230.236])
	by runyon.cygnus.com (8.8.7-cygnus/8.8.7) with ESMTP id RAA18126
	for <parisc-linux@thepuffingroup.com>; Wed, 31 Jan 2001 17:17:10 -0800 (PST)
To: Alan Modra <alan@linuxcare.com.au>
Cc: John David Anglin <dave@hiauly1.hia.nrc.ca>,
	gcc-bugs@gcc.gnu.org, gcc-patches@gcc.gnu.org,
	parisc-linux@thepuffingroup.com
Reply-To: law@redhat.com
In-reply-to: Your message of Wed, 06 Dec 2000 16:28:27 +1100.
             <Pine.LNX.4.21.0012061607530.16721-100000@front.linuxcare.com.au>
From: Jeffrey A Law <law@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Wed, 31 Jan 2001 18:19:17 -0700
Message-ID: <31628.980990357@slagheap.cygnus.com>
Sender: law@cygnus.com
Subject: [parisc-linux] Re: testcase for hppa64 gcc bug
List-ID: <linux-parisc.vger.kernel.org>

  In message <Pine.LNX.4.21.0012061607530.16721-100000@front.linuxcare.com.au>y
ou write:
  > > I think this needs to be reexamined.  Allan's ARG_POINTER_INVARIANT patch
  > > might not be needed now.
  > 
  > It's still needed.  The problem is that gcc thinks the arg pointer is
  > unchanged from the entry value to a function, even when the arg pointer
  > needs to be set to call other functions.
But the incoming argument pointer should have been copied into a pseudo at
the start of the function and the new pseudo used to address incoming args.

That's the real problem here I think.

jeff
