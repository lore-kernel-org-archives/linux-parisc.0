Received: from mailserv2.iuinc.com (qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.8.7/8.8.7) with SMTP id SAA20059
	for <parisc-linux@puffin.external.hp.com>; Wed, 17 Nov 1999 18:34:19 -0700
Received: from xsvr4.cup.hp.com (xsvr4.cup.hp.com [15.0.68.169])
	by palrel1.hp.com (Postfix) with ESMTP id C48E677E
	for <parisc-linux@thepuffingroup.com>; Wed, 17 Nov 1999 17:35:52 -0800 (PST)
Received: from hp.com (localhost [127.0.0.1]) by xsvr4.cup.hp.com with ESMTP (8.7.6/8.7.3) id RAA12726 for <parisc-linux@thepuffingroup.com>; Wed, 17 Nov 1999 17:35:52 -0800 (PST)
Sender: frowand@cup.hp.com
Message-ID: <383357F7.5427C8DB@hp.com>
Date: Wed, 17 Nov 1999 17:35:51 -0800
From: Frank Rowand <frank_rowand@hp.com>
Reply-To: frowand@cup.hp.com
MIME-Version: 1.0
To: parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] depi?
References: <19991117235220.E10209@mathe.stud.uni-erlangen.de> <199911172337.PAA14420@opus.allegro.com> <19991118010930.G10209@mathe.stud.uni-erlangen.de> <38334BA5.BAA898D@hp.com>
Content-Type: text/plain; charset=us-ascii
List-ID: <linux-parisc.vger.kernel.org>

Frank Rowand wrote:
> 

> When address translation is enabled, a space register is *always* used.

Ok, ok, slight overstatement.  Of course the various load absolute
instructions don't use space registers...

-Frank
