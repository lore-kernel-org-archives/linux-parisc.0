From: John David Anglin <dave@hiauly1.hia.nrc.ca>
Subject: Re: Testing Linux 2.6.39-rc's on rp3440
Date: Mon, 16 May 2011 19:44:50 -0400
Message-ID: <20110516234450.GA19484@hiauly1.hia.nrc.ca>
References: <20110514173357.GA8138@hiauly1.hia.nrc.ca> <20110515151820.GA12449@hiauly1.hia.nrc.ca>
Reply-To: John David Anglin <dave.anglin@nrc-cnrc.gc.ca>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
To: linux-parisc@vger.kernel.org
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <20110515151820.GA12449@hiauly1.hia.nrc.ca>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

I noticed one further thing about these hpmcs.  There seems to be
a relationship between the exception address recorded in cr21 and
the address used in the faulting instruction.  I have seen this in
at least four hpmcs, including the lba_pat_out8 one posted previously
to the list.  Here is one from yesterday:

-----------------  Processor 1 HPMC Information - PDC Version: 46.34  ------ 

Timestamp =   Sun May  15 18:52:36 GMT 2011    (20:11:05:15:18:52:36)

HPMC Chassis Codes

       Chassis Code        Extension
       ------------        ---------
       0xe800035c00e00000 0x00000000403140c0
       0x57000f7300e00000 0x8040004000000000
       0x5600100b00e00000 0x0000000000000194
       0x5600106400e00000 0xfffffff0f0436fc0


General Registers 0 - 31
00-03  0000000000000000  0000000040622080  00000000403189b0  00000000405c64b0
04-07  0000000040614080  0000000000000000  00000000404e8100  000000007f1048d0
08-11  0000000000000001  0000000000000100  000000007f0b1020  0000000000200200
12-15  000000004062e880  0000000040622080  000000007f0b1420  000000007f0b1820
16-19  000000007f0b1c20  0000000000000001  0000000040622080  000000007f1047f8
20-23  ffe0000000000000  ffffffffffffffff  000000004058d110  8000000000000000
24-27  0000000100028109  0000000000000001  00000000405c64b0  0000000040614080
28-31  0000000004082001  000000007f104970  000000007f1049a0  0000000004082000

Control Registers 0 - 31
00-03  0000000000000000  0000000000000000  0000000000000000  0000000000000000
04-07  0000000000000000  0000000000000000  0000000000000000  0000000000000000
08-11  0000000000000da6  0000000000000000  00000000000000c0  000000000000003f
12-15  0000000000000000  0000000000000000  0000000000103000  ffe0000000000000
16-19  000000d398385ff0  0000000000000000  00000000403140c0  000000000f80001c
20-23  00000000a607ffd0  0000000014082001  000000ff0804ff0f  0000000000000000
24-27  0000000000573000  000000003c11e000  ffffffffffffffff  0000000040002f80
28-31  0000000040002140  ffffffffffffffff  000000007f104000  ffffffffffffffff

Space Registers 0 - 7
00-03  0000000000369800  0000000000000000  0000000000000000  0000000000369800
04-07  0000000000000000  0000000000000000  0000000000000000  0000000000000000

IIA Space (back entry)       = 0x0000000000000000
IIA Offset (back entry)      = 0x00000000403140c4

Processor 1 was executing ldb in mem_serial_in:

00000000403140a8 <mem_serial_in>:
    403140a8:   43 5c 00 a2     ldb 51(r26),ret0
    403140ac:   53 5f 00 20     ldd 10(r26),r31
    403140b0:   01 7c 18 c0     mtsarcm ret0
    403140b4:   d7 99 00 00     depw,z r25,sar,32,ret0
    403140b8:   db 9c 0f e0     extrd,s ret0,63,32,ret0
    403140bc:   0b 9f 0a 1c     add,l r31,ret0,ret0
=>  403140c0:   0f 80 00 1c     ldb r0(ret0),ret0
    403140c4:   e8 40 d0 00     bve (rp)
    403140c8:   db 9c 0b f8     extrd,u ret0,63,8,ret0
    403140cc:   00 00 00 00     break 0,0

Note the address in $ret0 and the value in $cr21.  I'm thinking
some form of cache aliasing may be the cause.  The fault appears
related to an io space access.

Dave
-- 
J. David Anglin                                  dave.anglin@nrc-cnrc.gc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6602)
