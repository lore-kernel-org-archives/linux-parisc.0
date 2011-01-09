From: John David Anglin <dave@hiauly1.hia.nrc.ca>
Subject: Re: parisc: flush pages through tmpalias space
Date: Sun, 9 Jan 2011 16:52:07 -0500
Message-ID: <20110109215207.GA29305@hiauly1.hia.nrc.ca>
References: <1293034931.3019.8.camel@mulgrave.site>
Reply-To: John David Anglin <dave.anglin@nrc-cnrc.gc.ca>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="G4iJoqBmSsgzjUCe"
Cc: Parisc List <linux-parisc@vger.kernel.org>
To: James Bottomley <James.Bottomley@HansenPartnership.com>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <1293034931.3019.8.camel@mulgrave.site>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org


--G4iJoqBmSsgzjUCe
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, 22 Dec 2010, James Bottomley wrote:

> The kernel has an 8M tmpailas space (originally designed for copying
> and clearing pages but now only used for clearing).  The idea is
> to place zeros into the cache above a physical page rather than into
> the physical page and flush the cache, because often the zeros end up
> being replaced quickly anyway.
> 
> We can also use the tmpalias space for flushing a page.  The difference
> here is that we have to do tmpalias processing in the non access data and
> instruction traps.  The principle is the same: as long as we know the physical
> address and have a virtual address congruent to the real one, the flush will
> be effective.
> 
> In order to use the tmpalias space, the icache miss path has to be enhanced to
> check for the alias region to make the fic instruction effective.

Since I began testing this change, I have started seeing problems with the
console input on gsyprf11 and my rp3440.  If I HUP getty, the console works
for awhile and then stops working again.  Suspect the "INEQIVALENT ALIAS"
messages somehow kill the console.  I get a lot of these doing make check
for GCC from the tests that intentionally generate a segv to test exception
support.

I have also had at least one console related HPMC.  Analysis is attached.
I don't fully understand the actual cause of the HPMC (buffer overrun?).
The kernel was built with GCC 4.5.3.  The faulting instruction appears
to have the base and index interchanged, although this shouldn't affect
linux.  I thought this issue was fixed as a fair bit of work on this was
done in the middle-end.

I have to say that gsyprf11 running a SMP kernel built with 4.5.3 is
more stable with your change than it has been for a long time.

Dave
-- 
J. David Anglin                                  dave.anglin@nrc-cnrc.gc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6602)

--G4iJoqBmSsgzjUCe
Content-Type: text/plain; charset=us-ascii
Content-Disposition: attachment; filename="hpmc-jeb.txt"

Timestamp =   Mon Jan  3 08:35:03 GMT 2011    (20:11:01:03:08:35:03)

HPMC Chassis Codes

       Chassis Code        Extension
       ------------        ---------
     0xe800035c00e00000 0x000000004033fde8
     0x57000f7300e00000 0x8040004000000000
     0x5600100b00e00000 0x0000000000000194
     0x5600106400e00000 0xfffffff0f0435110


General Registers 0 - 31
00-03  0000000000000000  0000000040530a90  00000000403439ec  0000000040530b40
04-07  0000000040668a80  000000004061bd60  0000000000000000  0000000040530a60
08-11  0000000000000001  0000000040534080  0000000040530988  0000000000200200
12-15  0000000040677280  0000000040534100  00000000405fe0e0  00000000405fe4e0
16-19  00000000405fe8e0  00000000405fece0  0000000000000001  0000000040530988
20-23  0000000000000000  ffffffffffffffff  00000000405d7110  8000000000000000
24-27  0000000102208072  0000000000000001  000000004061bd60  0000000040668a80
28-31  0000000004082000  0000000040530b10  0000000040530b80  0000000000000000

Control Registers 0 - 31
00-03  0000000000000000  0000000000000000  0000000000000000  0000000000000000
04-07  0000000000000000  0000000000000000  0000000000000000  0000000000000000
08-11  0000000000000b12  0000000000000000  00000000000000c0  000000000000003f
12-15  0000000000000000  0000000000000000  0000000000103000  ffe0000000000000
16-19  00006827228e3750  0000000000000000  000000004033fde8  000000000f3c001c
20-23  00000000a607ffd0  0000000014082001  000000ff0804ff0f  0000000000000000
24-27  00000000005bd000  000000003ce22000  fffdffffffdfffef  0000000040000b80
28-31  0000000040000b80  ffffffffffffff7f  0000000040530000  886904b488140042

Space Registers 0 - 7
00-03  00000000002c4800  0000000000000000  0000000000000000  00000000002c4800
04-07  0000000000000000  0000000000000000  0000000000000000  0000000000000000


