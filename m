Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from www.linux.org.uk (parcelfarce.linux.theplanet.co.uk [195.92.249.252])
	by dsl2.external.hp.com (Postfix) with ESMTP id 83B1C482A
	for <parisc-linux@parisc-linux.org>; Tue,  5 Jun 2001 15:07:43 -0600 (MDT)
Received: from willy by www.linux.org.uk with local (Exim 3.13 #1)
	id 157O35-0004Rb-00; Tue, 05 Jun 2001 22:07:35 +0100
Date: Tue, 5 Jun 2001 22:07:35 +0100
From: Matthew Wilcox <matthew@wil.cx>
To: "Michael S. Zick" <mszick@pflash.com>
Cc: Matthew Wilcox <matthew@wil.cx>, debian-hppa@lists.debian.org,
	parisc-linux@parisc-linux.org, parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] Re: Version 0.9 of PA-RISC Linux Released
Message-ID: <20010605220735.V7349@parcelfarce.linux.theplanet.co.uk>
References: <20010605202920.U7349@parcelfarce.linux.theplanet.co.uk> <01060515450207.00472@wolf01.my.home>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <01060515450207.00472@wolf01.my.home>; from mszick@pflash.com on Tue, Jun 05, 2001 at 03:22:20PM -0500
Sender: <willy@www.linux.org.uk>
List-ID: <linux-parisc.vger.kernel.org>

On Tue, Jun 05, 2001 at 03:22:20PM -0500, Michael S. Zick wrote:
> The only way to validate a change as a potential patch is:
> 
> 1) start with a clean (error and warning free) build that
> boots and runs on the machine of interest.
> 
> 2) hack, change, modify, whatever
> 
> 3) when done, make another clean build that boots and runs
> on the machine of interest.
> 
> 4) evaluate the effects of the change(s).
> 
> 5) If successful - then you MIGHT have something worth
> submitting as a POTENTIAL patch.
> 
> Exactly the same 5 steps your developers take before they
> commit a change to CVS.

the people with CVS access are hardly `my' developers.  and the process
you describe is only one form of development.  it's not applicable in a lot
of cases.

> That's right - until it is a clean build, boots and runs -
> everything is talk and speculation.

No.  if you post a patch which moves things in the right direction,
that's more than talk.  it's something which can be tested.

> So what?
> 
> The only changes I make outside of the parisc specific
> branch of the source tree are to bring the code in line
> with 2.4.4 (stable).

erm... if you're doing that, I'll be very surprised if you build a
working system.  Changes are needed to the generic VM which need to be
forward-ported and changed in a few places.  This is work which I don't
feel capable of doing.

> The changes I make inside of the parisc specific branch
> of the tree will be (someday) found by your own developers.

That's great, I love people who do work, keep their changes secret and
then expect everyone else to find them because they're `obvious'.

> Just a matter of do you want to duplicate the time and 
> trouble of finding them yourself, or read about them in
> the mail archives.

I'd love you to post them.  I said so earlier.

> If you are serious about my suggestions being counter-productive,
> I will gladly spend the time I am taking to write them for other purposes.

If all you're going to do is patch your own tree and write snide flames
to this mailing list, then yes, I'd rather you worked on a different
project.  If you're going to work cooperatively, then please hang around.

-- 
Revolutions do not require corporate support.
