Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from cpout2.tiscali.be (cpout2.tiscali.be [62.235.13.194])
	by dsl2.external.hp.com (Postfix) with ESMTP id 9DBAB482B
	for <parisc-linux@lists.parisc-linux.org>; Thu, 10 Jul 2003 08:52:07 -0600 (MDT)
Date: Thu, 10 Jul 2003 16:52:04 +0200
Message-ID: <3F056E9500001C4E@ocpmta4.freegates.net>
In-Reply-To: <1057827531.3f0d2acb384bd@clients.latnet.lv>
From: "Joel Soete" <jsoe0708@tiscali.be>
Subject: Re: [parisc-linux] Corrections for RAID1 howto and Resyncing after failure
To: "dub" <dub@latnet.lv>, parisc-linux@lists.parisc-linux.org
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

Hi,

> You are right, autosearch was off. However, setting is on does not help,
even
> after powering off the system.
> 
> BR,
> Dub
> 
> 
> 
> Configuration Menu: Enter command > bi
> 
> BOOT INFORMATION
> 
>    Processor         Boot ID
>    ---------         -------
>        0                  2  
>        1                  2  
> 
>    Autoboot:             ON
>    Autosearch:           ON
>    Fastboot:             OFF
> 
>    Primary boot path:    10/0.1   (dec)
>                          0a/0.1   (hex)
>    Alternate boot path:  10/8.1   (dec)
>                          0a/08.1   (hex)

iirc if you launch 'boot alt' and ask to boot 'without interact with ipl'
it boots fine? If yes, i don't see why it doen't work (sorry).
(may be try to switch boot disks to be sure that the behaviour will not follow
the disk?)

Joel


------------------------------------------------------
Soldes Tiscali ADSL : 27,50 euros/mois jusque fin 2003.
On s'habitue vite à payer son ADSL moins cher!
Plus d'info? Cliquez ici... http://reg.tiscali.be/default.asp?lg=fr 
