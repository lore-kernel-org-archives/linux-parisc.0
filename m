Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from viefep13-int.chello.at (viefep13-int.chello.at [213.46.255.15])
	by dsl2.external.hp.com (Postfix) with ESMTP id 259FD4829
	for <parisc-linux@lists.parisc-linux.org>; Sat, 14 Sep 2002 04:14:58 -0600 (MDT)
Date: Sat, 14 Sep 2002 12:14:53 +0200
Subject: Re: [parisc-linux] Making SYM2 default SYM-SCSI driver instead of SYM1 
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Mime-Version: 1.0 (Apple Message framework v543)
Cc: parisc-linux@lists.parisc-linux.org
To: Grant Grundler <grundler@dsl2.external.hp.com>
From: Thibaut VARENE <varenet@esiee.fr>
In-Reply-To: <20020913190929.8F8084829@dsl2.external.hp.com>
Message-Id: <CFEA4CE8-C7CA-11D6-BDC5-0030656F07A2@esiee.fr>
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

Le vendredi, 13 sep 2002, =E0 21:09 Europe/Paris, Grant Grundler a =E9crit=
 :

> Thibaut VARENE wrote:
>> Now I'm asking you to know if anybody has an objection against making
>> SYM2 the default driver in debian-configs instead of old SYM1.
>
> I don't. All the boxes I care about have 53c8xx chips in them.
>
> A slightly safer approach is to make sym2 the default for PA2.0 =
systems
> and the old sym the default for PA1.1 systems. But GSC/HSC c720 cards
> don't fit that model since they go into systems with either sub-arch.
> I don't see a way around users "tuning" based on actual HW=20
> configuration.
Well, this might be a good solution, though IIRC, Randolph Chung=20
mentioned
that sym1 is b0rken in Linux 2.5.

Therefore making sym2 default for both archs may be preferable for=20
future compatibility?

Anyway, I think we can start with making sym2 default for PA2.0,=20
keeping sym1 for PA1.1,
and then "wait and see".

If everything goes well, we can switch PA1.1 as well.

Opinions ? :)


Thibaut VARENE
PA/Linux ESIEE Team
http://pateam.esiee.fr/=
