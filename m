Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from smtp-out.tiscali.be (spoolm2.tiscalinet.be [212.35.2.51])
	by dsl2.external.hp.com (Postfix) with ESMTP id 6DB8B4829
	for <parisc-linux@lists.parisc-linux.org>; Tue, 26 Nov 2002 10:02:24 -0700 (MST)
Date: Tue, 26 Nov 2002 18:02:15 +0100
Message-ID: <3DAAAD4600004A6B@ocpmta1.be.tiscali.com>
In-Reply-To: <20021126162938.GX21187@tausq.org>
From: jsoe0708@tiscali.be
To: "Randolph Chung" <randolph@tausq.org>
Cc: parisc-linux@lists.parisc-linux.org
MIME-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"
Subject: [parisc-linux] Re: uaccess ya patch
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

>> Much more for info, here is another way I found to implement __put_?_asm64.
>
>Joel, the __*_bad stuff is fine, but why do you want to rewrite the
>asm64 functions as macros? you are also not doing it correctly:
>
>> +#define __put_user_asm64(x, ptr)		\
>> +	__asm__ __volatile__ (			\
>> +		"\n1:\tstw\t%2,0(%%sr3,%1)\n"	\
>> +		"2:\tstw\t%R2,4(%%sr3,%1)\n"	\
>                  ^^^ this will cause very bad things to happen.

It was much more to mentionned that in asm extension of gcc for hppa it exists
also a way to address the second word (what I tried to find for a long) of
a long long via the 'R' prefix as here in '%R2' [is it what you want to say
'will cause bad things'?]

(the macro was just beacuse the original __put_?_asm() was macro :) )

Well it has not more interest and for me you can forget it.

Thanks for your attention,
    Joel




********************************************************************************
Controlez mieux votre consommation Internet...surfez Tiscali Complete...http://tiscali.complete.be
