From: Joel Soete <soete.joel@tiscali.be>
Subject: [parisc-linux] Does it lakes some cloberred r1 in
	__put_kernel_asm() 64bit?
Date: Sun, 16 Apr 2006 20:14:35 +0000
Message-ID: <4442A5AB.5080604@tiscali.be>
References: <IXJXEQ$C47DD9AC94AAFC817D7A8379F72B1E8E@scarlet.be>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii;
  format=flowed
To: Parisc List <parisc-linux@lists.parisc-linux.org>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <IXJXEQ$C47DD9AC94AAFC817D7A8379F72B1E8E@scarlet.be>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

Hello all,


I tried to apply my 'beautify' asm template to some uaccess.h and figure out that
this hunk din't mentioned that "r1" was cloberred (iirc in fixup text) while
the 32bit one did:

#ifdef __LP64__
#define __put_kernel_asm(stx,x,ptr)                         \
         __asm__ __volatile__ (                              \
                 "\n1:\t" stx "\t%2,0(%1)\n"                 \
                 "\t.section __ex_table,\"aw\"\n"            \
                 "\t.dword\t1b,fixup_put_user_skip_1\n"      \
                 "\t.previous"                               \
                 : "=r"(__pu_err)                            \
                 : "r"(ptr), "r"(x), "0"(__pu_err))
[snip]
#else
#define __put_kernel_asm(stx,x,ptr)                         \
         __asm__ __volatile__ (                              \
                "\n1:\t" stx "\t%2,0(%1)\n"                 \
                "\t.section __ex_table,\"aw\"\n"            \
                 "\t.word\t1b,fixup_put_user_skip_1\n"      \
                 "\t.previous"                              \
                : "=r"(__pu_err)                            \
                : "r"(ptr), "r"(x), "0"(__pu_err)           \
                : "r1")
[snip]

mmm, doesn't seems to change anything (I just check sys_parisc32.s) but may be elsewhere?

Thanks,
	Joel

_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
