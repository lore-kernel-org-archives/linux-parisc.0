Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from cpout1.tiscali.be (cpout1.tiscali.be [62.235.13.193])
	by dsl2.external.hp.com (Postfix) with ESMTP id CA3AB4834
	for <parisc-linux@lists.parisc-linux.org>; Thu, 12 Jun 2003 02:45:50 -0600 (MDT)
Date: Thu, 12 Jun 2003 10:45:47 +0200
Message-ID: <3ED71F6D000046BD@ocpmta7.freegates.net>
In-Reply-To: <1055363548.2419.41.camel@dhcp22.swansea.linux.org.uk>
From: "Joel Soete" <jsoe0708@tiscali.be>
Subject: Re: [parisc-linux] palo II
To: "Alan Cox" <alan@lxorguk.ukuu.org.uk>,
	=?ISO-8859-1?Q?Stian=20S=F8iland?= <stian@soiland.no>
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

>
>> Joel gave a perfect example of when devfs would come of perfect use,
> variation of scsi devices fucks up "sdb", "sdc" and so on. 

>Seperate the theory from the implementation. The implementation has real
>problems. The theory has permission management problems

I was just looking for a sol to this anoying scsi disk named to refer to
(a la /dev/[r]dsk/cXtXdX on hpux or /dev/dsk/cXtXdXsX on solaris; ie a name
independent of the scan order of [scsi] interfaces)

>Dell have a nice little app that generates the right symlinks by device
>all in user space

I will try to find it and test

Thanks,
    Joel

ps: btw merge 2.4.21 any news? now for > 2.4.22 (for my part no info from
Marcelo neither 'no' nor 'yes'; is there some specific ml archive to read)

---------------------------------
Découvrez les 6 clés et gagnez le Club Med à Vie avec Tiscali
http://www.tiscali.be/nl/subs/tiscali4life/default.asp?lang=fr
