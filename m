Received: from mailserv2.iuinc.com (qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.8.7/8.8.7) with SMTP id XAA23106
	for <parisc-linux@puffin.external.hp.com>; Wed, 30 Jun 1999 23:10:07 -0600
Received: from i3125om5.atl.hp.com (root@i3125om5.atl.hp.com [15.45.88.74])
	by atlrel2.hp.com (8.8.6 (PHNE_17135)/8.8.5tis) with ESMTP id VAA22867
	for <parisc-linux@thepuffingroup.com>; Wed, 30 Jun 1999 21:20:42 -0400 (EDT)
Received: from vset33 (vset33.canada.hp.com [15.81.25.33]) by i3125om5.atl.hp.com with SMTP (8.8.6 (PHNE_17135)/8.7.3 TIS 5.0 Openmail) id VAA12010 for <parisc-linux@thepuffingroup.com>; Wed, 30 Jun 1999 21:20:57 -0400 (EDT)
Message-ID: <00be01bec35f$e780f410$2119510f@vset33.canada.hp.com>
From: "Kevin Carson" <Kevin_Carson@hp-canada-om1.om.hp.com>
To: <parisc-linux@thepuffingroup.com>
Subject: Re: [parisc-linux] H60
Date: Wed, 30 Jun 1999 18:20:27 -0700
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
List-ID: <linux-parisc.vger.kernel.org>

As I understand it,

second column consists of the PA-RISC instruction set revision (1.0, 1.1, or
2.0) and the letter indicates what type of CPU is running that revision in
the respective
box (CPU models being also the third column).

The point of all this is that the HP ANSI compiler takes both a instruction
revision the object code is targeted towards (the most portable being the
older revision 1.0 since all the revisions are backward compatible) and a
hint about which implementation the instruction scheduling optimizations
should be targeting (which does affect compatability in any way).

How much difference does the letter portion really make? From practical
experience not much, but it could!  Which is the point of maintaining this
file in the first place.  The instruction set revision makes a BIG
difference for later chips.

Kevin

-----Original Message-----
From: rrauenza@cup.hp.com <rrauenza@cup.hp.com>
To: adevries@thepuffingroup.com <adevries@thepuffingroup.com>
Cc: rrauenza@cup.hp.com <rrauenza@cup.hp.com>;
parisc-linux@thepuffingroup.com <parisc-linux@thepuffingroup.com>
Date: Tuesday, June 29, 1999 11:55 PM
Subject: Re: [parisc-linux] H60


>
>Apparently it exists in quite a few places!
>
>The second column is the PA-RISC version number.  I'm not sure how
>significant the letters are in the version numbers.
>
>> Rich Rauenzahn wrote:
>> >
>> > Take a look at  /usr/lib/sched.models on HP-UX -- it documents quite a
few
>> > models and PA-RISC versions.
>> >
>>
>> Oh, that's pretty interesting.  I found sched.modules in
>> /usr/sam/lib/mo.
>>
>> What's the second column?
>>
>> - Alex
>
>---------------------------------------------------------------------------
>To unsubscribe: send e-mail to parisc-linux-request@thepuffingroup.com with
>`unsubscribe' as the subject.
>
