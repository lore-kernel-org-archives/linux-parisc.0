Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Date: Mon, 28 Jul 2003 15:22:55 -0600
From: Grant Grundler <grundler@parisc-linux.org>
To: Matthew Wilcox <willy@debian.org>
Cc: Joel Soete <jsoe0708@tiscali.be>,
	Grant Grundler <grundler@parisc-linux.org>,
	parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] k-2.6.0-test2-pa0: __canonicalize_f_f_c patch
Message-ID: <20030728212255.GA24918@dsl2.external.hp.com>
References: <3F056E95000057BB@ocpmta4.freegates.net> <20030728161043.GB3840@parcelfarce.linux.theplanet.co.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20030728161043.GB3840@parcelfarce.linux.theplanet.co.uk>
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

On Mon, Jul 28, 2003 at 05:10:43PM +0100, Matthew Wilcox wrote:
> > +EXPORT_SYMBOL(sys_wait4);
> 
> this bit seems unrelated; why do we need it?

It was missing in 2.4 module builds...but silly me can't find
which 2.4.21 module (*.o)...*sigh*.
Maybe my favorite other arches just confused me:
grundler@gsyprf11:/usr/src/2.4.21$ find -name '*.[chS]' | xargs fgrep
sys_wait4 | fgrep EXPORT
./arch/alpha/kernel/alpha_ksyms.c:EXPORT_SYMBOL(sys_wait4);
./arch/arm/kernel/armksyms.c:EXPORT_SYMBOL(sys_wait4);
./arch/parisc/kernel/parisc_ksyms.c:EXPORT_SYMBOL(sys_wait4);
./arch/x86_64/kernel/x8664_ksyms.c:EXPORT_SYMBOL(sys_wait4);

It's possible this is deprecated.

thanks,
grant
