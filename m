From: "Carlos O'Donell" <carlos@systemhalted.org>
Subject: [parisc-linux] Q: TLS local dynamic case and zero initialized
	ti_offset?
Date: Sat, 8 Apr 2006 18:16:13 -0400
Message-ID: <119aab440604081516v7613ab2and79c35d084e83cba@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=ISO-8859-1
To: "Randolph Chung" <randolph@tausq.org>,
 parisc-linux <parisc-linux@lists.parisc-linux.org>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

Randolph,

In the local dynamic case we emit one reloc R_PARISC_TLS_DTPMOD32.
This means that at runtime there is a GOT entry with an absoluate
address which points to a tls_index structure, which has it's
ti_module filled by the dynamic loader (after processing the DTPMOD32
reloc). The question I have is, does this tls_index appear in bss? Is
the offset ti_offset initialized to zero? The zero offset is required
since we want __tls_get_addr to return the start of the modules block,
so we can subsequently offset into that block without calling
__tls_get_addr again.

Cheers,
Carlos.
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
