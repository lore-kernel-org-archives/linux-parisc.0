From: "Ollie Wild" <aaw@google.com>
Subject: [parisc-linux] Re: [patch] remove MAX_ARG_PAGES
Date: Sun, 31 Dec 2006 22:58:59 -0800
Message-ID: <65dd6fd50612312258i3bea1928m3d06c04fdbb5a7c__29239.240443758$1416624245$gmane$org@mail.gmail.com>
References: <65dd6fd50610101705t3db93a72sc0847cd120aa05d3@mail.gmail.com>
	<1160572460.2006.79.camel@taijtu>
	<65dd6fd50610111448q7ff210e1nb5f14917c311c8d4@mail.gmail.com>
	<65dd6fd50610241048h24af39d9ob49c3816dfe1ca64@mail.gmail.com>
	<20061229200357.GA5940@elte.hu>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=ISO-8859-1;
  format=flowed
Cc: Andrew Morton <akpm@osdl.org>,
 linux-arch@vger.kernel.org,
 Peter Zijlstra <a.p.zijlstra@chello.nl>,
 Andi Kleen <ak@muc.de>,
 linux-kernel@vger.kernel.org,
 David Howells <dhowells@redhat.com>,
 linux-mm@kvack.org,
 Linus Torvalds <torvalds@osdl.org>,
 parisc-linux@lists.parisc-linux.org,
 Arjan van de Ven <arjan@infradead.org>
To: "Ingo Molnar" <mingo@elte.hu>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <20061229200357.GA5940@elte.hu>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

On 12/29/06, Ingo Molnar <mingo@elte.hu> wrote:
>
> what is keeping this fix from going upstream?
>

There are still a couple outstanding issues which need to be resolved
before this is ready for inclusion in the mainline kernel.

The main one is support for CONFIG_STACK_GROWSUP, which I think is
just parisc.  I've been meaning to look into this for a while, but I
was out of commision for most of November so it got punted to the back
burner.  I'll try to revisit it soonish.  If someone from the
parisc-linux list wants to take a look, though, that's fine by me.

The other is support for the various executable formats.  I've tested
elf and script pretty thoroughly, but I'm not sure how to go about
testing most of the others -- does anyone use aout anymore?  Maybe the
solution is just to check it in and wait to see if someone complains.

Ollie
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