IIA Space (back entry)       = 0x0000000000000000
IIA Offset (back entry)      = 0x000000004033fdec
Check Type                   = 0x20000000
Cpu State                    = 0x9e000000
Cache Check                  = 0x00000000
TLB Check                    = 0x00000000
Bus Check                    = 0x00000000
Assists Check                = 0x002c4800
Assist State                 = 0x00000000
Path Info                    = 0x00000000
System Responder Address     = 0x0000000000000000
System Requestor Address     = 0x0000000000000000

Floating Point Registers 0 - 31
00-03  0000000000000000  0000000000000000  0000000000000000  0000000000000000
04-07  000f000000000000  0000000000000001  00000000406bd000  0000000040688000
08-11  00000000406bd000  0000000040668a80  0000000000000000  0000000040668a80
12-15  0000000000000000  0000000000000000  0000000000000000  0000000000000000
16-19  0000000000000000  0000000000000000  0000000000000000  0000000000000000
20-23  0000000000000000  0000000000000000  0000000000000000  000000000000000f
24-27  0000000000000000  0000000000000000  0000000000000000  ffffffffc0000000
28-31  000000000000002f  00000000405651cc  0000000000000001  0000000000000001

PIM Revision                 = 0x0000000000000001                
CPU ID                       = 0x0000000000000014
CPU Revision                 = 0x0000000000000031
Cpu Serial Number            = 0x46100b89e43f0503
Check Summary                = 0x8040004000000000
SAL Timestamp                = 0x000000004d218a37
System Firmware Rev.         = 0x00000ba20000121a
PDC Relocation Address       = 0xfffffff0f0c00000
Available Memory             = 0x000000027fe00000
CPU Diagnose Register 2      = 0x3112022000002008
MIB_STAT                     = 0x0040000000200000
MIB_LOG1                     = 0x0000000000555500
MIB_LOG2                     = 0x0000800000000000
MIB_ECC_DATA                 = 0x808800007fffbfd8
ICache Info                  = 0x0000000000000000
DCache Info                  = 0x0000000000000000
Sharedcache Info1            = 0x0000000000000000
Sharedcache Info2            = 0x00000000000000c0
MIB_RSLOG1                   = 0x0000000000000004
MIB_RSLOG2                   = 0x0000010000000000
MIB_RQLOG                    = 0x02921405fffe1510
MIB_REQLOGa                  = 0x8000000000000200
MIB_REQLOGb                  = 0x01000aa400000000
Reserved                     = 0x0000000000000000
Cache Repair Detail          = 0x0000000000000000

PIM Detail Text:

000000004033fdc8 <mem_serial_in>:
    4033fdc8:   08 03 02 41     copy r3,r1
    4033fdcc:   08 1e 02 43     copy sp,r3
    4033fdd0:   73 c1 00 88     std,ma r1,40(sp)
    4033fdd4:   43 5f 00 92     ldb 49(r26),r31
    4033fdd8:   53 5c 00 20     ldd 10(r26),ret0
    4033fddc:   01 7f 18 c0     mtsarcm r31
    4033fde0:   d7 39 00 00     depw,z r25,sar,32,r25
    4033fde4:   db 39 0f e0     extrd,s r25,63,32,r25
==> 4033fde8:   0f 3c 00 1c     ldb ret0(r25),ret0
    4033fdec:   34 7e 00 80     ldo 40(r3),sp
    4033fdf0:   e8 40 d0 00     bve (rp)
    4033fdf4:   53 c3 3f 8d     ldd,mb -40(sp),r3

r25 = 0000000000000001
r31 = 0000000000000000
ret0= 0000000004082000
rp  = 00000000403439ec

drivers/serial/8250.c:

static unsigned int mem_serial_in(struct uart_port *p, int offset)
{
        offset = map_8250_in_reg(p, offset) << p->regshift;
	return readb(p->membase + offset);
}

It appears the base and offset are interchanged in ldb.

0000000040343818 <serial8250_backup_timeout>:
    40343818:   08 03 02 41     copy r3,r1
    4034381c:   0f c2 12 c1     std rp,-10(sp)
    ...
    403439d0:   08 1b 02 44     copy dp,r4
    403439d4:   34 19 00 02     ldi 1,r25
    403439d8:   53 5c 00 30     ldd 18(r26),ret0
    403439dc:   37 dd 3f a1     ldo -30(sp),ret1
    403439e0:   53 82 00 20     ldd 10(ret0),rp
    403439e4:   e8 40 f0 00     bve,l (rp),rp
    403439e8:   53 9b 00 30     ldd 18(ret0),dp
==> 403439ec:   08 04 02 5b     copy r4,dp
    403439f0:   08 1c 02 46     copy ret0,r6


--G4iJoqBmSsgzjUCe--
