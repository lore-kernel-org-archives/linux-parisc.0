Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from mail.latnet.lv (mail.latnet.lv [159.148.108.208])
	by dsl2.external.hp.com (Postfix) with SMTP id 6DF85482B
	for <parisc-linux@lists.parisc-linux.org>; Thu, 10 Jul 2003 02:58:52 -0600 (MDT)
To: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] Corrections for RAID1 howto and Resyncing after failure
Message-ID: <1057827531.3f0d2acb384bd@clients.latnet.lv>
Date: Thu, 10 Jul 2003 11:58:51 +0300 (EEST)
From: dub <dub@latnet.lv>
References: <3F05718600000A59@ocpmta8.freegates.net>
In-Reply-To: <3F05718600000A59@ocpmta8.freegates.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=KOI8-R
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
> do you well set autosearch on ?
> Have a look at boot prompt: co bootinfo?
> 
> hth,
>     Joel

Hi,

You are right, autosearch was off. However, setting is on does not help, even
after powering off the system.

BR,
Dub



Configuration Menu: Enter command > bi

BOOT INFORMATION

   Processor         Boot ID
   ---------         -------
       0                  2  
       1                  2  

   Autoboot:             ON
   Autosearch:           ON
   Fastboot:             OFF

   Primary boot path:    10/0.1   (dec)
                         0a/0.1   (hex)
   Alternate boot path:  10/8.1   (dec)
                         0a/08.1   (hex)
   Console path:         10/4/0.0   (dec)
                         0a/04/0.0   (hex)
   Keyboard path:        10/12/7.0   (dec)
                         0a/0c/07.0   (hex)

   LAN Station Address:  080009-da4488

   Thu Jul  10 08:53:10 GMT 2003    (20:03:07:10:08:53:10)
