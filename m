Received: from front.linuxcare.com.au (linuxcare.com.au [203.29.91.49])
	by puffin.external.hp.com (8.9.3/8.9.3) with ESMTP id QAA27435
	for <parisc-linux@puffin.external.hp.com>; Mon, 15 Jan 2001 16:14:23 -0700
Received: from localhost (alan@localhost)
	by front.linuxcare.com.au (8.9.3/8.9.3/Debian 8.9.3-21) with ESMTP id KAA05269;
	Tue, 16 Jan 2001 10:17:52 +1100
Date: Tue, 16 Jan 2001 10:17:52 +1100 (EST)
From: Alan Modra <alan@linuxcare.com.au>
To: John David Anglin <dave@hiauly1.hia.nrc.ca>
cc: law@redhat.com, gcc-patches@gcc.gnu.org,
        parisc-linux@puffin.external.hp.com
Subject: Re: Oust HPPA PIC_OFFSET_TABLE_REGNUM_SAVED
In-Reply-To: <200101151624.LAA26183@hiauly1.hia.nrc.ca>
Message-ID: <Pine.LNX.4.21.0101161009040.4272-100000@front.linuxcare.com.au>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
List-ID: <linux-parisc.vger.kernel.org>

On Mon, 15 Jan 2001, John David Anglin wrote:

> The effect of these rules is that gp must be treated as a scratch register
> at a point of call but a procedure must preserve it from entry to exit.

Interestingly, gcc currently does not always preserve gp.

extern void foo (void);
int main (void) { foo(); return 0; }

compiled with -O gives

        std %r2,-16(%r30)
        ldo 128(%r30),%r30
        std %r3,-128(%r30)
        copy %r27,%r3
        b,l __main,%r2
        ldo -16(%r30),%r29
        copy %r3,%r27
        b,l foo,%r2
        ldo -16(%r30),%r29
        ldi 0,%r28
        ldd -144(%r30),%r2
        bve (%r2)
        ldd,mb -128(%r30),%r3

and gp is not restored after the call to foo.

-- 
Linuxcare.  Support for the Revolution.
