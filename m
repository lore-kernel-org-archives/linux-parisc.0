Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Date: Mon, 17 Mar 2003 09:21:05 -0700
To: Randolph Chung <randolph@tausq.org>
Cc: Joel Soete <jsoe0708@tiscali.be>,
	Jan-Benedict Glaw <jbglaw@lug-owl.de>,
	parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] FC driver?
Message-ID: <20030317162105.GB31378@dsl2.external.hp.com>
References: <20030317111801.GF17073@lug-owl.de> <3E68A12A00002A77@ocpmta3.freegates.net> <20030317155235.GN26139@tausq.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20030317155235.GN26139@tausq.org>
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

On Mon, Mar 17, 2003 at 07:52:35AM -0800, Randolph Chung wrote:
> this is the "right" driver, but it doesn't work on parisc. Grant has
> poked at it a little bit but afaik it still doesn't work.

I was trying to get XL2 HBAs working - and at least now I can load
and unload the driver on parisc. But XL2 is still not working.
I thought 5100/5166 (TL) HBAs did work.

> The driver is
> not that well written either, so that doesn't help either :(

If someone wants to take over maintaining cpqfc driver, I suspect
that would be a welcome request. Please let me know and I'll
forward to the right people in HP. (I've had this conversation
with the current maintainers already.)

grant
