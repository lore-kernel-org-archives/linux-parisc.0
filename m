From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Subject: Re: [parisc-linux] Couple kernel problems
Date: Mon, 4 Dec 2006 18:25:03 -0500 (EST)
Message-ID: <200612042325.kB4NP4M0029780__15263.3616155528$1416624630$gmane$org@hiauly1.hia.nrc.ca>
References: <4574A336.3000007@excelcia.org>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=US-ASCII
Cc: parisc-linux@parisc-linux.org
To: kfitzner@excelcia.org (Kurt Fitzner)
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <4574A336.3000007@excelcia.org> from "Kurt Fitzner" at Dec 4,
	2006 03:37:42 pm
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

> dmesg reveals:
>  module xfs relocation of symbol $$divU is out of range (0x3ffefffd in
>  17 bits)

$$divU is a millicode routine.  There are special limitations on
branch distances for millicode.  If this was userspace, $$divU would
be linked into the module and stubs would handle out of range branches.
Millicode symbols are forced local so they can appear in more than
one module.

The above message suggests that the millicode library isn't being
linked with kernel modules and that the symbol is being resolved
by the kernel itself.  I could be all wet about this though...

The fix in this case is probably to build the module into the kernel.

Dave
-- 
J. David Anglin                                  dave.anglin@nrc-cnrc.gc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6602)
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
