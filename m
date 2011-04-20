From: John David Anglin <dave@hiauly1.hia.nrc.ca>
Subject: Re: Notes about the latest cache patches
Date: Wed, 20 Apr 2011 10:17:03 -0400
Message-ID: <20110420141703.GA11761@hiauly1.hia.nrc.ca>
References: <1302889310.7706.8.camel@mulgrave.site>
Reply-To: John David Anglin <dave.anglin@nrc-cnrc.gc.ca>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Cc: Parisc List <linux-parisc@vger.kernel.org>
To: James Bottomley <James.Bottomley@HansenPartnership.com>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <1302889310.7706.8.camel@mulgrave.site>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On Fri, 15 Apr 2011, James Bottomley wrote:

> I find that the combination of the two patches cures all the segfaults
> I've been seeing in normal compiles and git operations.

In testing, I haven't had any segfaults but there have been a couple
of hpmcs while running the libgomp testsuite.  This tests quite extensively
the LWS code.

I caught on hpmc in flush_instruction_cache_local:

0000000040101184 <flush_instruction_cache_local>:
    40101184:   00 00 58 20     mtsp r0,sr1
    40101188:   20 3b f8 08     ldil L%404f7800,r1
    4010118c:   34 21 03 a0     ldo 1d0(r1),r1
    40101190:   50 3a 00 20     ldd 10(r1),r26
    40101194:   50 39 00 30     ldd 18(r1),r25
    40101198:   50 38 00 40     ldd 20(r1),r24
    4010119c:   50 37 00 50     ldd 28(r1),r23
    401011a0:   00 01 0e 76     rsm 1,r22
    401011a4:   a6 ff a0 28     addib,*= -1,r23,401011c0 <fioneloop>
    401011a8:   cb f7 40 32     movb,<,n r23,r31,401011c8 <fisync>

00000000401011ac <fimanyloop>:
    401011ac:   af ff ff f5     addib,*> -1,r31,401011ac <fimanyloop>
    401011b0:   07 40 42 c0     fice r0(sr1,r26)
    401011b4:   07 59 42 e0     fice,m r25(sr1,r26)
    401011b8:   cb f7 9f dd     movb,tr r23,r31,401011ac <fimanyloop>
    401011bc:   a7 1f e0 0a     addib,*<=,n -1,r24,401011c8 <fisync>

00000000401011c0 <fioneloop>:
    401011c0:   af 1f ff f5     addib,*> -1,r24,401011c0 <fioneloop>
=>  401011c4:   07 59 42 e0     fice,m r25(sr1,r26)

00000000401011c8 <fisync>:
    401011c8:   00 00 04 00     sync
    401011cc:   00 16 18 60     mtsm r22
    401011d0:   e8 40 c0 00     bv r0(rp)
    401011d4:   08 00 02 40     nop

Dave
-- 
J. David Anglin                                  dave.anglin@nrc-cnrc.gc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6602)

PROCESSOR PIM INFORMATION

Original Product Number:  A7136A
Current Product Number:   A7136A


-----------------  Processor 0 HPMC Information - PDC Version: 46.34  ------

Timestamp =   Wed Apr  20 11:57:24 GMT 2011    (20:11:04:20:11:57:24)

HPMC Chassis Codes

       Chassis Code        Extension
       ------------        ---------
       0xe800035c00e00000 0x00000000401011c4
       0x57000f7300e00000 0x8400000000800000
       0xf600105e00e00000 0xfffffff0f0c00000
       0x140003b200e00000 0x000000000000000b
       0x5600100b00e00000 0x0000000000000194
       0x5600106400e00000 0xfffffff0f0435110

