Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from cpout2.tiscali.be (cpout2.tiscali.be [62.235.13.194])
	by dsl2.external.hp.com (Postfix) with ESMTP id 5276E4840
	for <parisc-linux@lists.parisc-linux.org>; Mon, 24 Nov 2003 00:21:32 -0700 (MST)
Date: Mon, 24 Nov 2003 08:21:28 +0100
Message-ID: <3FB265250000633D@ocpmta2.freegates.net>
In-Reply-To: <20031124022514.GA23224@colo.lackof.org>
From: "Joel Soete" <soete.joel@tiscali.be>
Subject: Re: [parisc-linux] strace locks up 2.4.22-pa14
To: "Grant Grundler" <grundler@parisc-linux.org>
Cc: parisc-linux@lists.parisc-linux.org
MIME-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"
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


>>  May I ask you the amount of ram stand in your c3k? (on my 
>> b2k only 256k).
>
>1GB.
>
I would be curious if the same behavior occurs with only 512K?

>> >If network, then I would guess your merge (or the 2.4.23-rc2 base) has
a 
>> >bug.
>> 
>> Certainly :( [but where, the rest ftp, rsync, nfs-client, gtk-app, ...

>> work fine and no special messages neither into kernel, messages or 
>> syslog?]. Well don't care now, it is just a beat anoying to printout my

>> scripts.
>
>ok. TBH, I have no clue then. It might be possible to attach strace to
>a running lp deamon, redirect strace output to /dev/console and then
>compore what happens different on the b2k when a print job is started.

Good idea, I will try to see howto.

>My hope is the syscall output will get printed before it totallte crashes.

That should be a good explanation.

Thanks for attention,
Joel



-------------------------------------------------------------------------
Tiscali ADSL: 12 mois à 29,50 €/mois! L'Internet rapide, c'est pour tout
le monde.
http://reg.tiscali.be/default.asp?lg=fr
