Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id GAA08397
	for <parisc-linux@puffin.external.hp.com>; Thu, 25 Jan 2001 06:25:04 -0700
Received: from parcelfarce.linux.theplanet.co.uk (HELO www.linux.org.uk) (195.92.249.252)
  by mailserv2.iuinc.com with SMTP; 25 Jan 2001 13:29:00 -0000
Received: from willy by www.linux.org.uk with local (Exim 3.13 #1)
	id 14Lm2r-00078d-00; Thu, 25 Jan 2001 13:02:33 +0000
Date: Thu, 25 Jan 2001 13:02:33 +0000
From: Matthew Wilcox <matthew@wil.cx>
To: Michael Ang <mang@subcarrier.org>
Cc: Grant Grundler <grundler@cup.hp.com>, parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] 2.4.0 merge mangle our tree?
Message-ID: <20010125130233.A25242@parcelfarce.linux.theplanet.co.uk>
References: <200101250346.TAA21555@milano.cup.hp.com> <Pine.BSF.4.10.10101242312100.26332-100000@cuzea.pair.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
In-Reply-To: <Pine.BSF.4.10.10101242312100.26332-100000@cuzea.pair.com>; from mang@subcarrier.org on Wed, Jan 24, 2001 at 11:19:57PM -0500
Sender: <willy@www.linux.org.uk>
List-ID: <linux-parisc.vger.kernel.org>

On Wed, Jan 24, 2001 at 11:19:57PM -0500, Michael Ang wrote:
> That seems closer to what you want, but backs out any changes made since
> the merge started.  Not sure what the difference between *_PREMERGE and
> *_PREIMPORT is - you'd have to ask willy, I guess.

_PREIMPORT was a tag laid down by paul.  _PREMERGE was the tag I laid
down before starting the merge.

i'm not sure why i fucked up the branching so badly.  I did:

cvs tag -b LINUS_240_FIXUP
cvs ci
cvs add (several times, adding new directories and new files)
cvs ci
cvs -n up
cvs rm
cvs ci

(taken from my bash history, so i know this is exactly what i did)

the manpage says:

              To create a branch revision, one
              typically use the -b option of the rtag or tag com­
              mands.  Then, either checkout or update can be used
              to base your sources on the newly  created  branch.
              From  that point on, all commit changes made within
              these working sources will be  automatically  added
              to  a branch revision, thereby not perturbing main-
              line development in any way. 

so what did i do wrong?

the other question is how best to fix the mess... if you check out
LINUS_240_FIXUP do you get a non-broken kernel?  does it work?  if so,
let's just put it all back on the HEAD.  if not, we have to try figuring
out something else.

-- 
Revolutions do not require corporate support.
