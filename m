Received: from mailserv2.iuinc.com (qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.8.7/8.8.7) with SMTP id KAA22193
	for <parisc-linux@puffin.external.hp.com>; Fri, 22 Oct 1999 10:21:43 -0600
Message-Id: <199910221606.JAA00597@milano.cup.hp.com>
To: Alex deVries <adevries@thepuffingroup.com>
cc: parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] Boot messages from C3000 console 
In-reply-to: Your message of "Thu, 21 Oct 1999 22:33:15 PDT."
             <Pine.LNX.4.10.9910212221480.18206-100000@vodka.thepuffingroup.com>
Date: Fri, 22 Oct 1999 09:06:39 -0700
From: Grant Grundler <grundler@cup.hp.com>
List-ID: <linux-parisc.vger.kernel.org>

Alex deVries wrote:
...
> If the code in head.S is a bit rough, remember that it was just about the
> first PA-RISC assembler that Helge or Philipp had ever written, so do keep
> that in mind.  Also, at the start of the project, there was a very
> conscious effort to only be concerned with 1.1 code.  It doesn't surprise
> me in the least that it's not 2.0 compliant.
> 
> I agree that the code is unreadable though;  I've simply passed it off on
> not being able to understand parisc assembler well enough.

Alex,
I think you are walking around Frank's point:
	It doesn't matter which language the code is written in.
	The code should be readable by a wide audience.
	(Understanding will still be limited to a subset)

(Corallary: Because it's assembler, comments and #define's are required
for clarity and there were none.)

> We'd all appreciate it if you could commit appropriate changes to make the
> code clearer.

That's what I suggested earlier to him. My sense is the "Open Source Way"
(similar to the "HP Way") is to do, not to complain.

[ soapbox on ]
I agree with Frank's gripe too...IMHO, it would be really bad thing for
parisc-linux if he not to contribute.  My point is contributors should
remember out of 6 billion other people on the planet, a few capable ones
will choose to look at the code because they want to add functionality or
fix "bugs". And they can change their mind after the first look.

And worse would be if only-slightly-less-capable folks contribute stuff which
breaks various platforms (we'll get there). And even with well commented,
supportable code, it could take a while to sort out which code is "broken"
and which platforms it's needed on. I would prefer if someone like Frank
just did it right the first time around...but if I can't have that I'd
at least like him to help look at problems in the successive passes.
[ soapbox off ]


grant

Grant Grundler
Communications Infrastructure Computer Operations
+1.408.447.7253
