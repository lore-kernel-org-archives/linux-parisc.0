Received: from mailserv2.iuinc.com (qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.8.7/8.8.7) with SMTP id QAA32148
	for <parisc-linux@puffin.external.hp.com>; Sun, 11 Jul 1999 16:39:15 -0600
Received: from tintin.mcom.com (tintin.mcom.com [205.217.233.42])
	by netscape.com (8.8.5/8.8.5) with ESMTP id PAA27176
	for <parisc-linux@thepuffingroup.com>; Sun, 11 Jul 1999 15:39:18 -0700 (PDT)
Received: from obob.netscape.com ([207.200.73.215]) by
          tintin.mcom.com (Netscape Messaging Server 4.1) with ESMTP id
          FEQ9LH00.88Z for <parisc-linux@thepuffingroup.com>; Sun, 11 Jul
          1999 15:39:17 -0700
Sender: shaver@netscape.com (Mike Shaver)
Message-ID: <37891C51.71A7F3F5@netscape.com>
Date: Sun, 11 Jul 1999 18:36:01 -0400
From: Mike Shaver <shaver@netscape.com>
MIME-Version: 1.0
To: Helge Deller <Helge.Deller@ruhr-uni-bochum.de>
CC: Philipp Rumpf <prumpf@suse.de>, parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] Helge's commits
References: <199907101141.FAA25297@puffin.external.hp.com> <19990711004621.G29058@suse.de> <37886585.34B86082@ruhr-uni-bochum.de>
Content-Type: text/plain; charset=us-ascii
List-ID: <linux-parisc.vger.kernel.org>

Helge Deller wrote:
> From what I (and you too) saw, Utah CSS/CSL would be able to change that license,
> the only question is, if OSF is willing to change it too ?

OSF's license is _probably_ GPL-compatible as-is, though the requirement
for mention of permission notice in documentation might put it afoul,
and I'd want to check with a real lawyer to be sure.  The Utah CSS/CSL
license, as currently in place on pdc.h and such, is not at all
GPL-compatible.  Hopefully, we can get it changed, but in the meantime I
don't think we should be barging ahead and adding these files to the
tree. 

I and others (self-identify if you wish) think that until the issues are
cleared up, we should probably remove the OSF/CSS/CSL code from the
tree.  Hopefully we can get it all cleared up in short order, but until
then I'm nervous about what happens a month from now when Utah says
``no, you can't relicense'' and we have to redevelop lots of the code. 
Ask the 4.4LITE guys, it's not fun.

Mike

-- 
350842.71 306592.32
