From: Matthew Wilcox <matthew@wil.cx>
Subject: Re: [parisc-linux] binutils breaks hppa kernel build,
Date: Sat, 24 Sep 2005 19:49:06 -0600
Message-ID: <20050925014906.GC29038__20560.6145239019$1416623925$gmane$org@parisc-linux.org>
References: <20050924185439.GC7824@colo.lackof.org>
	<200509250127.j8P1RMGg002900@hiauly1.hia.nrc.ca>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii
Cc: 329888@bugs.debian.org,
 parisc-linux@lists.parisc-linux.org
To: John David Anglin <dave@hiauly1.hia.nrc.ca>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <200509250127.j8P1RMGg002900@hiauly1.hia.nrc.ca>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

On Sat, Sep 24, 2005 at 09:27:22PM -0400, John David Anglin wrote:
> The last "fic" opcode entry is wrong.  It's using the wrong
> instruction format, the mask is wrong, pa10 is wrong, etc.

I don't think we realised this until now.  I suspect we've been
silently emitting bad code up until this point, and given that it's
in flush_kernel_icache_page, maybe it explains some of our occasional
crashes.

The code was previously:

        fic,m           %r23(%r26)

We're trying to flush kernel space at this point, so we can use any of
sr4-sr7.   I suspect before we were putting sr0 in, which could have
been flushing any random space instead of the one we wanted.  I'll
commit this change to the kernel source now.
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
