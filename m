From: Randolph Chung <randolph@tausq.org>
Subject: Re: [parisc-linux] ELF ABI Documents
Date: Tue, 18 Apr 2006 11:00:24 +0800
Message-ID: <44445648.5050004@tausq.org>
References: <1145324814.24150.12.camel@localhost.localdomain>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=ISO-8859-1
Cc: parisc-linux@lists.parisc-linux.org
To: Jeff Bailey <jbailey@raspberryginger.com>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <1145324814.24150.12.camel@localhost.localdomain>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

> It's most common in the LSB specs to refer to the ELF psabi document
> where possible.  http://refspecs.freestandards.org/elf/elf-pa.pdf seems
> to be a copy of the psabi document, but when checking with some folks,
> it looks like the document isn't a reflection on reality for
> parisc-linux.  The question is, should the document be updated to
> reflect reality, should we slowly change to match the document, or
> should I just not refer to the psabi document much when writing the LSB
> document?

First of all, I want to say that such a document would be wonderful to have!

I think the ELF-PA document corresponds mostly with what we do on
parisc-linux. There are some things we don't implement (e.g. I don't
think we have PCREL14WR/PCREL14DR), and we have made some enhancements
in other areas (e.g. TLS relocations). The only thing that I know of
where we don't follow the spec is how we handle SEGREL32 - we don't use
a SEGBASE relocation to set the segment base, but rely on other
information from the ELF headers.

I don't think the ELF spec talks about calling conventions and syscall
conventions though. For that, parisc-linux mostly follows the SOM spec
for calling conventions
(http://ftp.parisc-linux.org/docs/arch/pa-runtime-32-SOM.pdf)

A document about hppa ABI will not be complete without some discussion
about the hppa unwinding mechanism too.

my 2 cents :)
randolph
-- 
Randolph Chung
Debian GNU/Linux Developer, hppa/ia64 ports
http://www.tausq.org/
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
