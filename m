Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id AAA31764
	for <parisc-linux@puffin.external.hp.com>; Thu, 11 May 2000 00:43:12 -0600
Received: from milano.cup.hp.com (milano.cup.hp.com [15.8.80.76])
	by atlrel2.hp.com (Postfix) with ESMTP id 95F7F171
	for <parisc-linux@thepuffingroup.com>; Wed, 10 May 2000 20:43:18 -0400 (EDT)
Received: from localhost (grundler@localhost [127.0.0.1]) by milano.cup.hp.com with SMTP (8.8.6 (PHNE_17190)/8.7.3 TIS 5.0.1) id RAA24953 for <parisc-linux@thepuffingroup.com>; Wed, 10 May 2000 17:43:46 -0700 (PDT)
Message-Id: <200005110043.RAA24953@milano.cup.hp.com>
To: parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] Tree Issues 
In-reply-to: Your message of "Tue, 09 May 2000 10:37:07 PDT."
             <20000509103707.A13782@puffin.external.hp.com>
Date: Wed, 10 May 2000 17:43:46 -0700
From: Grant Grundler <grundler@cup.hp.com>
List-ID: <linux-parisc.vger.kernel.org>

Philipp Rumpf wrote:
> Hi,
> I just returned from spending a month in California working on stuff
> not related to PA-RISC (and a week here trying to get back into
> normal life).

Hi Philipp,

I hope things went well...certainly sounded interesting...

...
> I am going to try to set up a sourceforge.net project to keep my
> modifications publicly-visible now;  while I'm not perfectly happy
> with announcing anything before people can actually look at my code,
> I couldn't think of any better way to do it.

I was somewhat (not totally) surprised by this. I had to think about
several things before replying:
o what to do with hardware HP and/or TPG/LC have loaned you?
o should you keep CVS access rights to TPG's tree?
o why are you unhappy with TPG's CVS tree?
o why don't you want to talk publicly about it?
o what is the effective impact?

Easy stuff:
o I don't see why HP would want you to return any HW...as long as
  you keep using it for developement and post those results.
o You are not so stupid as to malicously mangle TPG's CVS tree.
  Keeping CVS access should be fine.


Hard Stuff:
o Not sure about the net impact. TPG and HP folks will continue working
  using TPG's tree. I'm pretty sure the debian release will be based
  on TPG's tree.

  But I can think of several excellent reasons why it's better for
  you to publish/manage your own tree:
  + you can change everything as often as you like - you'll be happier
    and make more changes.
  + You stop wasting time with merging your changes to TPG/LC's tree.
  + Those changes are visible "immediately" instead of waiting for
    you to commit code. (which has been a serious problem, IMHO).
  + You need the experience. Working with others is seldom really easy.
    And keeping people motivated to work on stuff that one needs help
    with requires such experience. I'm talking about:
    http://puffin.external.hp.com/mailing-lists/parisc-linux/1999/09-Sep/0011.html
    and similar conflicts with others.

  Drawbacks:
  - Someone else (who probably knows less about it) will end up
    merging your interesting changes to TPG/LC's tree.
    This is in addition to regular merges with linus' tree.


o I don't understand why you are so unhappy with TPG's CVS tree.
  Certainly there are design and implementation problems in that tree.
  But such compromises are necessary for cooperation. Until we have
  more data about what works/doesn't work, such compromises are part
  of sharing code. I didn't get everything I wanted either
  (eg do_irq_mask()).

  I assume you aren't talking about bug fixes.

o "Success" in a cooperative project like this requires constructive
  communication. Dave Miller/Martin Mares replied constructively to
  my e-mail inqueries despite the fact that (a) I'm a linux "novice" and
  (b) they have NFC who I am. I'm very impressed with both of them.
  And I think they also benefitted from at least a few of the things
  I wrote them.

...
> I do not think this fork has to be a permanent one, though I can't
> help thinking it is likely to be;

I suspect it will be too - working with others can be harder than
working alone. But on a "project" of this scope, I don't see one
person being successful.

> I will be happy to talk to the
> TPG/LC tree maintainers once I have a tree which I am happier with
> than I am with the current cvs tree.

Yes...but will they want to talk to you?
If HP helps TPG/LC run the tree, do they need to?
I hope you haven't "burned your bridges" here...


Anyway, thanks for telling us!
And I still look forward to future technical discussions with you!

thanks,
grant


Grant Grundler
Unix Development Lab
+1.408.447.7253
