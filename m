Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Date: Fri, 29 Aug 2003 10:13:32 -0600
From: Grant Grundler <grundler@parisc-linux.org>
To: Joel Soete <jsoe0708@tiscali.be>
Cc: Jim Hull <jim.hull@hp.com>, parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] Re: [parisc-linux-cvs] linux carlos
Message-ID: <20030829161332.GA22468@dsl2.external.hp.com>
References: <3F4D78B0000005EE@ocpmta3.freegates.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <3F4D78B0000005EE@ocpmta3.freegates.net>
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

On Fri, Aug 29, 2003 at 05:59:53PM +0200, Joel Soete wrote:
> I just noticed the two following loops:
> flush_data_cache_local:

Note the names of the routines!
ie should only be called when we know only the local CPU is touching
data that needs to be flushed. This sounds like a risky
strategy to me given prefetching can occur to page
that's mapped cacheable.

> Do you think that could be there where the pb occurs?

I don't. There are likely other problems hidden there though.

grant
