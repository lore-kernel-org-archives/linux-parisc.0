Return-Path: <varenet@esiee.fr>
Received: from mail.esiee.fr (mail.esiee.fr [147.215.1.3])
	by dsl2.external.hp.com (Postfix) with ESMTP id 3BAF1484B
	for <parisc-linux@lists.parisc-linux.org>;
	Fri, 19 Dec 2003 04:17:40 -0700 (MST)
Date: Fri, 19 Dec 2003 12:17:35 +0100
Subject: Re: [parisc-linux] Compiling Kernel for HP 9000/800/A400-44
Content-Type: text/plain; delsp=yes; charset=ISO-8859-1; format=flowed
Mime-Version: 1.0 (Apple Message framework v553)
To: Herbert Poetzl <herbert@13thfloor.at>
From: =?ISO-8859-1?Q?Thibaut_VAR=C8NE?= <varenet@esiee.fr>
In-Reply-To: <20031219022800.GA8847@MAIL.13thfloor.at>
Message-Id: <F2577FA8-3214-11D8-BAB6-0030656F07A2@esiee.fr>
Cc: Grant Grundler <grundler@parisc-linux.org>,
	parisc-linux@lists.parisc-linux.org
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>


Le vendredi, 19 d=E9c 2003, =E0 03:28 Europe/Paris, Herbert Poetzl a =
=E9crit :
>
>> You'll need to grab the gcc-hppa64 compiler from:=09
>>    =20
>> ftp://ftp.parisc-linux.org/unofficial-debs/gcc-hppa64_3.0.4ds3-=20
>> 7.1_hppa.deb
>
> hmm, is there a source available somewhere ...
> (I don't like binary only packages)

If you really want to waste your time in building a cross compiler by =20=

yourself, going through
the various pain of this process, just follow the recipe here:

http://www.fr.parisc-linux.org/toolchain/PARISC-Linux-XC-HOWTO.html

HTH,


Thibaut VARENE
The PA/Linux ESIEE Team
http://www.pateam.org/

PS: i know what i'm talking about, regarding pain, i'm the guy who made =20=

that "binary only" package :P=
