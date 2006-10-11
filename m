From: Arjan van de Ven <arjan@infradead.org>
Subject: [parisc-linux] Re: Removing MAX_ARG_PAGES (request for
	comments/assistance)
Date: Wed, 11 Oct 2006 10:00:21 +0200
Message-ID: <1160553621.3000.355.camel__172.699036966328$1416624195$gmane$org@laptopd505.fenrus.org>
References: <65dd6fd50610101705t3db93a72sc0847cd120aa05d3@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain
Cc: Andrew Morton <akpm@osdl.org>,
 linux-arch@vger.kernel.org,
 Andi Kleen <ak@muc.de>,
 linux-kernel@vger.kernel.org,
 David Howells <dhowells@redhat.com>,
 linux-mm@kvack.org,
 Linus Torvalds <torvalds@osdl.org>,
 Ingo Molnar <mingo@elte.hu>,
 parisc-linux@lists.parisc-linux.org
To: Ollie Wild <aaw@google.com>
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

On Tue, 2006-10-10 at 17:05 -0700, Ollie Wild wrote:

on first sight it looks like you pin the entire userspace buffer at the
same time (but I can misread the code; this stuff is a bit of a
spaghetti by nature); that would be a DoS scenario if true...


 -- 
if you want to mail me at work (you don't), use arjan (at) linux.intel.com

_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
