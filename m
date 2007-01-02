From: David Howells <dhowells@redhat.com>
Subject: [parisc-linux] Re: Removing MAX_ARG_PAGES (request for
	comments/assistance)
Date: Tue, 02 Jan 2007 17:52:14 +0000
Message-ID: <22336.1167760334__19922.9401107461$1416624245$gmane$org@redhat.com>
References: <65dd6fd50610101705t3db93a72sc0847cd120aa05d3@mail.gmail.com>
Cc: Andrew Morton <akpm@osdl.org>,
 linux-arch@vger.kernel.org,
 Andi Kleen <ak@muc.de>,
 linux-kernel@vger.kernel.org,
 David Howells <dhowells@redhat.com>,
 linux-mm@kvack.org,
 Linus Torvalds <torvalds@osdl.org>,
 Ingo Molnar <mingo@elte.hu>,
 parisc-linux@lists.parisc-linux.org,
 Arjan van de Ven <arjan@infradead.org>
To: "Ollie Wild" <aaw@google.com>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <65dd6fd50610101705t3db93a72sc0847cd120aa05d3@mail.gmail.com> 
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

Ollie Wild <aaw@google.com> wrote:

> - I haven't tested this on a NOMMU architecture.  Could someone please
> validate this?

There are a number of potential problems with NOMMU:

 (1) The argument data is copied twice (once into kernel memory and once out
     of kernel memory).

 (2) The permitted amount of argument data is governed by the stack size of
     the program to be exec'd.  You should assume that NOMMU stacks cannot
     grow.

 (3) VMAs on NOMMU are a shared resource.

However, we might be able to extend your idea to improve things.  If we work
out the stack size required earlier, we can allocate the VMA and the memory
for the stack *before* we reach the point of no return.  We can then fill in
the stack and load up all the parameters *before* releasing the original
executable.  That would eliminate one of the copied mentioned in (1).  Working
out the stack size earlier may be difficult though, as we may need to load the
interpreter header before we can do so.

Overall, I don't think there should be too many problems with this for NOMMU.

David
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
