Received: from mailserv2.iuinc.com (qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.8.7/8.8.7) with SMTP id FAA29947
	for <parisc-linux@puffin.external.hp.com>; Tue, 16 Nov 1999 05:42:00 -0700
Date: Tue, 16 Nov 1999 13:39:19 +0100
From: Matthew Wilcox <Matthew.Wilcox@genedata.com>
To: John David Anglin <dave.anglin@nrc.ca>
Cc: frowand@cup.hp.com,
        Philipp Rumpf <Philipp.H.Rumpf@mathe.stud.uni-erlangen.de>,
        parisc-linux@thepuffingroup.com,
        Alex deVries <adevries@thepuffingroup.com>
Subject: Re: [parisc-linux] depi?
Message-ID: <19991116133919.A25252@mencheca.ch.genedata.com>
References: <Pine.LNX.4.10.9911150307300.7996-100000@vodka.thepuffingroup.com> <199911150736.XAA14959@opus.allegro.com> <19991115092549.G30917@mathe.stud.uni-erlangen.de> <383093DE.A8B73CE4@hp.com> <3830A4C6.C2CB788@nrc.ca>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <3830A4C6.C2CB788@nrc.ca>; from John David Anglin on Mon, Nov 15, 1999 at 07:26:49PM -0500
List-ID: <linux-parisc.vger.kernel.org>

On Mon, Nov 15, 1999 at 07:26:49PM -0500, John David Anglin wrote:
> I think it was done to simplify the syscall interface.

Nope.  Maybe we'll need a slightly different syscall entry path depending
on where the kernel ends up, but choosing where the kernel lives will have
no material effect on syscalls.  About the only place which is undesirable
for the kernel to live is 0xc000'0000 :-)

-- 
Matthew Wilcox <willy@bofh.ai>
"Windows and MacOS are products, contrived by engineers in the service of
specific companies. Unix, by contrast, is not so much a product as it is a
painstakingly compiled oral history of the hacker subculture." - N Stephenson
