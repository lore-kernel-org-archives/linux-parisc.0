Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from smtp-out.tiscali.be (spoolm2.tiscalinet.be [212.35.2.51])
	by dsl2.external.hp.com (Postfix) with ESMTP id 9D22A4829
	for <parisc-linux@lists.parisc-linux.org>; Tue,  7 Jan 2003 00:23:47 -0700 (MST)
Date: Tue, 7 Jan 2003 08:23:37 +0100
Message-ID: <3DED9A660000447F@ocpmta3.freegates.net>
In-Reply-To: <200301070054.h070rc5k047346@smtp.monmouth.com>
From: jsoe0708@tiscali.be
Subject: Re: [parisc-linux] kernel panic when extracting large tar files
To: "Vlad D. Markov" <markov@monmouth.com>
Cc: parisc-linux@lists.parisc-linux.org
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

>-- Original Message --
>From: "Vlad D. Markov" <markov@monmouth.com>
>To: jsoe0708@tiscali.be
>Subject: Re: [parisc-linux] kernel panic when extracting large tar files=

>Date: Mon, 6 Jan 2003 19:52:40 -0500
>
>
>Did not want to send the file to the whole group.
>
You would :-)
>
>On Monday 06 January 2003 04:02 am, you wrote:
>> >When I extract large tar files on my 735/99 (tar --numeric-owner -xzv=
pf
>>
>> ),
>>
>> >the kernel panics and I get a core dump.
>>
>> Interesting, can you explain me how do you grab this coredump?
>>
>> >My kernel is: Linux version 2.4.20-pa18 (root@grumpy) (gcc version 3.=
0.4)
>> >#22
>> >Fri Dec 27 21:25:37 EST 2002
>> >
>> >I saved a capture from minicom and have not upgraded the kernel since=
.
>>
>> Firstly the minicom capture, would already tell more :)
>>
>> Greetings,
>>     Joel
>>

Well I am not an expert but just notice what seems to me the most importa=
nt:
Trap 5 on CPU 0

     YZrvWESTHLNXBCVMcbcbcbcbOGFRQPDI
PSW: 00000000000001100000000000001111 Not tainted
r00-03  00000000 10102800 10155b54 1d7dcf20
r04-07  103f6dd4 1d7dc020 1d7dc000 000000f0
r08-11  00000001 00000400 274bb3c0 00000000
r12-15  2748c5d0 00000001 27603b80 101464a0
r16-19  10130820 1030b10c 00000000 00000001
r20-23  00000000 1d7dcf20 00000000 00000000
r24-27  0000005c 00000000 1d7dcf20 102f6010
r28-31  1d7dcec0 00000e40 2748cac0 10135e14
sr0-3   00000000 00000104 00000000 00000104
sr4-7   00000000 00000000 00000000 00000000

IASQ: 00000000 00000000 IAOQ: 101028a8 101028ac
 IIR: 6ab60038    ISR: 00000000  IOR: 1d7dcf3c
 CPU:        0   CR30: 2748c000 CR31: 103b0000
 ORIG_R28: 103ab810
Trap 5 on CPU 0

     YZrvWESTHLNXBCVMcbcbcbcbOGFRQPDI
PSW: 00000000000001101111111100001111 Not tainted
r00-03  00000000 102f8cb0 10108064 1d7dcf20
r04-07  103f6dd4 1d7dc020 1d7dc000 000000f0
r08-11  00000001 00000400 274bb3c0 00000000
r12-15  2748c5d0 00000001 27603b80 101464a0
r16-19  2748cac0 1030b10c 00000000 90000000
r20-23  00000000 0000000e 10254110 48809600
r24-27  f0825100 00000016 103f52a0 102f6010
r28-31  00000000 000003de 2748cd00 10105134
sr0-3   00000000 00000104 00000000 00000104
sr4-7   00000000 00000000 00000000 00000000

IASQ: 00000000 00000000 IAOQ: 10108068 1010806c
 IIR: 22643206    ISR: 00000000  IOR: 10309800
 CPU:        0   CR30: 2748c000 CR31: 103b0000
 ORIG_R28: 00000000
...
Trap 5 on CPU 0

     YZrvWESTHLNXBCVMcbcbcbcbOGFRQPDI
PSW: 00000000000001001111111100001111 Not tainted
r00-03  00000000 1030612c 10108064 1d7dcf20
r04-07  103f6dd4 1d7dc020 1d7dc000 000000f0
r08-11  00000001 00000400 274bb3c0 00000000
r12-15  2748c5d0 00000001 27603b80 101464a0
r16-19  274e9100 1030b10c 00000000 90000000
r20-23  00000000 00000001 b0324889 0000dbae
r24-27  00000001 00000064 10306420 102f6010
r28-31  00000000 00000232 274e9340 10125200
sr0-3   00000000 00000104 00000000 00000104
sr4-7   00000000 00000000 00000000 00000000

IASQ: 00000000 00000000 IAOQ: 10108068 1010806c
 IIR: 22643206    ISR: 00000000  IOR: 10309800
 CPU:        0   CR30: 2748c000 CR31: 103b0000
 ORIG_R28: 103bf23f
Trap 5 on CPU 0

     YZrvWESTHLNXBCVMcbcbcbcbOGFRQPDI
PSW: 00000000000001101111111100001111 Not tainted
r00-03  00000000 1030612c 10108064 1d7dcf20
r04-07  103f6dd4 1d7dc020 1d7dc000 000000f0
r08-11  00000001 00000400 274bb3c0 00000000
r12-15  2748c5d0 00000001 27603b80 101464a0
r16-19  274e9340 1030b10c 00000000 90000000
r20-23  00000000 00000001 b507ebf3 0000dbff
r24-27  00000001 00000064 10306420 102f60=FF

which say that is a trap 5 (ie a LPMC). So, may me am i wrong, but it see=
ms
that there is a hardware problem on this machine?

AFAIK to analyse this kind of problem would be to re-install (may be a te=
mporary
external disk) hp-ux and mainly DIAGTOOLS.

On my own a run 2.4.20-pa18 (2.4.21-pre2-pa18) (compiled with same gcc)
without problem on a b180 and b2k (excepted with PDC on this last).

But again I am not expert so I made ml in CC.

Cheers,
    Joel


********************************************
Promo Tiscali ADSL: 35 Euros/mois, 1er mois et activation =3D 0 Euro http=
://adsl.tiscali.be
