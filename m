Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from smtp-out.tiscali.be (spoolo2.tiscali.be [62.235.13.211])
	by dsl2.external.hp.com (Postfix) with ESMTP id 6BE494841
	for <parisc-linux@parisc-linux.org>; Sat,  8 Nov 2003 15:36:26 -0700 (MST)
Message-ID: <3FAD6FF8.80904@tiscali.be>
Date: Sat, 08 Nov 2003 22:36:40 +0000
From: Joel Soete <soete.joel@tiscali.be>
MIME-Version: 1.0
To: Carlos O'Donell <carlos@baldric.uwo.ca>
Cc: parisc-linux@parisc-linux.org, Matthew Wilcox <willy@debian.org>
Subject: Re: [parisc-linux] fork failed? protection id trap. All suspect.
References: <3F969FFE00005DB3@ocpmta2.freegates.net> <3FACE5A4.7070003@tiscali.be> <20031108155247.GC21080@systemhalted> <3FAD5C01.7040302@tiscali.be> <20031108220923.GK21080@systemhalted>
In-Reply-To: <20031108220923.GK21080@systemhalted>
Content-Type: text/plain; charset=us-ascii; format=flowed
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


Carlos O'Donell wrote:
> On Sat, Nov 08, 2003 at 09:11:29PM +0000, Joel Soete wrote:
[...]
>>
>>request_module[net-pf-10]: fork failed, errno 1
>>evolution (pid 879): Protection id trap (code 27)
>>
>>     YZrvWESTHLNXBCVMcbcbcbcbOGFRQPDI
>>PSW: 00000000000001000000000000001111 Not tainted
>>r00-03  00000000 103b7524 1015352c 00282b28
>>r04-07  00000000 00000000 00000001 11f27da0
>>r08-11  00000000 00000001 13084548 fffffff2
>>r12-15  419ee608 419ee718 419345a8 419345a8
>>r16-19  419ee608 419345a8 00000070 1371d000
>>r20-23  00000000 00000002 00282b2e 00000000
>>r24-27  11f27da0 00000000 10d0b520 10304010
>>r28-31  00000000 10314a60 130845c0 101532c8
>>sr0-3   00000000 00000000 00000000 00000003
>>sr4-7   00000000 00000000 00000000 00000000
>>
>>IASQ: 00000000 00000000 IAOQ: 10153658 1015365c
>> IIR: 0ed4d240    ISR: 00000003  IOR: 00282b2e
>> CPU:        0   CR30: 13084000 CR31: 103a8000
>> ORIG_R28: 419345a8
>>
>>----------><----------
> 
> 
> I've never seen this perhaps some kernelish people would like to comment
> on this?
> 
it is also possible that my merge broken something (but not enough time 
to check with original cvs, compiling a kernel with c110 is a long job :( )

btw i will try to see how (where) attaching "the thread that is going to 
die."

Thanks a lot,
	Joel
