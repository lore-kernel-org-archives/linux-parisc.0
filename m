Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from post.webmailer.de (natpost.webmailer.de [192.67.198.65])
	by dsl2.external.hp.com (Postfix) with ESMTP id 574A3482A
	for <parisc-linux@lists.parisc-linux.org>; Sat, 15 Dec 2001 10:23:21 -0700 (MST)
Received: from computer (pec-152-222.tnt8.b2.uunet.de [149.225.152.222])
	by post.webmailer.de (8.9.3/8.8.7) with ESMTP id SAA25235
	for <parisc-linux@lists.parisc-linux.org>; Sat, 15 Dec 2001 18:23:19 +0100 (MET)
Date: Sat, 15 Dec 2001 19:34:48 +0100
From: Joerg Hartmann <J.Hartmann@reinarts.de>
Reply-To: Joerg Hartmann <J.Hartmann@reinarts.de>
Message-ID: <861152294541.20011215193448@reinarts.de>
To: PARISC Linux List <parisc-linux@lists.parisc-linux.org>
Subject: Re[2]: [parisc-linux] gcc on 0.9.3 iso problem
In-Reply-To: <20011215161646.GX1515@tausq.org>
References: <561134811041.20011215144325@reinarts.de>
 <20011215161646.GX1515@tausq.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
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

>> hp-tux:/usr/src/samba-2.2.2/source# ./configure
>> creating cache ./config.cache
>> checking for gcc... gcc
>> checking whether the C compiler (gcc -O  ) works... no
>> configure: error: installation or configuration problem:
>>            C compiler cannot create executables.

RC> Look for a config.log file in the directory. The log should show what is
RC> wrong.

The problem is a missing "crt1.o"

# gcc -o conftest -O    conftest.c  1>&5
/usr/bin/ld: cannot open crt1.o: No such file or directory
collect2: ld returned 1 exit status

I have the same error with hello_world.c .
As i am not a c-coder this i a real problem for me ...
I know this is not PA-RISC Linux specific nor is it samba specific.
It's just a problem with the gcc from the 0.9.3 ISO (i think).

Maybe someone can explain, what i am doing wrong here ?
I have installed gcc from the CD with "apt-get install gcc"
and i thought it has been installed with all the files it depends on,
because there was no error message while i was doing it.

-- 
Best regards,
 Joerg                            J.Hartmann@reinarts.de
