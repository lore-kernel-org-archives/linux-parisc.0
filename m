From: Randolph Chung <tausq@debian.org>
Subject: Re: [parisc-linux] kernel module relocation bug
Date: Mon, 29 Nov 2004 11:46:18 -0800
Message-ID: <20041129194618.GM6359@tausq.org>
References: <1101742439.1714.11.camel@mulgrave>
	<200411291927.iATJRY3e032306@arbas.nms.ulrich-teichert.org>
Reply-To: Randolph Chung <tausq@debian.org>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii
Cc: James Bottomley <James.Bottomley@SteelEye.com>,
 PARISC list <parisc-linux@lists.parisc-linux.org>
To: Ulrich Teichert <krypton@ulrich-teichert.org>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <200411291927.iATJRY3e032306@arbas.nms.ulrich-teichert.org>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

> I've seen this quite often in userspace on hppa-linux, lately while building
> TAO (http://www.cs.wustl.edu/~schmidt/TAO.html).

what error do you see? the one that recommends rebuilding with
-ffunction-sections?

in your application, do you first build some .o's, link them together
into a bigger .o, and then use those to create your final application
image? (otherwise i don't think this problem should occur; if it does
there's a bug somewhere that we should fix).

> Wouldn't there a way to fix that somewhere else in the toolchain? Or is
> there a parisc machine code limitation in the way? I would really get rid of
> -ffunction-sections as it seems to generate slower executables. Could
> you please explain what needs to be done?

we have (or, rather, Dave has) been fixing this in various places. This
problem happens much less frequently now than it used to. Fixes may be
required either in gcc or in the linker to detect when a branch target
is too far away and needs to be converted to a long branch.

randolph
-- 
Randolph Chung
Debian GNU/Linux Developer, hppa/ia64 ports
http://www.tausq.org/
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
