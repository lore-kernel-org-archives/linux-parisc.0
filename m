Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from smtp-out.tiscali.be (spoolm3.tiscalinet.be [212.35.2.72])
	by dsl2.external.hp.com (Postfix) with ESMTP id 8FAC64829
	for <parisc-linux@lists.parisc-linux.org>; Tue, 14 Jan 2003 08:29:05 -0700 (MST)
Date: Tue, 14 Jan 2003 16:28:50 +0100
Message-ID: <3DED9A660000598C@ocpmta3.freegates.net>
In-Reply-To: <200301141504.h0EF4FiQ002740@hiauly1.hia.nrc.ca>
From: jsoe0708@tiscali.be
Subject: Re: [parisc-linux] new gcc-snapshot problem [was: new gcc-default for hppa]
To: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Cc: tausq@debian.org, parisc-linux@lists.parisc-linux.org,
	debian-hppa@lists.debian.org
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

>-- Original Message --
>Subject: Re: [parisc-linux] new gcc-snapshot problem [was: new gcc-defau=
lt
>for hppa]
>To: jsoe0708@tiscali.be
>From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
>Cc: tausq@debian.org, parisc-linux@lists.parisc-linux.org,
>	debian-hppa@lists.debian.org
>Date: Tue, 14 Jan 2003 10:04:14 -0500 (EST)
>
>
>>         byte nslots;
>>         __u8 short slot_tablelen;
>          ^^^^ ^^^^^
>
>As Willi said, the error is above and you will have to figure out or
>ask the maintainer what the intended type for slot_tablelen was in
>this struct.  Look to see if there is a maximum size defined somewhere.
>
>>         __u8 nslots;
>>         __u16 slot_tablelen;
>> };
>> 
Ha the solution stand in 2.4.21: __u16

Thanks,
    Joel


*********************************************
Vous surfez toujours avec une ligne classique ?
Faites des economies avec Tiscali Complete...
Plus d'info sur ... http://complete.tiscali.be
