Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Date: Sat, 8 Mar 2003 19:15:38 -0700
To: "David S. Miller" <davem@redhat.com>
Cc: willy@debian.org, jsm@udlkern.fc.hp.com,
	parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] Re: RFC: mmap patch
Message-ID: <20030309021538.GA20553@dsl2.external.hp.com>
References: <20030308172439.GA10161@dsl2.external.hp.com> <20030308.110459.35972945.davem@redhat.com> <20030308224503.L3865@parcelfarce.linux.theplanet.co.uk> <20030308.150023.97153009.davem@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20030308.150023.97153009.davem@redhat.com>
From: grundler@dsl2.external.hp.com (Grant Grundler)
Sender: parisc-linux-admin@lists.parisc-linux.org
Errors-To: parisc-linux-admin@lists.parisc-linux.org
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux/>

On Sat, Mar 08, 2003 at 03:00:23PM -0800, David S. Miller wrote:
...
> People can continue to talk about all their bright new idea, which
> is fine, but it feels like my known-working ideas are being ignored.

As noted earlier, different problem.

Since about Nov 2002 we have been working on better {copy,clear}_user_page()
implementations quietly inside HP.  Unfortunately some, uhm, "issues" are
taking a long time to resolve before the routines can be published.
Once those issues are resolved, I think your trick with temporary
TLB entries can get implemented.

thanks,
grant
