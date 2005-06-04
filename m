From: Alan Stern <stern@rowland.harvard.edu>
Subject: Re: [linux-usb-devel] Re: [parisc-linux] [PATCH] usb/input/hid-core.c
	extract() brain damage
Date: Sat, 4 Jun 2005 11:06:52 -0400 (EDT)
Message-ID: <Pine.LNX.4.44L0.0506041057560.5133-100000__36951.0752069347$1416624542$gmane$org@iolanthe.rowland.org>
References: <20050604072510.GD8230@colo.lackof.org>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN;
  charset=US-ASCII
Cc: John David Anglin <dave@hiauly1.hia.nrc.ca>,
 parisc-linux@parisc-linux.org,
 linux-usb-devel@lists.sourceforge.net,
 kyle@cabal.ca
To: Grant Grundler <grundler@parisc-linux.org>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <20050604072510.GD8230@colo.lackof.org>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

On Sat, 4 Jun 2005, Grant Grundler wrote:

> Yes, Kyle tracked it down to parisc switching from a parisc asm
> definition of get_unaligned() to using the generic ones.
> Ie we moved from avoiding kernel traps to exercising them.
> But 64-bit kernel worked fine with USB.
> And on 32-bit kernels le64() loads degenerate into two 32-bit
> loads. Ie the trap handler is still only dealing with 32-bit
> misaligned accesses like it would with this patch. So I don't
> think the kernel trap support is the problem.
> 
> Regardless, the two functions are badly written and could
> be alot clearer.

This is a naive question from someone who doesn't know much about the 
various implementations of get_unaligned() and put_unaligned().

In spite of the total overall number of changes required, wouldn't it be 
much simpler to have a suite of routines (inlines or macros) like:

	get_16, put_16, get_le16, put_le16, get_be16, put_be16
	get_32, put_32, get_le32, put_le32, get_be32, put_be32
	get_64, put_64, get_le64, put_le64, get_be64, put_be64

	in short, {get|put}_{|le|be}{16|32|64}

for native, little-endian, and big-endian unaligned accesses?  The generic 
definitions are extremely simple and architecture-specific headers could 
easily provide optimized versions.

I realize this doesn't fit in very well with the current state of the API, 
but IMHO it would be a big improvement.

Alan Stern

_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
