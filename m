From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Subject: [parisc-linux] Re: copy_user_page_asm suggested 64bit improvment
	[Was: [parisc-l
Date: Thu, 30 Dec 2004 12:04:17 -0500 (EST)
Message-ID: <200412301704.iBUH4IJv027820@hiauly1.hia.nrc.ca>
References: <20041230081034.GD31297@colo.lackof.org>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=US-ASCII
Cc: parisc-linux@lists.parisc-linux.org
To: grundler@parisc-linux.org (Grant Grundler)
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <20041230081034.GD31297@colo.lackof.org> from "Grant Grundler" at
	Dec 30, 2004 03:10:34 am
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

> Lamont tells me r23/24/28/29 are *caller* saves registers. 
> Ie I could r28/29 as well (or instead of r23/24).

Here is a summary of the uses for general call used registers.  These are
r1, r2 and r19 to r31.

Register			32-bit		64-bit
Arguments		       r23-r26 	       r19-r26
Argument Pointer		    NA		   r29
Static Chain			   r29		   r31
PIC Offset Table Pointer	   r19		   r27
Stack Pointer			   r30		   r30
Return Pointer			    r2		    r2
Millicode Return Pointer	   r31		    r2 (r31 for local millicode)
Pointer for $$dyncall		   r21		    NA

You can never use r30 and you can't use r2 without saving it.  Watch out
for the PIC register conventions.  Depending on circumstances, the rest
should be usable.

Dave
-- 
J. David Anglin                                  dave.anglin@nrc-cnrc.gc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6602)
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
