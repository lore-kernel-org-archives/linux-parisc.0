From: Tom Rini <trini@kernel.crashing.org>
Subject: Re: [parisc-linux] Generic RTC driver in 2.4.x?
Date: Thu, 26 Dec 2002 10:55:29 -0700
Message-ID: <20021226175529.GB6867__27956.6794787117$1416622051$gmane$org@opus.bloom.county>
References: <Pine.GSO.4.21.0212241451450.1821-100000@vervain.sonytel.be> <20021224235147.GT19331@tausq.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Cc: Geert Uytterhoeven <geert@linux-m68k.org>,
	parisc-linux@parisc-linux.org,
	Linux/PPC Development <linuxppc-dev@lists.linuxppc.org>,
	Linux/m68k <linux-m68k@lists.linux-m68k.org>,
	Linux Kernel Development <linux-kernel@vger.kernel.org>
To: Randolph Chung <randolph@tausq.org>
Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
In-Reply-To: <20021224235147.GT19331@tausq.org>
Errors-To: parisc-linux-admin@lists.parisc-linux.org
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux/>

On Tue, Dec 24, 2002 at 03:51:47PM -0800, Randolph Chung wrote:
> > AFAIK the generic RTC driver is used on PA-RISC, PPC, and m68k.
> > 
> > Are you interested in a backport to 2.4.x?
> 
> On parisc we already have a version of the generic RTC driver in our
> 2.4 tree. If there's something more "official" or common we can adopt
> that version. 

Similarly, PPC has had it's own 'generic' RTC driver in the kernel for
ages, so there's no pressing need, but if the 2.5 version makes its way
back into 2.4 (as the 2.5 version has some minor changes needed for
everyone which weren't in the 2.4 m68k version), we can easily switch to
that version.

-- 
Tom Rini (TR1265)
http://gate.crashing.org/~trini/
