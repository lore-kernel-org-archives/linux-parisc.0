Received: from mailserv2.iuinc.com (qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.8.7/8.8.7) with SMTP id RAA10613
	for <parisc-linux@puffin.external.hp.com>; Tue, 11 May 1999 17:46:56 -0600
Date: Tue, 11 May 1999 19:46:41 -0400 (EDT)
From: Alex deVries <adevries@redhat.com>
To: "Martin K. Petersen" <mkp@mkp.net>
cc: parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] A180 Ignition Howto
In-Reply-To: <yq1vhdz9r1q.fsf@jaguar.socsci.auc.dk>
Message-ID: <Pine.LNX.3.96.990511194053.3178B-100000@devserv.devel.redhat.com>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
List-ID: <linux-parisc.vger.kernel.org>


On 12 May 1999, Martin K. Petersen wrote:
> 
> My A180 arrived a couple of days ago.

So, the three Americans have theirs, the Dane was next, and the four of
the five Canadians have theirs too now.  The Welshman is all that's left.
Wuhoo!

> The A180 has a builtin webconsole. On the back of the system unit
> there are two RJ45 connectors. One of them is regular ethernet
> (DEC2114x btw. Should be piece of cake to get running) and the other
> is for the webconsole.

How did you know that it was a tulip?

> Oh, well. Bugger. Then I decided to try out the webconsole. The
> interface defaults to 192.0.0.192. Clickety-clik. *Blam* the Java
> stuff in the webconsole nuked my Netscape. Grumble.

I had similiar problems with Netscape 4.51.  It seems to work just fine on
Netscape 4.08, though, which is what came with Red Hat 5.2.

I haven't gotten to serial console yet because both my desktop and my
(recently dropped) notebook both only have 9 pin serial ports, and the
supplied cable's 25 pins.

Incidentally, Christopher Beard told me over lunch that he got the kernel
building under HPUX, which would solve the linking problems we were
worried about.

- Alex
