Received: from mailserv2.iuinc.com (qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.8.7/8.8.7) with SMTP id NAA23724
	for <parisc-linux@puffin.external.hp.com>; Mon, 6 Dec 1999 13:00:44 -0700
Received: from milano.cup.hp.com (root@milano.cup.hp.com [15.16.124.11])
	by palrel3.hp.com (8.8.6 (PHNE_17135)/8.8.5tis) with ESMTP id MAA01293
	for <parisc-linux@thepuffingroup.com>; Mon, 6 Dec 1999 12:02:33 -0800 (PST)
Message-Id: <199912062005.MAA17220@milano.cup.hp.com>
To: "BENKE,FRANK \(contractor\)" <frank_benke@non-hp-germany-om4.om.hp.com>
cc: parisc-linux@thepuffingroup.com
Subject: Re: HP parisc documents
In-reply-to: Your message of "Fri, 03 Dec 1999 18:59:58 PST."
             <87FB8F5CE210D311B60500A0C9F4871C4B4921@xcup01.cup.hp.com>
Date: Mon, 06 Dec 1999 12:05:11 -0800
From: Grant Grundler <grundler@cup.hp.com>
List-ID: <linux-parisc.vger.kernel.org>


Frank,
Mike Balma forwarded your e-mail to me. I saw Mike's first reply
and he touched on the answer. I'd like to expand on that and share
it with the parisc-linux community.

"BENKE,FRANK (Non-HP-Germany,om4)" wrote:
...
 
> one issue which came to my attention is that communication through the
> puffin group , resp.  alex de vries works not quite optimal, and i was
> asked if there is another way to directly receive technical docsthrough
> hp - germany . is there a way ? ... since the german parisc developers
> feel quite uncomfortable.

The problem is not with TPG or Alex DeVries.

The problem is the technical docs where never written for public
consumption and not well maintained. Before publishing these documents,
it's in both HP's and parisc-linux developers interest both issues get
addressed. Below, I explain the general process of getting a document
published.


And later, Frank also wrote:

> 1.st The Communications Issue : well, several of the german developers
> complained about some difficulties, but if grant has the usual internal
> resources that should be right appropriate and I suppose the guys, having
> questions could ask him directly, if the process through the puffingroup
> takes to long. as far as i know grant is online within the linux.net
> anyway.

That's correct. Myself, Frank Rowand, Paul Bame, and others do take
questions and try to answer them. Heck, we even just post our opinions
without being asked (especially me ;^). Please post questions to parisc-linux
mailing list and generally they will get answered the same day by someone
or even several people. Several *very* knowledgable HP folks are watching
this list and I consider myself a "newbie" (after 6 years!) to that "group".


...
> according to my presence at several linux events, I was simply asked by
> some of the german pa-developers and since I'm not informed about hp's
> policy on that I simply want to understand the process. the problems I
> was told about, were that comunication through alex lack in efficiency
> and some people asume that alex is anxious about whatever. politics !


The problem is not politics - it's business. HP needs to make money.
And publishing docs won't generate revenue for the divisions which
"own" the documents. So it's up to volunteer efforts address both issues.

Here's the general process:
o locate the latest editable revision of the document. For stuff more
  than a one or two years old this can be a problem (eg ASP, WAX, Uturn).
o locate the editing tool (version X of interleaf) and convert it to
  a useful format (eg FrameMaker or whatever).
o remove references to engineers, Project names, etc.
o remove references to "Intellectual Property" (IP) HP doesn't own.
o remove IP which HP doesn't want published (eg trade secrets)
o correct known errors
o forward document to manager for review
o forward document to a company attorney for review. They will verify
  no IP or copyright infringement has occurred.
o publish pdf/postscript by forwarding it to TPG and they post it.
  (also look at devresource.hp.com)

Getting a manager and attorney to review documents best suited for
bedtime reading is like pulling teeth. And I'm not sure how they
get compensated for it. But they certainly aren't doing it in their
spare time. So this whole process takes several monthes before
The Puffin Group ever sees a document.

People will question why we don't publish techinical documents in their
current form if eveyone is unhappy about the process. The answer
is HP management *tolerates* the current process. HP will get a
severe "allergic reaction" to the first lawsuit resulting from
publishing documents for older products. Forget trying to publish
any documents without a "business case" to support the action
from that point on.

Lastly, check parisc-linux archives...most issues have come up at
one time or another. Things change and it may be worth raising
an issue (like this one) again. But knowing the background will improve
the quality of the dialog.

hope this helps,
grant

Grant Grundler
Unix Developement Lab
+1.408.447.7253
