Received: from mailserv2.iuinc.com (qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.8.7/8.8.7) with SMTP id RAA19513
	for <parisc-linux@puffin.external.hp.com>; Wed, 17 Nov 1999 17:06:42 -0700
Date: Thu, 18 Nov 1999 01:09:30 +0100
From: Philipp Rumpf <Philipp.H.Rumpf@mathe.stud.uni-erlangen.de>
To: Stan Sieler <sieler@allegro.com>
Cc: Philipp Heinrich Rumpf <Philipp.H.Rumpf@mathe.stud.uni-erlangen.de>,
        parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] depi?
Message-Id: <19991118010930.G10209@mathe.stud.uni-erlangen.de>
References: <19991117235220.E10209@mathe.stud.uni-erlangen.de> <199911172337.PAA14420@opus.allegro.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <199911172337.PAA14420@opus.allegro.com>
List-ID: <linux-parisc.vger.kernel.org>

> I must be missing something...the above should branch
> to: sr7.0xc008dbc0, not to "0xc008dbc0".  I.e., you specified SR7
> in the BE instruction, so it gets used.  

No, we didn't.  We set the space register selection field to '00' which
according to the documentation means you select SR7 but in reality means
you don't want to have anything to do with space registers.  Just think
of it as flat address 0xc008dbc0 and of SR[123]:0xc008dbc0 as "real"
segmented addresses.

> So, SR7 indeed needs to be set correctly...but since I haven't
> looked at the surrounding code...

SR0, SR4, SR5, SR6, SR7 shouldn't ever need to be set to different values
for flat 4 gig code.  SR1, SR2, SR3 you use only for "real" segmented code.

(This is based on what the C compiler does, and what changed with PA2.0)
	
	Philipp Rumpf
