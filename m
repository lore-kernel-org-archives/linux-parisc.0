Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id OAA26379
	for <parisc-linux@puffin.external.hp.com>; Fri, 14 Jul 2000 14:40:36 -0600
Received: from ottawa.linuxcare.com (HELO localhost) (216.208.98.2)
  by mailserv2.iuinc.com with SMTP; 14 Jul 2000 20:42:11 -0000
To: law@cygnus.com
Cc: Alan Modra <amodra@linuxcare.com.au>, parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] Non-bootable kernel problems
References: <1991.963592762@upchuck> <87aefkzgpo.fsf@linuxcare.com>
From: David Huggins-Daines <dhd@linuxcare.com>
Date: 14 Jul 2000 16:40:36 -0400
In-Reply-To: David Huggins-Daines's message of "14 Jul 2000 14:53:23 -0400"
Message-ID: <8766q8zbqz.fsf@linuxcare.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
List-ID: <linux-parisc.vger.kernel.org>

David Huggins-Daines <dhd@linuxcare.com> writes:

> Jeffrey A Law <law@cygnus.com> writes:
> 
> > Either we need to avoid merging the section symbols to avoid twiddling
> > the addend, or we need to avoid reducing relocs to section symbols to
> > begin with.
> 
> We only reduce relocations to section symbols for static data.  It
> seems that every other platform I've investigated (Sparc, PowerPC,
> Alpha) does the same thing

Wait.  I'm wrong.  PowerPC doesn't:

static struct foo {
  int a;
  int b;
} a = {
  a: 42,
  b: 69
};

int main()
{
  gar(&a.b);
  ...
}

Compiles to:

  4c:	3d 20 00 00 	lis	r9,0
			4e: R_PPC_ADDR16_HA	a+0x4
  50:	38 69 00 04 	addi	r3,r9,4
			52: R_PPC_ADDR16_LO	a+0x4

Okay, I'll investigate this approach.

-- 
dhd@linuxcare.com, http://www.linuxcare.com/
Linuxcare. Support for the revolution.
