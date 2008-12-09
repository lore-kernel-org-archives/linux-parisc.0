From: Kyle McMartin <kyle@infradead.org>
Subject: Re: 2.6.28-rcX in pretty bad shape on parisc
Date: Mon, 8 Dec 2008 23:14:21 -0500
Message-ID: <20081209041421.GG30783@bombadil.infradead.org>
References: <119aab440811250533y1a09a396i318dfc057ad0d659@mail.gmail.com> <20081208045003.4CF644E99@hiauly1.hia.nrc.ca> <20081208075001.GB28779@colo.lackof.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Cc: John David Anglin <dave@hiauly1.hia.nrc.ca>,
	Carlos O'Donell <carlos@systemhalted.org>, deller@gmx.de,
	linux-parisc@vger.kernel.org
To: Grant Grundler <grundler@parisc-linux.org>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <20081208075001.GB28779@colo.lackof.org>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On Mon, Dec 08, 2008 at 12:50:01AM -0700, Grant Grundler wrote:
> > So, the code is using the thread register (cr27).  Not sure what syscall
> > this is.  However, the problem might be TLS releated.
> 
> I have no idea if TLS makes a difference to kernel builds.
> 

I don't think Debian is using NPTL yet due to $issues previously
discussed...

linuxthreads being broken in newer glibc sounds unsuprisingly though.

regards, Kyle
