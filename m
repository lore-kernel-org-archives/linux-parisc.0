Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from mail.esiee.fr (mail.esiee.fr [147.215.1.3])
	by dsl2.external.hp.com (Postfix) with ESMTP id 4786D4856
	for <parisc-linux@lists.parisc-linux.org>; Fri, 26 Sep 2003 11:15:38 -0600 (MDT)
Date: Fri, 26 Sep 2003 19:15:29 +0200
Subject: Re: [parisc-linux] kernel error message.
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Mime-Version: 1.0 (Apple Message framework v552)
Cc: Randolph Chung <randolph@tausq.org>, mlist@zinkens.net,
	parisc-linux@lists.parisc-linux.org
To: Grant Grundler <grundler@parisc-linux.org>
From: =?ISO-8859-1?Q?Thibaut_VAR=C8NE?= <varenet@esiee.fr>
In-Reply-To: <20030926164139.GA11759@dsl2.external.hp.com>
Message-Id: <076D6328-F045-11D7-A569-0030656F07A2@esiee.fr>
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

http://pateam.esiee.fr/ has been running apache on 2.4.18-pa45 for=20
years now
(see http://uptime.netcraft.com/up/graph/?host=3Dmkhppa1.esiee.fr )
and no problem have ever been experienced...

you can check the load on the website...

HTH


Thibaut VARENE
The PA/Linux ESIEE Team
http://pateam.esiee.fr/

Le vendredi, 26 sep 2003, =E0 18:41 Europe/Paris, Grant Grundler a =E9crit=
 :

> On Fri, Sep 26, 2003 at 12:03:29AM -0700, Randolph Chung wrote:
>> Your apache is crashing randomly :( I think mkp said he was seeing=20
>> this
>> problem as well and was trying to debug it.
>
> I haven't been seeing that with either apache or apache2.
>
> On a500 (64-bit, 2.4.21-pa6) running testing:
> ii  apache         1.3.27.0-2     Versatile, high-performance HTTP=20
> server
>
> On c3k (32-bit, 2.4.22-pa7) running testing:
> ii  apache2-common 2.0.47-1       Next generation, scalable,=20
> extendable web se
> ii  apache2-mpm-pr 2.0.47-1       Traditional model for Apache2
>
> Neither is heavily loaded but can see bursts of load at times.
>
> hth,
> grant
> _______________________________________________
> parisc-linux mailing list
> parisc-linux@lists.parisc-linux.org
> http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
>