General Registers 0 - 31
00-03  0000000000000000  00000000404f79d0  000000004011c1e8  00000000405cbe40
04-07  0000000040613d80  0000000000000000  000000000800000f  000000027bed5080
08-11  0000000040462d98  0000000000000000  00000002bf9c6540  0000000000000001
12-15  000000027be61980  000000007d65d240  0000000000000002  000000000000005e
16-19  0000000040623d80  0000000040623d80  000000004051c8fc  00000000ffffffff
20-23  0000000000000000  ffffffffffffffff  000000000800000e  0000000000000000
24-27  000000000000d2f8  0000000000000080  0000000001968380  0000000040613d80
28-31  0000000000000000  0000000172d6ca80  0000000172d6cab0  0000000000000000

Control Registers 0 - 31
00-03  0000000000000000  0000000000000000  0000000000000000  0000000000000000
04-07  0000000000000000  0000000000000000  0000000000000000  0000000000000000
08-11  0000000000003b5e  0000000000000000  00000000000000c0  0000000000000020
12-15  0000000000000000  0000000000000000  0000000000103000  ffe0000000000000
16-19  00006437fdcb5220  0000000000000000  00000000401011c4  00000000075942e0
20-23  0000000015340006  000000005a168380  000000ff080cff0e  8000000000000000
24-27  0000000000573000  000000027fb92000  fffdffffffdfffef  0000000040002780
28-31  0000000040001540  ffffffffffffff7f  0000000172d6c000  886904b488140042


Space Registers 0 - 7
00-03  0000000000ed7000  0000000000000000  0000000000000000  0000000000ed7800
04-07  0000000000000000  0000000000000000  0000000000000000  0000000000000000


IIA Space (back entry)       = 0x0000000000000000
IIA Offset (back entry)      = 0x00000000401011c0
Check Type                   = 0x00000000
Cpu State                    = 0x9e000000
Cache Check                  = 0x00000000
TLB Check                    = 0x00000000
Bus Check                    = 0x00000000
Assists Check                = 0x00ed7800
Assist State                 = 0x00000000
Path Info                    = 0x00000000
System Responder Address     = 0x0000000000000000
System Requestor Address     = 0x0000000000000000

Floating Point Registers 0 - 31
00-03  0000000000000000  0000000000000000  0000000000000000  0000000000000000
04-07  0000000000000000  0000000000000000  0000000000000001  4090000000000000
08-11  0000000000032000  0000000040662000  0000000040613d80  0000000040662000
12-15  00000001c0000000  000000004062e580  0000000000000000  0000000040661340
16-19  0000000000000000  0000000040501680  00000000401fb5c0  000000007f0b4000
20-23  00000000401ad2c0  0000000000000000  0000000000000070  0000000000000000
24-27  0000000000000000  0000000000000000  0000000000000000  000000007f08c3a0
28-31  000000004051c1dc  000000000000002f  00000000405b2274  00000000405b2248

PIM Revision                 = 0x0000000000000001
CPU ID                       = 0x0000000000000014
CPU Revision                 = 0x0000000000000031
Cpu Serial Number            = 0x46100b89e43f0503
Check Summary                = 0x8400000000800000
SAL Timestamp                = 0x000000004daeca24
System Firmware Rev.         = 0x00000ba20000121a
PDC Relocation Address       = 0xfffffff0f0c00000
Available Memory             = 0x000000027fe00000
CPU Diagnose Register 2      = 0x3112022000002008
MIB_STAT                     = 0x0000000000000000
MIB_LOG1                     = 0x0000000000555500
MIB_LOG2                     = 0x0000800000000000
MIB_ECC_DATA                 = 0x808800007fffbfd8
ICache Info                  = 0x0000000000000000
DCache Info                  = 0x0000000000000000
Sharedcache Info1            = 0x0800000000440000
Sharedcache Info2            = 0x00000000000000c0
MIB_RSLOG1                   = 0x0000008000000104
MIB_RSLOG2                   = 0x0021010000000000
MIB_RQLOG                    = 0x0045200000082600
MIB_REQLOGa                  = 0x8004520000008200
MIB_REQLOGb                  = 0xc10008a400000100
Reserved                     = 0x0000000000000000
Cache Repair Detail          = 0x0000000000000000

PIM Detail Text:
