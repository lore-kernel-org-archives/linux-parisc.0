From: Randolph Chung <randolph@tausq.org>
Subject: Re: [parisc-linux] interesting linker behaviour :)
Date: Tue, 21 Sep 2004 12:49:39 -0700
Message-ID: <20040921194939.GT22642@tausq.org>
References: <20040921174353.GB13248@baldric.uwo.ca>
	<200409211851.i8LIpT1Z009455@hiauly1.hia.nrc.ca>
Reply-To: Randolph Chung <randolph@tausq.org>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii
Cc: parisc-linux@lists.parisc-linux.org
To: John David Anglin <dave@hiauly1.hia.nrc.ca>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <200409211851.i8LIpT1Z009455@hiauly1.hia.nrc.ca>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

> Good catch!  I've hit this problem before but under HP-UX.  GAS doesn't
> support the alternate entry point fixup needed to support multiple
> entry points to a function.  I don't think anyone has tried to support
> this with the ELF tools.  There could be some nasty interactions with
> the HP unwind data when you start adding multiple entry points to a
> function.

yeah, it will break unwinding :(

> I haven't looked at this in detail but possibly you can change the
> fixup table to contain pc-relative offsets.  I looked at this
> when I reworked the casesi pattern in GCC a few months ago.  This
> makes the table smaller and in many cases the number of instructions
> is less than that with branches in the table (particularly for the
> PIC case).  

well, this is what we used to do, but we don't do this now because it
requires us to be able to do a pc-relative calculation between code in
two different sections (text and fixup), and GAS doesn't allow that
either.

for now i'm using the solution we are using for 64-bit code, which is to
use a manually created long-branch stub (ldil/ldo/bv). since this is 
anyway in a slow-path the performance hit is probably negligible.

randolph
-- 
Randolph Chung
Debian GNU/Linux Developer, hppa/ia64 ports
http://www.tausq.org/
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
