Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Date: Mon, 30 Dec 2002 00:15:41 -0700
To: John David Anglin <dave@hiauly1.hia.nrc.ca>
Cc: parisc-linux@parisc-linux.org
Subject: Re: [parisc-linux] misaligned data
Message-ID: <20021230071541.GI30857@dsl2.external.hp.com>
References: <20021228020104.C109D4829@dsl2.external.hp.com> <200212280249.gBS2nIPI002930@hiauly1.hia.nrc.ca>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <200212280249.gBS2nIPI002930@hiauly1.hia.nrc.ca>
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

On Fri, Dec 27, 2002 at 09:49:18PM -0500, John David Anglin wrote:
...
> > Not sure if it's safe to just pad "struct sctp_cookie" or if something
> > else needs to be done.
> 
> I'd wonder more about the packed attribute on sctp_init_chunk_t and
> sctp_inithdr_t.

I think that's the problem.

I've wimped out and just disabled CONFIG_IP_SCTP.
I really want to chase final problems with 2.4 and get $#@&% XF86
working on the OB600CT again (yes, XF86 4.0 worked, 4.2 does not :^( )


> What version of gcc?

In reflecting on it a bit more, I'm pretty sure I tried gcc-3.2
and came to the same result.
("gcc version 3.2.2 20021212 (Debian prerelease)")

grant
