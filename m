Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id XAA26862
	for <parisc-linux@puffin.external.hp.com>; Mon, 15 Jan 2001 23:25:55 -0700
Received: from dualcel400 ([141.140.106.33])
 by macalester.edu (PMDF V5.2-32 #38670)
 with SMTP id <01JYYEYC8W48001V3H@macalester.edu> for
 parisc-linux@thepuffingroup.com; Tue, 16 Jan 2001 00:29:36 CDT
Date: Tue, 16 Jan 2001 00:28:10 -0600
From: Josiah Carlson <jcarlson@macalester.edu>
Subject: Re: [parisc-linux] website
In-reply-to: <200101160501.VAA11005@milano.cup.hp.com>
To: Grant Grundler <grundler@cup.hp.com>, Stan Sieler <sieler@allegro.com>,
        parisc-linux@thepuffingroup.com
Message-id: <3A63E9FA2CE.D2B6JCARLSON@smtp.macalester.edu>
MIME-version: 1.0
Content-type: text/plain; charset=US-ASCII
References: <3A63B10BBB.D2B5JCARLSON@smtp.macalester.edu>
 <200101160501.VAA11005@milano.cup.hp.com>
List-ID: <linux-parisc.vger.kernel.org>

> Wrong on two counts: HP does not run the web site. AFAIK, HP helped
> fund the parisc-linux site developement and approved it's current
> layout/use of HP logo. No one said anything about future developement.
> This issue is still under discussion and Mathew's input has been heard.

I did not know that. Thank you for putting me straight.

> Who are just people.
> Some need to learn new things they don't yet know.
> Funny. None of my supervisors have ever fit that description.
> Maybe I'm just lucky.

*nod* They need to learn, but some aren't willing.  I don't know the
structure at HP, but most any job I've been at...yeah, had a couple good
ones, but those are rare, and you are quite lucky.  Though with the
newfound knowledge that it's not overseen by a large corporation, let us
get with the page alterations already *wink*.

> Wrong again.
> Source is visible at http://puffin.external.hp.com/cgi-bin/cvsview
> or through CVS. Just like the linux kernel.
> You are right - HP won't. Mostly because HP doesn't "own" it.
> Anyone with write access to the CVS repository can change it.
> Only about 1/5th of the people with such write access are HP
> employees.

I must have missed that link as well.  I did not know that just about
everything (web page included) were easily modifyable...but if it's so
easy, why haven't the changes been made?  Why is Matthew so pissed off? 
(I admit that I flamed in response, and I'm sorry...at the time I was
pissed because I didn't have lab access to my hp machines because of the
holiday.  Since then I've had my nap and dinner.)

> 1) It's because owners of said machines haven't *written* a web page
>    (or FAQ) specific to each platform.
> 2) Such a page would fairly quickly be stale.
>    The long term goal is to have one process/kernel for all machines.
>    (64- vs 32-bit kernels is the only issue that won't go away.)

MMM.  Good point, until that happens however...I'm of the belief that
anyone that has problems getting things working should document what
they did to get their machine working (if they ever did).  Regardless of
how out of date it is...you never know how helpful it could be.  For
example...the install directions should include the serial console
tidbit.  Everyone here knows about it...but not everyone does when they
go to first boot off the image (as I did, and subsequently emailed Paul
Bame).  But regardless of the state of the port...sometimes software
just doesn't like to run on multiple platforms (any *nix distro on a
Sony vaio will have problems with the multimedia stuff built into
them...because of the machine...like those particular HP servers that
just don't work). It's good to have documentation. It's part of what
seperates good software from bad.

> Exactly. Post it here and people can find it by searching the
> mail archive. (That's probably another FAQ, Alex?).

When I get done, I most certainly will.

> not really...let's say you've got your system and/or Netscape (and/or
> MSIE) default fonts the size that you'd like (for readability).
> Along comes a page that says: hey...I don't care what your default is,
> I want "size=-1" or "size=-2" ... i.e., "I want a font smaller than
> you like".

*nod* Hrm...that's messed up.  I've never done such a thing.  I've
always done the size=+1 to indicate bold (because bold just isn't enough
sometimes)...but to make the stuff smaller...that's just plain bad
design (unless you want some fine print at the bottom, then it's just
plain bad mojo).  If people can't see what you want them to, what good
is it.  Though I mistakenly thought that the overrides overrides _all_
font settings in the page. For it not to, when you specifically tell it
to...I don't know, maybe another setting for relative font sizing in the
browsers is in order.

>Me too...particularly the bad way HP uses them...they violate the HTML
>standard, and the result is (often) that Netscape renders them okay,
>but refuses to search for text in them (if you do control-F).

*nod* Java generated pages do that to me on occasion to.

>You're missing something...the pages that Matthew (and others) have 
>complained about are going out of their way to say:
>   hey, we know better than the owner of the computer what font sizes
>   are readable on his/her PC!

I was missing that yes.  What should really happen then is that sites
stop doing that...but until they do...maybe what some people need is a
web site post-processor proxy that gets rid of the size=-* tags.

>I only used that as an example of a page that doesn't try to control
>the font size, so you could do a quick A/B comparison.
>BTW, that was a nice posting you did, thanks!
With the previous 3 or 4 responses above...yeah, I got that now. 
Originally I thought you were trying to tout your 31337 html coding
abilities...then I got there, and noticed the white *wink*.  I used to
go to a site called Silicon Toad's BBS (back in 94, mosaic was the
shit), and he hand coded everything.  That was an impressive site in the
2.x days when the lucky people had 19.2.  Pretty and less than 10k.
*nastalga mode off*
And, um, you're welcome?

 - Josiah
