Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from www.linux.org.uk (parcelfarce.linux.theplanet.co.uk [195.92.249.252])
	by dsl2.external.hp.com (Postfix) with ESMTP id 6BA74482B
	for <parisc-linux@parisc-linux.org>; Sat, 12 May 2001 19:29:31 -0600 (MDT)
Received: from willy by www.linux.org.uk with local (Exim 3.13 #1)
	id 14ykgr-00029G-00; Sun, 13 May 2001 02:28:57 +0100
Date: Sun, 13 May 2001 02:28:57 +0100
From: Matthew Wilcox <matthew@wil.cx>
To: John David Anglin <dave@hiauly1.hia.nrc.ca>
Cc: Matthew Wilcox <matthew@wil.cx>, parisc-linux@parisc-linux.org
Subject: Re: [parisc-linux] broken toolchain?
Message-ID: <20010513022857.D28266@parcelfarce.linux.theplanet.co.uk>
References: <20010513021522.B28266@parcelfarce.linux.theplanet.co.uk> <200105130123.VAA25847@hiauly1.hia.nrc.ca>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <200105130123.VAA25847@hiauly1.hia.nrc.ca>; from dave@hiauly1.hia.nrc.ca on Sat, May 12, 2001 at 09:23:47PM -0400
Sender: <willy@www.linux.org.uk>
List-ID: <linux-parisc.vger.kernel.org>

On Sat, May 12, 2001 at 09:23:47PM -0400, John David Anglin wrote:
> There still issues re the management of the PIC register.  These might
> cause the unaligned data accesses that you are seeing.  I know the
> mainline gcc was broken by a patch that Alan Modra added to add
> dwarf2 profiling support.  On the branch, things are better but I just
> discovered a new issue involving inline functions.  Don't know where
> things stand with the parisc-linux gcc source.

I don't think tat's the case.  Here's a dump:

!!die_if_kernel: ssh-keygen(6160): Unaligned data reference 28                  
                                                                                
     YZrvWESTHLNXBCVMcbcbcbcbOGFRQPDI                                           
PSW: 00000000000001001111111100001111                                           
r0-3     00000000 00030ed0 0001cd47 00000003                                    
r4-7     00000000 00000020 000000f6 bff04988                                    
r8-11    00000003 000312ea 0008e010 0008cef0                                    
r12-15   00000000 00000000 0008f350 00000000                                    
r16-19   00000000 00038f00 00000004 0001f800                                    
r20-23   00000005 40242090 000312ea 00000020                                    
r24-27   00000020 bff04988 00000003 00030ed0                                    
r28-31   00000003 00000037 bff04ac0 0001cd47                                    
sr0-3    00000000 00000185 00000000 00000185                                    
sr4-7    00000185 00000185 00000185 00000185                                    
                                                                                
IASQ: 00000185 00000185 IAOQ: 000127ab 000127af                                 
 IIR: 4835082e    ISR: 00000185  IOR: 000312e7                                  
ORIG_R28: bff00000                                                              

now r19 is 1f800 so it doesn't seem unaligned to me.  r22 or r9 look
like the problem children here.  i'll have to disassemble the source to
find out and I'm just going out so that'll have to wait till tomorrow.

-- 
Revolutions do not require corporate support.
