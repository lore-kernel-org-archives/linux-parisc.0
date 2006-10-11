From: "Ollie Wild" <aaw@google.com>
Subject: [parisc-linux] Re: Removing MAX_ARG_PAGES (request for
	comments/assistance)
Date: Wed, 11 Oct 2006 10:13:26 -0700
Message-ID: <65dd6fd50610111013t6c783f3esc038c64abbcddeb0__33696.4876078584$1416624194$gmane$org@mail.gmail.com>
References: <65dd6fd50610101705t3db93a72sc0847cd120aa05d3@mail.gmail.com>
	<1160553621.3000.355.camel@laptopd505.fenrus.org>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=ISO-8859-1;
  format=flowed
Cc: Andrew Morton <akpm@osdl.org>,
 linux-arch@vger.kernel.org,
 Andi Kleen <ak@muc.de>,
 linux-kernel@vger.kernel.org,
 David Howells <dhowells@redhat.com>,
 linux-mm@kvack.org,
 Linus Torvalds <torvalds@osdl.org>,
 Ingo Molnar <mingo@elte.hu>,
 parisc-linux@lists.parisc-linux.org
To: "Arjan van de Ven" <arjan@infradead.org>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <1160553621.3000.355.camel@laptopd505.fenrus.org>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

> on first sight it looks like you pin the entire userspace buffer at the
> same time (but I can misread the code; this stuff is a bit of a
> spaghetti by nature); that would be a DoS scenario if true...

I'm not sure I understand.  Could you please elaborate?

Thanks,
Ollie
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
