Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id MAA14845
	for <parisc-linux@puffin.external.hp.com>; Sat, 20 Jan 2001 12:46:31 -0700
Message-Id: <200101201952.LAA17191@milano.cup.hp.com>
To: R P Herrold <herrold@owlriver.com>
Cc: Jane Vinet <jvinet@linuxcare.com>, parisc-linux@thepuffingroup.com
Subject: Re: Administrivia and a question
In-reply-to: Your message of "Sat, 20 Jan 2001 09:39:26 PST."
             <Pine.LNX.4.30.0101200918470.28153-100000@swampfox.owlriver.com>
Date: Sat, 20 Jan 2001 11:52:10 -0800
From: Grant Grundler <grundler@cup.hp.com>
List-ID: <linux-parisc.vger.kernel.org>


Russ,
We *need* editorial help in a serious way.
Give us some time to figure this out.  This project has had some rough
moments in the past two years and I don't think we want to rock the
boat on this issue(s) either.

Here are what I see as some of the issues:

To become a document maintainer:
o demonstrate they can be "trusted" or have existing folks vouch for them
o *user* of parisc-linux  (a vested interest in the information)
o Understand the *usage*  (not necessarily the underlying technology)

parisc-linux.org:
o clarify process for determining who should have CVS access
o find a maintainer for the document "ownership list" (Russ? :^)
o simple html interface so anyone can update web site
o timely, regular updates CVS repository -> Website

Of the above, I think parisc-linux team needs to decide on a process
first. It's been very informal up to now.  We will not give CVS access
to anyone who asks for it since it's clear that won't work and isn't
"the linux way" (to paraphrase the HP slogan).  We do need to
"scrub" the current CVS access of people who are no longer active
contributors.

I'm certain that over the course of this year, the binutils/gcc/glibc/linux
CVS repositories are going to be less active and the website will
see explosive activity. Primarily because most of the technical
developement will move out of our "sandbox" and into the "upstream"
sources. However, for user documents, I expect parisc-linux.org to
be the focal point.

Jane can help setup the details for you (and others) to contribute.
(thanks jane! You *are* doing a great job despite recent difficulties!)

R P Herrold wrote:
> 1. The submission got me thinking.  I just examined
> http://parisc-linux.org/faq.html --- and there is no listing
> of a formal role-address for an 'editor' of FAQ content.  So
> it will probably be lost in the essectially unsearchable
> archive at:

I don't agree the FAQ should become a repository for *all* "gems"
posted to parisc-linux mailing list. Our FAQ should be a starting point
for people with questions about parisc-linux. Not a database of trivia.
We have recipes and other documents the FAQ can point to provide details
about how to set things up, or workarounds for broken things.

> So my question is: How may one contribute at an editorial and
> project infrastructure level?  I wish to do so, and bet others
> on the list do too.

Agreed. Russ, is there a specific document you'd like to work on?
(eg FAQ or one of the recipes)

thanks all,
grant

Grant Grundler
Unix Systems Enablement Lab
+1.408.447.7253
