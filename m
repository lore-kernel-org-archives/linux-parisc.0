Return-Path: <hppa-linux@thepuffingroup.com>
Date: Sat, 27 Feb 1999 00:43:30 -0500 (EST)
From: Alex deVries <adevries@redhat.com>
To: hppa-linux@thepuffingroup.com
Subject: Re: [hppa-linux] Another bootstrap test
In-Reply-To: <199902262352.RAA13983@equator.com>
Message-ID: <Pine.LNX.3.96.990227003737.18143G-100000@devserv.devel.redhat.com>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Resent-Message-ID: <"uAIGx2.0.pI.MOurs"@sod.res.cmu.edu>
Reply-To: hppa-linux@thepuffingroup.com
List-Id: linux-parisc.vger.kernel.org


On my 715/75, it never actually gets past "(kernel size = 28672) Loading
kernel...", but here are the registers: 

PO_IMM_max_mem:       100663296 (96MB)
PO_BOOTCPU_10msec:    750000
PO_COUT_class:        0x000000009
PO_CIN_class:         0x000000008
PO_BOOTDEV_class:     0x000000001

Incidentally, I'm working with Jason to put the bootloader up on the FTP
site and in the CVS server.  We really need a name, though.  I'd suggest
HILO, in the pattern of LILO, MILO, SILO, and the other MILO[1].

- Alex

[1] Yes, there are two.  It turns out getting the Alpha one to work on
MIPS is an impossible dream.

-- 
Alex deVries <puffin@redhat.com>     
Red Hat Contrib Net maintainer          
Ottawa, Canada  
HPPA/Linux Porting Team


-------------------------------------------------------------------------
To unsubscribe: send e-mail to hppa-linux-request@thepuffingroup.com with
`unsubscribe' as the subject.
