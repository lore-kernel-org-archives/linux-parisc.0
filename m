Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id RAA11145
	for <parisc-linux@puffin.external.hp.com>; Mon, 4 Dec 2000 17:48:42 -0700
Message-Id: <200012050050.TAA07749@hiauly1.hia.nrc.ca>
Subject: Re: pa reload problem
To: alan@linuxcare.com.au (Alan Modra)
Date: Mon, 4 Dec 2000 19:50:58 -0500 (EST)
From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Cc: rhirst@linuxcare.com, parisc-linux@thepuffingroup.com
In-Reply-To: <Pine.LNX.4.21.0012051014060.16721-100000@front.linuxcare.com.au> from "Alan Modra" at Dec 5, 2000 10:59:45 am
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
List-ID: <linux-parisc.vger.kernel.org>

> Hi Dave,
>   Richard and I had wandered off-topic in the above exchange, and were
> talking about modutils and stubs, in particular stub calls to millicode.
> 
> Getting back on topic, the reload problem _does_ affect 32 bit hppa code.
> Compiling my testcase with -O2 -fPIC -S, gives
> 
>         copy %r19,%r4
>         bl foo,%r2
>         stw %r19,-32(%r30)
>         addil LT'cpu_hz,%r4
>         copy %r1,%r21
>         addil LT'.LC0,%r19		! oops

For some reason, I only saw this with the 64 bit version.

There is one other bit of code in rtlanal.c related to the patch which
bothers me.  I am wondering if it is ok or needs changing:

#ifndef PIC_OFFSET_TABLE_REG_CALL_CLOBBERED
      /* ??? When call-clobbered, the value is stable modulo the restore
         that must happen after a call.  This currently screws up local-alloc
         into believing that the restore is not needed.  */
      if (x == pic_offset_table_rtx)
        return 0;
#endif

This is in rtx_unstable_p and rtx_varies_p.  Possibly, now that there is
a use until reload is complete, this problem is fixed and the
pic_offset_table_rtx should be stable even when
PIC_OFFSET_TABLE_REG_CALL_CLOBBERED?  See comment at beginning of
rtx_varies_p.

Dave
-- 
J. David Anglin                                  dave.anglin@nrc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6605)
