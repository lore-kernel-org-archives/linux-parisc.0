Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from cpout2.tiscali.be (cpout2.tiscali.be [62.235.13.194])
	by dsl2.external.hp.com (Postfix) with ESMTP id 5C4EE482E
	for <parisc-linux@parisc-linux.org>; Mon,  4 Aug 2003 10:53:58 -0600 (MDT)
Date: Mon, 4 Aug 2003 18:53:54 +0200
Message-ID: <3F29178A00000CB4@ocpmta7.freegates.net>
In-Reply-To: <20030804151449.GS18508@security.hp.com>
From: "Joel Soete" <jsoe0708@tiscali.be>
Subject: Re: [parisc-linux] backport bitops.h stuff
To: lamont@hp.com
Cc: lamont@hp.com, "James Bottomley" <James.Bottomley@steeleye.com>,
	parisc-linux@parisc-linux.org
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

>>   int ret=0;
>>   __asm__(" ldi    31,%1\n"
>
>Make it say 32,%1...  Mistake in understanding things on my part...


Yes,

the following code:

int fastffs(int x)
{
  int ret=0;
  if (x)
    __asm__(" ldi    32,%1\n"
      " extru,<>  %0,31,16,%%r0\n"
      " extru,TR  %0,15,16,%0\n"
      " addi    -16,%1,%1\n"
      " extru,<>  %0,31,8,%%r0\n"
      " extru,TR  %0,23,8,%0\n"
      " addi    -8,%1,%1\n"
      " extru,<>  %0,31,4,%%r0\n"
      " extru,TR  %0,27,4,%0\n"
      " addi    -4,%1,%1\n"
      " extru,<>  %0,31,2,%%r0\n"
      " extru,TR  %0,29,2,%0\n"
      " addi    -2,%1,%1\n"
      " extru,=  %0,31,1,%%r0\n"
      " addi    -1,%1,%1\n"
      : "=r" (x), "=r" (ret)
      : "0" (x), "1" (ret));

  return ret;
}

give now the same results as generic_ffs:

fastffs(0)==0
generic_ffs(0)==0

fastffs(1)==1
generic_ffs(1)==1

fastffs(2)==2
generic_ffs(2)==2

fastffs(3)==1
generic_ffs(3)==1

fastffs(4)==3
generic_ffs(4)==3

fastffs(5)==1
generic_ffs(5)==1

fastffs(10)==2
generic_ffs(10)==2

fastffs(20)==3
generic_ffs(20)==3

fastffs(40)==4
generic_ffs(40)==4

fastffs(80)==5
generic_ffs(80)==5

fastffs(160)==6
generic_ffs(160)==6

fastffs(320)==7
generic_ffs(320)==7

fastffs(640)==8
generic_ffs(640)==8

fastffs(1280)==9
generic_ffs(1280)==9

fastffs(2560)==10
generic_ffs(2560)==10

fastffs(5120)==11
generic_ffs(5120)==11

fastffs(10240)==12
generic_ffs(10240)==12

fastffs(20480)==13
generic_ffs(20480)==13

fastffs(40960)==14
generic_ffs(40960)==14

fastffs(81920)==15
generic_ffs(81920)==15

fastffs(163840)==16
generic_ffs(163840)==16

fastffs(327680)==17
generic_ffs(327680)==17

fastffs(655360)==18
generic_ffs(655360)==18

fastffs(1310720)==19
generic_ffs(1310720)==19

fastffs(2621440)==20
generic_ffs(2621440)==20

fastffs(5242880)==21
generic_ffs(5242880)==21

fastffs(10485760)==22
generic_ffs(10485760)==22

fastffs(20971520)==23
generic_ffs(20971520)==23

fastffs(41943040)==24
generic_ffs(41943040)==24

fastffs(83886080)==25
generic_ffs(83886080)==25

fastffs(167772160)==26
generic_ffs(167772160)==26

fastffs(335544320)==27
generic_ffs(335544320)==27

fastffs(671088640)==28
generic_ffs(671088640)==28

fastffs(1342177280)==29
generic_ffs(1342177280)==29

fastffs(-1610612736)==30
generic_ffs(-1610612736)==30

fastffs(1073741824)==31
generic_ffs(1073741824)==31

fastffs(-2147483648)==32
generic_ffs(-2147483648)==32


Great job. If everybody agreed could you ci (I have no cvs ci access).
Or do you need a more accurate patch?

Thanks,
    Joel


------------------------------------------------------
Soldes Tiscali ADSL : 27,50 euros/mois jusque fin 2003.
On s'habitue vite à payer son ADSL moins cher!
Plus d'info? Cliquez ici... http://reg.tiscali.be/default.asp?lg=fr 
