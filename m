Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Date: Tue, 7 Jan 2003 02:17:04 -0700
To: jsoe0708@tiscali.be
Cc: "Vlad D. Markov" <markov@monmouth.com>,
	parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] kernel panic when extracting large tar files
Message-ID: <20030107091704.GC4093@dsl2.external.hp.com>
References: <200301070054.h070rc5k047346@smtp.monmouth.com> <3DED9A660000447F@ocpmta3.freegates.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <3DED9A660000447F@ocpmta3.freegates.net>
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

On Tue, Jan 07, 2003 at 08:23:37AM +0100, jsoe0708@tiscali.be wrote:
...
> >Did not want to send the file to the whole group.
> >
> You would :-)

joel is right. See FAQ #17.
http://www.parisc-linux.org/faq/index.html

> Trap 5 on CPU 0
>  IIR: 6ab60038    ISR: 00000000  IOR: 1d7dcf3c
> Trap 5 on CPU 0
>  IIR: 22643206    ISR: 00000000  IOR: 10309800
> Trap 5 on CPU 0
>  IIR: 22643206    ISR: 00000000  IOR: 10309800
> Trap 5 on CPU 0
>
> which say that is a trap 5 (ie a LPMC). So, may me am i wrong, but it seems
> that there is a hardware problem on this machine?

yes. LPMC is usually a recoverable memory parity error.
ISR/IOR is the virtual address that was accessed.
Since this is kernel space (ISR==0), I think you can just
drop the leading 1 for the physical address.

Try pulling half the memory and see if the trap goes away.
Or replace all the memory if you have spares.

grant
