From: James Bottomley <James.Bottomley@steeleye.com>
Subject: Re: [parisc-linux] [PATCH] add MODULE_ALIAS_LDISC to
	asm-parisc/termios.h
Date: 04 Sep 2003 10:24:41 -0400
Message-ID: <1062685483.1829.6.camel__3268.75395044244$1416622756$gmane$org@mulgrave>
References: <20030904135315.GB2411@conectiva.com.br>
Mime-Version: 1.0
Content-Type: text/plain
Cc: Linus Torvalds <torvalds@osdl.org>,
	Matthew Wilcox <willy@debian.org>,
	Rusty Russell <rusty@rustcorp.com.au>,
	PARISC list <parisc-linux@lists.parisc-linux.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
To: Arnaldo Carvalho de Melo <acme@conectiva.com.br>
Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
In-Reply-To: <20030904135315.GB2411@conectiva.com.br>
Errors-To: parisc-linux-admin@lists.parisc-linux.org
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux/>

On Thu, 2003-09-04 at 09:53, Arnaldo Carvalho de Melo wrote:
> +#define MODULE_ALIAS_LDISC(ldisc) \
> +        MODULE_ALIAS("tty-ldisc-" __stringify(ldisc))

These are the strings used to identify the required line discipline
module to kmod, aren't they?

Since modprobe.conf seems to be generated without much regard for
architectures, is there any reason why this definition should differ
amongst architectures?  I think the answer's "no", so I think this fix
should be in linux/termios.h (or somewhere architecture independent).

James
