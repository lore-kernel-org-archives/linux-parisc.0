Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from hotmail.com (oe58.law4.hotmail.com [216.33.148.154])
	by dsl2.external.hp.com (Postfix) with ESMTP id 76DF44829
	for <parisc-linux@parisc-linux.org>; Sat, 12 Oct 2002 03:22:29 -0600 (MDT)
From: "kenneth westelinck" <kennywest1@hotmail.com>
To: =?iso-8859-1?Q?Martin-=C9ric_Racine?= <q-funk@pp.fishpool.fi>,
	"parisc-linux" <parisc-linux@parisc-linux.org>
References: <Pine.LNX.4.21.0210111156240.24681-100000@hal.pp.fishpool.fi>
Subject: Re: [parisc-linux] hardware features of 712-60 ?
Date: Sat, 12 Oct 2002 11:18:17 +0200
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Message-ID: <OE58WPj5T9S6Fmy332G000068d3@hotmail.com>
Sender: parisc-linux-admin@lists.parisc-linux.org
Errors-To: parisc-linux-admin@lists.parisc-linux.org
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux/>

Hello,

You can find my config for my 712/60 on:
http://lists.parisc-linux.org/hypermail/parisc-linux/8454.html
I don't think it will be very hard to create a custom config, as the 712/60
doesn't contain that much hardware (at least mine doesn't). The config you
find when following the URL works fine, but I can imagine you can strip it
down even more, depending on the stuff you need.
Hope this helps.


regards,

Kenneth

----- Original Message -----
From: "Martin-Éric Racine" <q-funk@pp.fishpool.fi>
To: "parisc-linux" <parisc-linux@parisc-linux.org>
Sent: Friday, October 11, 2002 11:03 AM
Subject: [parisc-linux] hardware features of 712-60 ?


Greetings,

I'm compiling my own kernel and I have some questions.  My goal is to
produce a
kernel that is as lightweight as possible, which implies disabling support
for
hardware that is not found on this 712-60.

At this point, I apt-got kernel-source-2.4.19-hppa and unpacked it, and
already
selected the 7100LC/7300LC CPU option.  What else?  Has anybody compiled a
FAQ
on parisc-linux that provides .config files optimized for each PA-RISC
hardware
or, alternately, a checklist of hardware one finds in product xxx,
referenced by
Linux kernel feature or module name?

PS:  I don't subscribe to parisc-linux.  Please CC replies to this address.

--
Martin-Éric Racine, Espoo, Finland.
"Kas sa tahad mind? - Nej!!! Är du en idiot?!!"
http://www.pp.fishpool.fi/~q-funk/

_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
