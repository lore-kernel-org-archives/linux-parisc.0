Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Date: Sun, 29 Dec 2002 22:39:57 -0700
To: John David Anglin <dave@hiauly1.hia.nrc.ca>
Cc: parisc-linux@parisc-linux.org
Subject: Re: [parisc-linux] misaligned data
Message-ID: <20021230053957.GA30857@dsl2.external.hp.com>
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
> I'd wonder more about the packed attribute on sctp_init_chunk_t and
> sctp_inithdr_t.  What version of gcc?

sorry...I overlooked the attribute.

gcc version 3.0.4

I don't recall if I tried gcc-3.2.

thanks,
grant
