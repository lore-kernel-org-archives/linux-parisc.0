Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from hal.pp.fishpool.fi (hal.pp.fishpool.fi [195.197.229.212])
	by dsl2.external.hp.com (Postfix) with ESMTP id D62874831
	for <parisc-linux@parisc-linux.org>; Fri, 11 Oct 2002 03:03:23 -0600 (MDT)
Received: from q-funk (helo=localhost)
	by hal.pp.fishpool.fi with local-esmtp (Exim 3.35 #1 (Debian))
	id 17zvhY-00078s-00
	for <parisc-linux@parisc-linux.org>; Fri, 11 Oct 2002 12:03:20 +0300
Date: Fri, 11 Oct 2002 12:03:20 +0300 (EEST)
From: =?iso-8859-1?Q?Martin-=C9ric_Racine?= <q-funk@pp.fishpool.fi>
To: parisc-linux <parisc-linux@parisc-linux.org>
Message-ID: <Pine.LNX.4.21.0210111156240.24681-100000@hal.pp.fishpool.fi>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=iso-8859-1
Subject: [parisc-linux] hardware features of 712-60 ?
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

Greetings,=20

I'm compiling my own kernel and I have some questions.  My goal is to produ=
ce a
kernel that is as lightweight as possible, which implies disabling support =
for
hardware that is not found on this 712-60. =20

At this point, I apt-got kernel-source-2.4.19-hppa and unpacked it, and alr=
eady
selected the 7100LC/7300LC CPU option.  What else?  Has anybody compiled a =
FAQ
on parisc-linux that provides .config files optimized for each PA-RISC hard=
ware
or, alternately, a checklist of hardware one finds in product xxx, referenc=
ed by
Linux kernel feature or module name?=20

PS:  I don't subscribe to parisc-linux.  Please CC replies to this address.

--=20
Martin-=C9ric Racine, Espoo, Finland.
"Kas sa tahad mind? - Nej!!! =C4r du en idiot?!!"
http://www.pp.fishpool.fi/~q-funk/
