From: Rusty Russell <rusty@rustcorp.com.au>
Subject: Re: [PATCH] parisc: fix module loading failure of large kernel modules (take 2)
Date: Wed, 31 Dec 2008 14:38:34 +1030
Message-ID: <200812311438.35394.rusty@rustcorp.com.au>
References: <4959346E.7060600@gmx.de> <200812310915.41693.rusty@rustcorp.com.au> <495AA891.2030104@gmx.de>
Mime-Version: 1.0
Content-Type: text/plain;
  charset="iso-8859-1"
Cc: "linux-parisc" <linux-parisc@vger.kernel.org>,
	Linux Kernel Development <linux-kernel@vger.kernel.org>,
	Kyle McMartin <kyle@mcmartin.ca>,
	Randolph Chung <randolph@tausq.org>,
	Linus <torvalds@linux-foundation.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	Sam Ravnborg <sam@ravnborg.org>,
	John David Anglin <dave@hiauly1.hia.nrc.ca>
To: Helge Deller <deller@gmx.de>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <495AA891.2030104@gmx.de>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On Wednesday 31 December 2008 09:32:41 Helge Deller wrote:
> BTW, although the comment states that arches can change section sizes 
> in the module_frob_arch_sections() function:
> /* Allow arches to frob section contents and sizes.  */
> it will break horrible if you do so.
> What I found was, that if you change sh_size, at least the module
> references / dependency chain will break when running lsmod.

Well, you can change the size of NOBITS sections: other things are likely
to be less successful.  You could probably make them smaller, though.

Cheers,
Rusty.
