Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id TAA30519
	for <parisc-linux@puffin.external.hp.com>; Mon, 15 Jan 2001 19:22:58 -0700
Received: from dualcel400 ([141.140.106.33])
 by macalester.edu (PMDF V5.2-32 #38670)
 with SMTP id <01JYY6H58QFS001U21@macalester.edu> for
 parisc-linux@thepuffingroup.com; Mon, 15 Jan 2001 20:26:40 CDT
Date: Mon, 15 Jan 2001 20:25:15 -0600
From: Josiah Carlson <jcarlson@macalester.edu>
Subject: Re: [parisc-linux] website
In-reply-to: <20010115231000.J28689@parcelfarce.linux.theplanet.co.uk>
To: parisc-linux@thepuffingroup.com
Message-id: <3A63B10BBB.D2B5JCARLSON@smtp.macalester.edu>
MIME-version: 1.0
Content-type: text/plain; charset=US-ASCII
References: <3A63811B3D8.D2B3JCARLSON@smtp.macalester.edu>
 <20010115231000.J28689@parcelfarce.linux.theplanet.co.uk>
List-ID: <linux-parisc.vger.kernel.org>

Matthew Wilxox,

I've been trying to look at the issues you've brought up, and figure out
some way that someone can fix them.  Here are the problems that I've
been able to come up with from the emails:

1. Font sizes and the resulting readibility on hi res screens,
particlarly on netscape browsers.
2. Problem with the memory usage of the tables, and the rendering speed,
particularly on netscape browsers.
3. Build system as it relates to the the way the pages are
updated...causing them to get out of sync.
4. The fact that parisc-linux.org is overseen by the HP corporation, and
that they are unwilling to change the layout and such of the web page.

Problems 1 and 2 both seem to stem from the way the Netscape browser
handles pages.  Yes, the over-use of tables is not necessary and causes
loading issues for people on saturated connections who also happen to be
using netscape 4.x.  And I also hate the over-use of tables (I once
viewed a web page that had 4 images and maybe a paragraph or so of
actual text, but was filled with 25k of table formatting crap that could
have been removed with a <center> tag and a few line breaks).  But they
aren't embedding hundreds of tables within themselves, I looked at the
html in your email.  I agree, the three tables didn't need to be used,
but then again, the designers of the pages probably aren't using a text
editor to set up a web page, I wouldn't doubt if they are using some
sort of gui editor...which in my experience with them, produces too much
unneeded bullshit.
I'm guessing with the amount of stuff they've got to set up, they lack
the time to hand code everything...that is much of the same reason why
so many pages have so many tables.  Not everyone has the time to hand
code every page, but then again, if some section of code is going to go
into every web page, it should be tight.  Though we've got to remember
that we're dealing with a corporation, with a structure, with
supervisors.  If there's one thing that I've learned from working at any
workplace, it's that supervisors sometimes know less than a 2 year old
and sometimes are twice as stubborn.  If they're using some sort of
commercial web development tool, I would doubt if the supervisor cares
who did what, "If it wasn't produced by the package, it's not going in."
(quote from a supervisor I had, and this also being the response to
problem 4).
What really needs to happen to fix these pages, is not for you to leave
because you're unhappy with the future pages, but for the person(s) who
is(are) actually developing the pages to be able to be contacted, and
take constructive feedback, and actually be able to do something about
it (where's webmaster@parisc-linux.org?).

We can fix the font sizes and such though.  In the netscape preferences
(on 4.x, 6, and mozilla) have options for font size and style overrides
(Edit->Preferences->Appearance->Fonts). This is a personal thing, a
seriously personal thing, but easily fixed on all current browsers (IE
4.0+, NS4.5+, 6 and mozilla (don't know the original milestone this
started working on, but I've got 11, 13 and 17 if anyone wants to look).

Memory usage because of tables...I really can't help that, and unless
someone breaks into the mozilla source code and tightens it up a tad...I
don't think it's ever going to be efficient (though I can't notice a
difference in IE...but then again, IE never had the problems with tables
that NS 4.x had), though at least mozilla/6 renders as it receives
information, quite a step up from the 4.x releases.

Build system and page updates...ouch.  Yeah, that's a problem, though I
don't have a solution. *frown*

In response to your previous email:
No, I haven't read them, I must've missed them.  But yes, it is a
problem...but I was attempting to refer to the parts that non-developers
see, the faq, the start page, etc.  Though I can't change the build
system, not only am I not privy to the code, but I doubt that HP would
accept any changes if I had any. (more on that later)

The content comment...I actually went surfing around the page and
noticed your name here and there...funny, I never paid it attention
before.  My comment was to address everyone.  Let us say for example
that...I've got a C110 (which I happen to), and I've been having
problems getting it working (which I have, but the current comments on
the C100 are helping).  Currently there is not a whole lot of info on
getting said machines running on the main site.  If I ever get my C110
running (like the 712's and B160L's), I have to document the steps
required because someone in the future may have to do it again where I'm
at, and it could also be posted to the parisc-linux.org site for other
people. Using that as an example, anyone who'se had problems getting
things set up should document and get the solutions posted to the site
under the information for that particular machine.  Thank you for
posting, anything that people can add to help is all that much better
for the new guy (which I still am).

(in response to Stan Stieler) And about "my site's webmaster"...well,
that's not my site. It's my school's site, for I am merely an undergrad.
I do know that they use Dreamweaver to write the pages, which gives a
reason for the use of CSS, and over-use of tables on every page that is
school written. But that's their thing, and it's also a corporation of
sorts.  I know the guys who are doing work study making the pages...and
they would all prefer to do everything with a few scripts and some
hand-coded html...but the supervisors only know dreamweaver...so that's
all they get.  I looked at stieler.com and have been to hp.com quite
often, and while I agree that content should be the absolute desire,
content with a poor way of accessing said content is nearly as bad as
not having any.  Hp's site has alot of useful information...but I've
spent hours looking for what I need (same with intel's site).  Your site
doesn't have any ambiguity, but it also does not have the insane amounts
of information that the HP site has, nor is it nearly as visually
interesting0.
I'm going to use slashdot.org as an example here.  It has plenty of
information, fairly un-ambiguous interface, kind of visually interesting,
but also happens to have many tables.  Tables aren't necessarily bad
when used properly (not to say that slashdot.org uses them properly, but
they are used for the desired formatting, and not much else would
accomplish what they have).
The trick is to remember to seperate the different levels of web design
in a corporate style environment:
Content (what's there)
Interface (how do they get to it)
Back end (how it's stored/generated)
As a geek news source, slashdot.org has got them all down pretty well,
leaving only a little to be desired in the way of the amount of html
they use (and a bit of FUD on occasion).
hp.com lacks interface, but has excellent content and one hell of a back
end to be able to handle all that info.

So yeah, that's my take,
 - Josiah
