From: John David Anglin <dave@hiauly1.hia.nrc.ca>
Subject: Re: Testing Linux 2.6.39-rc's on rp3440
Date: Sun, 15 May 2011 11:18:20 -0400
Message-ID: <20110515151820.GA12449@hiauly1.hia.nrc.ca>
References: <20110514173357.GA8138@hiauly1.hia.nrc.ca>
Reply-To: John David Anglin <dave.anglin@nrc-cnrc.gc.ca>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
To: linux-parisc@vger.kernel.org
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <20110514173357.GA8138@hiauly1.hia.nrc.ca>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On Sat, 14 May 2011, John David Anglin wrote:

> -----------------  Processor 2 HPMC Information - PDC Version: 46.34  ------ 
> 
> Timestamp =   Sat May  14 14:56:22 GMT 2011    (20:11:05:14:14:56:22)
> 
> HPMC Chassis Codes
> 
>        Chassis Code        Extension
>        ------------        ---------
>        0xe800035c00e00000 0x0000000000000000
>        0x57000f7300e00000 0x8040400000000000
>        0x5600100b00e00000 0x0000000000000194
>        0x5600106400e00000 0xfffffff0f0438e70
> 
...
> Control Registers 0 - 31
> 00-03  0000000000000000  0000000000000000  0000000000000000  0000000000000000
> 04-07  0000000000000000  0000000000000000  0000000000000000  0000000000000000
> 08-11  0000000000004c26  0000000000000000  00000000000000c0  000000000000003f
> 12-15  0000000000000000  0000000000000000  0000000000103000  ffe0000000000000
> 16-19  000001959bf4e395  0000000000000000  0000000000000000  0000000000000000
> 20-23  0000000000000000  0000000000000000  000000ff0804f900  8000000000000000
> 24-27  0000000000577000  000000003f82a000  fffffeffffffffff  00000000400016c0
> 28-31  0000000040002540  ffffffdfffffffff  000000007dfec000  ffffffdfffffffff

If I understand correctly, CR 22 is the interruption processor status
register.  I and Q are off, so a branch to 0 must have occurred in a ISR.

> ------------  I/O Module Error Log Information  ------------
> 
> IO Subsystem Log Entries
> 
> Found 7 IOC errors
> Found 7 PCI Bus errors
> ------------------------------------------------

It appears the format of these messages uses the structures described in
the Intel Itanium Processor Family System Abstraction Layer Specification:
http://download.intel.com/design/itanium/specupdt/245359.pdf

Unfortunately, the bus errors seem to be OEM specific...

Dave
-- 
J. David Anglin                                  dave.anglin@nrc-cnrc.gc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6602)
