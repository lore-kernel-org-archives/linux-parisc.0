Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from smtp-out.tiscali.be (spoolm2.tiscalinet.be [212.35.2.51])
	by dsl2.external.hp.com (Postfix) with ESMTP id 0A676482B
	for <parisc-linux@lists.parisc-linux.org>; Fri, 22 Nov 2002 10:00:56 -0700 (MST)
Date: Fri, 22 Nov 2002 18:00:41 +0100
Message-ID: <3DAAAD460000417C@ocpmta1.be.tiscali.com>
In-Reply-To: <200211211605.gALG5IFM000465@hiauly1.hia.nrc.ca>
From: jsoe0708@tiscali.be
Subject: Re: [parisc-linux] glibc + SuSE (When email becomes to much)
To: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Cc: carlos@baldric.uwo.ca, parisc-linux@lists.parisc-linux.org
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
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

Hello Dave,

>> -DL_divI -xassembler-with-cpp -c /Develop/parisc-linux/src/gcc/gcc/config/pa/milli64.S
>> -o libgcc/./_divI.o
>> /Develop/parisc-linux/build/gcc/gcc/collect2: /lib/libc.so.6: version
`GLIBC_2.3'
>> not found (required by /Develop/parisc-linux/build/gcc/gcc/collect2)
>> make[2]: *** [libgcc/./_divI.oS] Error 1
>> make[2]: Leaving directory `/Develop/parisc-linux/build/gcc/gcc'
>> make[1]: *** [libgcc.a] Error 2
>> make[1]: Leaving directory `/Develop/parisc-linux/build/gcc/gcc'
>> make: *** [all-gcc] Error 2
>> 
>> ### Wed Nov 20 18:54:33 2002 ###
>> 
>> So it seems that it did not get the right path to the libc.so?
>
>Set LD_LIBRARY_PATH to include the directory where your new libc is.
>You may also want to set the GCC LIBRARY_PATH environment variable.
>
[Sorry I was cut from Internet for a long time]

But I also thought to add "LD_LIBRARY_PATH=$DEST/hppa-linux/lib" where is
located the new libc-2.3.1 and export but now the problem is into make:

make: /lib/ld.so.1: version 'GLIBC_PRIVATE' not found (required by /MyPath2/libc.so.6)

Do I wrongly build glibc or install?

Thanks again,
    Joel


********************************************************************************
Controlez mieux votre consommation Internet...surfez Tiscali Complete...http://tiscali.complete.be
