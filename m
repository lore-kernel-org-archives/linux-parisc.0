Received: from atlrel1.hp.com (atlrel1.hp.com [156.153.255.210])
	by puffin.external.hp.com (8.9.3/8.9.3) with ESMTP id RAA05238
	for <parisc-linux@puffin.external.hp.com>; Thu, 30 Nov 2000 17:30:40 -0700
Received: from mailserv2.iuinc.com (mailserv2.iuinc.com [206.245.164.55])
	by atlrel1.hp.com (Postfix) with SMTP id A7963A11
	for <parisc-linux@puffin.external.hp.com>; Thu, 30 Nov 2000 19:33:08 -0500 (EST)
Received: from linuxcare.com.au (HELO front.linuxcare.com.au) (203.29.91.49)
  by mailserv2.iuinc.com with SMTP; 1 Dec 2000 00:24:04 -0000
Received: from localhost (alan@localhost)
	by front.linuxcare.com.au (8.9.3/8.9.3/Debian 8.9.3-21) with ESMTP id LAA08568;
	Fri, 1 Dec 2000 11:23:42 +1100
Date: Fri, 1 Dec 2000 11:23:42 +1100 (EST)
From: Alan Modra <alan@linuxcare.com.au>
To: John David Anglin <dave@hiauly1.hia.nrc.ca>,
        Jeffrey A Law <law@cygnus.com>
Cc: Richard Hirst <rhirst@linuxcare.com>, parisc-linux@thepuffingroup.com
Message-ID: <Pine.LNX.4.21.0012011102290.2814-100000@front.linuxcare.com.au>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Subject: [parisc-linux] pa reload problem
List-ID: <linux-parisc.vger.kernel.org>

Hi Dave, Jeff,
  This little testcase triggers a bug on hppa64.  It's been around for
quite a while, so it's not something due to Dave's recent changes.

*******
extern void foo (int);
extern unsigned int cpu_hz;

int hppa_dp_bug (void)
{
  foo (42);
  return (5 * ((unsigned long)cpu_hz / 1000000UL));
}
*******

-O2 generates code like

        b,l foo,%r2
        copy %r27,%r4
        addil LT'cpu_hz,%r4	! know r27 trashed in call, so use r4
        ldd RT'cpu_hz(%r1),%r1
        ldd -144(%r30),%r2
        ldw 0(%r1),%r19
        addil LT'L$C0000,%r27	! oops, should be using r4
        ldd RT'L$C0000(%r1),%r1

The bad code codes from config/pa/pa.c:legitimize_pic_address

  if (GET_CODE (orig) == SYMBOL_REF)
    {
      if (reg == 0)
	abort ();

      if (flag_pic == 2)
	{
	  emit_move_insn (reg,
			  gen_rtx_PLUS (word_mode, pic_offset_table_rtx,
					gen_rtx_HIGH (word_mode, orig)));

To fix the problem, it seems to me that we should be testing whether
pic_offset_table_rtx is valid at this point, and if not, use the saved reg
instead.  I'm not exactly sure how to go about testing whether r27 is
valid here, and I'm sure one of you can point me in the right direction.

Alan Modra
-- 
Linuxcare.  Support for the Revolution.
